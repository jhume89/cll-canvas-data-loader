SELECT
acc.`name` as account_name,
	`c`.`id` as course_id,
	`c`.`canvas_id` as course_canvas_id,
	`c`.`enrollment_term_id` as term_id,
	a.id as `assignment_id`,
	r.rubric_id as rubric_id,
	`c`.`created_at` as course_created_at,
	`tv`.`sortable_name` AS `term_map`,
	`c`.`code` as course_code,
	`c`.`name` as course_name,
	ravail.rubrics_available as rubrics_available,
	rused.rubrics_in_use as rubrics_in_use,
	a.title as assignment_title,
	CONCAT("https://collarts.instructure.com/courses/",c.canvas_id,"/assignments/",a.canvas_id) as assignment_url,
	CONCAT("https://collarts.instructure.com/courses/",c.canvas_id,"/rubrics/",r.rubric_canvas_id,"?rubric_association_id=",r.rubric_association_id) as rubric_url,
  CONCAT('"',CONCAT_WS('\n', NULL
		-- IF(d.calculated_due_at < d.original_due_at, 'Due before course start', NULL),
		-- IF(d.calculated_due_at < d.calculated_course_start, 'Due before course start', NULL),
		-- some other IFs
	),'"') AS problem_text,
	a.workflow_state as assignment_state,
	a.submission_types as submision_types,
	`cohort`.`member_count` as students_in_course,
	aweight.calculated_assignment_weight as `calculated_assignment_weight`,
  convert_tz(a.due_at, 'UTC', 'Australia/Melbourne') AS original_due_at_aest,
	if(rubric_id is not null, true, false) as has_rubric,
	convert_tz(r.rubric_retrieved_at, 'UTC', 'Australia/Melbourne')  as rubric_retrieved_at_aest,
	r.rubric_title as rubric_title,
	concat('"', replace(group_concat('[', lpad(r.criterion_points, GREATEST(length(r.criterion_points), 3), CHAR ( 0xe28087 USING utf8mb4 )), '] ', r.criterion_description ORDER BY r.criterion_ordinal SEPARATOR '\n\n'), '"', '`'), '"') as rubric_criteria,
	concat('"', replace(group_concat(replace(replace(r.criterion_ratings, '\n', '\\\\ '), '\\\\ [', '\n[') ORDER BY r.criterion_ordinal SEPARATOR '\n\n'), '"', '`'), '"') as criteria_ratings
FROM
	course_dim c
  join account_dim acc on (c.account_id = acc.id AND c.workflow_state <> 'deleted')
	join assignment_dim a on (a.course_id = c.id and a.workflow_state <> 'deleted')
	join vw_assignment_weight aweight ON (a.id = aweight.assignment_id)
	left join vw_term_name tv on (tv.id = c.enrollment_term_id)
	left join vw_assignment_rubrics r on r.assignment_id = a.id
	left join (
		select c2.id as course_id, count(e2.id) as `member_count`
		from course_dim c2 left join enrollment_dim e2 on
			(c2.id = e2.course_id
			AND e2.type = "StudentEnrollment"
			AND e2.workflow_state NOT IN ('deleted', 'inactive', 'rejected') AND EXISTS(SELECT 1 FROM user_dim u WHERE u.id = e2.user_id AND u.workflow_state <> 'deleted' LIMIT 1))
		group by c2.id
	) cohort on cohort.course_id = c.id
	left join (
		  select c.canvas_id as course_canvas_id, count(DISTINCT ri.id) as rubrics_available
		  from course_dim c
		  left join cll_rubrics ri on ri.context_id = c.canvas_id AND ri.context_type = 'Course'
		  GROUP BY c.canvas_id
		) ravail on ravail.course_canvas_id = c.canvas_id
	left join (
		  select c.canvas_id as course_canvas_id, count(DISTINCT ar.rubric_id) as rubrics_in_use
		  from course_dim c
			left join vw_assignment_rubrics ar on ar.course_id = c.id
		  GROUP BY c.canvas_id
		) rused on rused.course_canvas_id = c.canvas_id
GROUP BY term_id,account_name,course_id,a.id,r.rubric_id
ORDER BY
term_map desc, account_name,course_code,a.due_at;