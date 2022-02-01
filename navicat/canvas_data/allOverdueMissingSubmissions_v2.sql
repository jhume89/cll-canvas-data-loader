SET @enrollmentsFromDate = '2021-08-01';
SET @due_cutoff = (SELECT (Date(convert_tz(max(submission_dim.updated_at), 'UTC', 'Australia/Melbourne'))) from submission_dim);

SELECT 
  subs.export_cutoff_AEST AS export_cutoff_AEST,
  convert_tz(subs.enrollment_created_at, 'UTC', 'Australia/Melbourne' ) AS enrollment_created_at_AEST,
	subs.course_account as course_account,
	subs.student_degree as student_degree,
  subs.student_name AS student_name,
  subs.user_id AS user_id,
  subs.enrollment_id AS enrollment_id,
  subs.course_id AS course_id,
  subs.course_code AS course_code,
  subs.course_name AS course_name,
  subs.term_map AS term_map,
  subs.assignment_id AS assignment_id,
  subs.assignment_title AS assignment_title,
  subs.assignment_type AS assignment_type,
  subs.assignment_workflow_state AS assignment_workflow_state,
  convert_tz(subs.original_due_at, 'UTC', 'Australia/Melbourne' ) AS original_due_at_AEST,
  convert_tz(subs.override_due_at, 'UTC', 'Australia/Melbourne' ) AS override_due_at_AEST,
  convert_tz(subs.calculated_due_at, 'UTC', 'Australia/Melbourne' ) AS calculated_due_at_AEST,
  subs.calculated_due_state AS calculated_due_state,
  subs.submission_workflow_state AS submission_workflow_state,
  subs.simple_submitted_state AS simple_submitted_state,
  subs.calculated_late_state AS calculated_late_state,
  subs.calculated_late_days AS calculated_late_days,
  convert_tz(subs.submission_updated_at, 'UTC', 'Australia/Melbourne') AS submission_updated_at_AEST,
  convert_tz(subs.submitted_at, 'UTC', 'Australia/Melbourne') AS submitted_at_AEST,
  subs.assignment_group_id AS assignment_group_id,
  subs.assignment_points_possible AS assignment_points_possible,
  subs.assignment_group_sum_possible AS assignment_group_sum_possible,
  subs.calculated_assignment_weight AS calculated_assignment_weight,
  subs.assignment_group_total_weight AS assignment_group_total_weight,
	(select count(s.enrollment_id) from vw_submission_state s where s.enrollment_id = subs.enrollment_id AND s.calculated_due_state = 'due') AS due_this_unit,
	(select count(s.enrollment_id) from vw_submission_state s where s.enrollment_id = subs.enrollment_id AND s.calculated_due_state = 'due' AND s.simple_submitted_state = '2_submitted') AS submitted_this_unit,
	(select count(s.enrollment_id) from vw_submission_state s where s.enrollment_id = subs.enrollment_id AND s.calculated_late_state = 'overdue') AS overdue_this_unit,
	(select count(s.enrollment_id) from vw_submission_state s where s.enrollment_id = subs.enrollment_id AND s.calculated_late_state = 'submitted_late') AS submitted_late_this_unit,
	(select count(s.enrollment_id) from vw_submission_state s where s.user_id = subs.user_id AND s.enrollment_created_at >= @enrollmentsFromDate AND s.calculated_due_state = 'due') AS due_current_units,
	(select count(s.enrollment_id) from vw_submission_state s where s.user_id = subs.user_id AND s.enrollment_created_at >= @enrollmentsFromDate AND s.calculated_due_state = 'due' AND s.simple_submitted_state = '2_submitted') AS submitted_current_units,
	(select count(s.enrollment_id) from vw_submission_state s where s.user_id = subs.user_id AND s.enrollment_created_at >= @enrollmentsFromDate AND s.calculated_late_state = 'overdue') AS overdue_current_units,
	(select count(s.enrollment_id) from vw_submission_state s where s.user_id = subs.user_id AND s.enrollment_created_at >= @enrollmentsFromDate AND s.calculated_late_state = 'submitted_late') AS submitted_late_current_units,
	(select count(DISTINCT (s.enrollment_id)) from vw_submission_state s where s.user_id = subs.user_id AND s.enrollment_created_at >= @enrollmentsFromDate) AS count_current_enrollments,
	(select count(DISTINCT (s.enrollment_id)) from vw_submission_state s where s.user_id = subs.user_id) AS count_alltime_enrollments,
	(select count(s.enrollment_id) from vw_submission_state s where s.user_id = subs.user_id AND s.enrollment_created_at < @enrollmentsFromDate AND s.calculated_late_state = 'submitted_late') AS submitted_late_prior_units,
	(select count(s.enrollment_id) from vw_submission_state s where s.user_id = subs.user_id AND s.enrollment_created_at < @enrollmentsFromDate AND s.calculated_late_state = 'overdue') AS overdue_prior_units,
	subs.speedgrader_url,
	CONCAT("https://collarts.instructure.com/courses/",c.canvas_id,"/assignments/",a.canvas_id) as assignment_url,
	CONCAT("https://collarts.instructure.com/courses/",c.canvas_id,"/gradebook") as gradebook_url,
	subs.teacher_list AS teacher_list
FROM `vw_submission_state` subs
JOIN `course_dim` c ON subs.`course_id` = c.id
JOIN `assignment_dim` a on subs.assignment_id = a.id
WHERE subs.`enrollment_created_at` >= @enrollmentsFromDate
AND (convert_tz(subs.calculated_due_at, 'UTC', 'Australia/Melbourne' ) BETWEEN '2021-09-01' AND @due_cutoff) 
order by course_account,course_code,course_name,calculated_due_at,assignment_title,student_name;