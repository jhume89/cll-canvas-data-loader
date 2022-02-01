SET @enrollmentsFromDate = '2021-08-01';
SET @startOfTri = '2021-09-01';
SET @endOfTri = '2021-12-31';

SELECT 
  -- subs.export_cutoff_AEST AS export_cutoff_AEST,
  -- convert_tz(subs.enrollment_created_at, 'UTC', 'Australia/Melbourne' ) AS enrollment_created_at_AEST,
	subs.course_account AS course_account,
	subs.student_degree AS student_degree,
  subs.student_name AS student_name,
  -- subs.user_id AS user_id,
  -- subs.enrollment_id AS enrollment_id,
  -- subs.course_id AS course_id,
  -- if(subs.course_code = this_unit.course_code, concat('_', subs.course_code), (concat( CHAR ( 0xe28087 USING utf8mb4 ), subs.course_code))) AS sortable_course_code,
	subs.course_code AS course_code,
  subs.course_name AS course_name,
  subs.term_map AS term_map,
  -- subs.assignment_id AS assignment_id,
  subs.assignment_title AS assignment_title,
  subs.assignment_type AS assignment_type,
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
  agroup.name AS assignment_group_name,
  subs.`assignment_group_total_weight` as `assignment_group_total_weight`,
  -- subs.`calculated_assignment_weight` as `calculated_assignment_weight`,
  -- subs.`score_weighted_contribution` as `score_weighted_contribution`,
  subs.`assignment_group_sum_possible` as `assignment_group_sum_possible`,
  -- subs.`assignment_points_possible` as `assignment_points_possible`,
  -- subs.`score_raw` as `score_raw`,
  -- subs.`score_percent` as `score_percent`,
  -- subs.`grade_raw` as `grade_raw`,
	-- (subs.calculated_due_state = 'due') AS is_due,
	-- (subs.calculated_due_state = 'due' AND subs.simple_submitted_state = '2_submitted') AS is_submitted,
  -- (subs.calculated_late_state = 'overdue') AS is_overdue,
  -- (subs.calculated_late_state = 'submitted_late') AS is_submitted_late,
  (subs.enrollment_created_at >= @enrollmentsFromDate AND subs.calculated_due_state = 'due') AS due_current_units,
  (subs.enrollment_created_at >= @enrollmentsFromDate AND subs.calculated_due_state = 'due' AND subs.simple_submitted_state = '2_submitted') AS submitted_current_units,
  (subs.enrollment_created_at >= @enrollmentsFromDate AND subs.calculated_late_state = 'overdue') AS overdue_current_units,
  (subs.enrollment_created_at >= @enrollmentsFromDate AND subs.calculated_late_state = 'submitted_late') AS submitted_late_current_units,
  -- (subs.enrollment_created_at >= @enrollmentsFromDate) AS is_current_unit,
  -- (subs.enrollment_created_at < @enrollmentsFromDate) AS is_prior_unit,
  (subs.enrollment_created_at < @enrollmentsFromDate AND subs.calculated_late_state = 'submitted_late') AS submitted_late_prior_units,
  (subs.enrollment_created_at < @enrollmentsFromDate AND subs.calculated_late_state = 'overdue') AS overdue_prior_units,
	IF(this_unit.course_id = subs.course_id, subs.`score_weighted_contribution`, 0) AS `this_course_score_weighted_contribution`,
	IF(this_unit.course_id = subs.course_id AND subs.calculated_due_state = 'due', 1, 0) AS `due_this_course`,
	IF(this_unit.course_id = subs.course_id AND subs.calculated_late_state = 'submitted_late', 1, 0) AS `late_this_course`,
	IF(this_unit.course_id = subs.course_id AND subs.calculated_late_state = 'overdue', 1, 0) AS `overdue_this_course`,
	this_unit.course_code AS `this_course_code` -- THIS JOIN CAUSES ALL ROWS/SCORES TO BE REPEATED PER CURRENT ENROLLMENT OF EACH STUDENT
	-- subs.speedgrader_url,
	-- CONCAT("https://collarts.instructure.com/courses/",c.canvas_id,"/assignments/",a.canvas_id) as assignment_url,
	-- subs.teacher_list AS teacher_list
FROM `vw_submission_state` subs
JOIN `course_dim` c ON subs.`course_id` = c.id
JOIN `assignment_dim` a on subs.assignment_id = a.id
JOIN `assignment_group_dim` agroup on agroup.id = a.assignment_group_id
JOIN (
	SELECT
		e2.user_id AS user_id,
		e2.course_id AS course_id,
		c.`code` AS course_code
	FROM vw_enrollment_dates e2
		JOIN course_dim c ON c.id = e2.course_id
	WHERE e2.enrollment_workflow_state = 'active' AND e2.course_start_at between @startOfTri AND @endOfTri
	) this_unit ON this_unit.user_id = subs.user_id
-- WHERE subs.student_degree = 'Fashion Marketing'
order by student_degree,course_account,student_name,subs.enrollment_created_at DESC,
	CONCAT(IF(subs.course_code = this_unit.course_code, '_', CHAR ( 0xe28087 USING utf8mb4 )), subs.course_code),course_name,calculated_due_at ASC,assignment_title;