SET @targetTerm= '2022 T3';

SELECT 
  -- subs.export_cutoff_AEST AS export_cutoff_AEST,
  -- convert_tz(subs.enrollment_created_at, 'UTC', 'Australia/Melbourne' ) AS enrollment_created_at_AEST,
	subs.course_account AS course_account,
	subs.student_degree AS student_degree,
	subs.collarts_student_id as collarts_student_id,
  subs.student_name AS student_name,
  -- subs.user_id AS user_id,
  -- subs.enrollment_id AS enrollment_id,
  -- subs.course_id AS course_id,
  -- if(subs.course_code = this_unit.course_code, concat('_', subs.course_code), (concat( CHAR ( 0xe28087 USING utf8mb4 ), subs.course_code))) AS sortable_course_code,
	subs.course_code AS course_code,
  subs.course_name AS course_name,
  subs.term_map AS term_map,
	subs.assignment_group_name AS assignment_group_name,
	-- subs.assignment_id AS assignment_id,
  subs.assignment_title AS assignment_title,
  subs.assignment_type AS assignment_type,
	subs.`assignment_group_total_weight` as `assignment_group_total_weight`,
  subs.`assignment_group_sum_possible` as `assignment_group_sum_possible`,
	subs.`calculated_assignment_weight` as `calculated_assignment_weight`,
	subs.`score_weighted_contribution` as `score_weighted_contribution`,
	subs.`score_percent` as `score_percent`,
	subs.`assignment_points_possible` as `assignment_points_possible`,
	subs.`score_raw` as `score_raw`,
	CONCAT("https://collarts.instructure.com/courses/",c.canvas_id,"/gradebook") as gradebook_url,
  convert_tz(subs.original_due_at, 'UTC', 'Australia/Melbourne' ) AS original_due_at_AEST,
  convert_tz(subs.override_due_at, 'UTC', 'Australia/Melbourne' ) AS override_due_at_AEST,
  convert_tz(subs.calculated_due_at, 'UTC', 'Australia/Melbourne' ) AS calculated_due_at_AEST,
  subs.calculated_due_state AS calculated_due_state,
  subs.submission_workflow_state AS submission_workflow_state,
  subs.simple_submitted_state AS simple_submitted_state,
  subs.calculated_late_state AS calculated_late_state,
  subs.calculated_late_days AS calculated_late_days,
  -- convert_tz(subs.submission_updated_at, 'UTC', 'Australia/Melbourne') AS submission_updated_at_AEST,
  convert_tz(subs.submitted_at, 'UTC', 'Australia/Melbourne') AS submitted_at_AEST,
	convert_tz(subs.graded_at, 'UTC', 'Australia/Melbourne') AS graded_at_AEST
FROM cll_mv_submission_states subs
JOIN `course_dim` c ON subs.`course_id` = c.id
WHERE course_code like 'MUTAS%' OR course_code like 'MPMPD5%' OR course_code like 'MPMPD6%'
-- AND subs.term_map = @targetTerm
order by term_map,course_account,subs.course_code,student_name,assignment_group_name,assignment_title;