SET @findDatesRegex :=
'(?msx)(.{0,16})(                         # Uses "x" mode so regex whitespace and comments are allowed.
			[Ww]eek\W?\d\d? | 									# Any mention of weekN thru Week NN
			(\d{1,4}\W\d{1,2}\W\d{1,4}) | 			# variations of d/m/yy thru yyyy-dd-mm
			(January|February|March|April|May[\d\W]|June|July|August|September|October|November|December) |
			(Jan[\d\W]|Feb[\d\W]|Mar[\d\W]|Apr[\d\W]|Jun[\d\W]|Jul[\d\W]|Aug[\d\W]|Sept?[\d\W]|Oct[\d\W]|Nov[\d\W]|Dec[\d\W])
		)(.{0,16})';
		
SET @currentTermId := (SELECT id from enrollment_term_dim where `name` = 'T1 2022');
SET @coursesCreatedFrom := '2021-10-11';

SELECT DISTINCT
  convert_tz(( SELECT max( a.updated_at ) FROM assignment_dim a ), 'UTC', 'Australia/Melbourne')  as export_cutoff_aest,
  `acc`.`name` as account_name,
	`c`.`id` as course_id,
	`c`.`canvas_id` as course_canvas_id,
	`c`.`enrollment_term_id` as term_id,
	`c`.`created_at` as course_created_at,
	`t`.`name` AS `term`,
	`c`.`code` as course_code,
	`c`.`name` as course_name,
	a.title as assignment_title,
	CONCAT('https://collarts.instructure.com/courses/',c.canvas_id,'/assignments/',a.canvas_id,'/edit') as assignment_url,
  CONCAT('"',CONCAT_WS('\n',
	  -- Check assignment status
		IF ((a.workflow_state = 'unpublished' AND aweight.calculated_assignment_weight > 0), 'This is a weighted/formal assignment but it is unpublished. Could it be published and use availability dates instead?', NULL),
		
		-- Check course date overrides
		IF (d.calculated_course_start <> is null AND c.created_at >= '2021-08-01', 'This Unit is not linked to the trimester\'s term dates. Should it be?', NULL), 
		IF (d.term_start is null AND c.created_at >= '2021-08-01', 'This Unit is not linked to the trimester\'s term dates. Should it be?', NULL), 
	
	  -- Check assignment date settings: impossible due dates, assignment availability/lock dates, etc.
	  IF(d.calculated_due_at < d.calculated_course_start, 'Due date is before the start of tri. Should the due date be changed?', NULL),
    IF (d.calculated_due_at < d.calculated_unlock_at, 'Due date falls before the assignment\'s Available From date, so students will be unable to submmit. Please adjust the due date and/or availability dates.', NULL),
    IF (d.calculated_due_at > d.calculated_lock_at, 'Due date falls after the assignment\'s Available Until date, so students will be unable to submit. Please adjust the due date and/or availability dates.', NULL),
    IF (d.calculated_due_at > d.calculated_course_end, 'Due date is after the end of tri. Should the due date be changed? ', NULL),
    IF (d.calculated_lock_at < d.calculated_course_start, 'The Available Until date falls before the start of tri, so the assignment will be locked for the whole of term. Please adjust the availability dates.', NULL),
		IF (d.calculated_lock_at < d.calculated_unlock_at, 'The Available From/Until dates are incorrect - the assignment will never be unlocked for students. Please adjust the availability dates.', NULL),
		IF (d.calculated_due_at IS NULL AND aweight.calculated_assignment_weight > 0, 'This is a weighted/formal assignment but it has no due date. Could we set one?', NULL),
		
		
		-- Check assignment content: mention of dates, weightings, Week Number
		if (offending_text.`match` IS NOT NULL, CONCAT('The assignment page content mentions one or more dates. If these are repeats of the due date, we recommend they be removed so you don\'t have to update them if/when the due date changes.\n    Example: "...', offending_text.`match`, '..."'), NULL),
		
		-- Check override groups configuration: are overrides being used in odd ways?
		IF ((`ovgroup`.`member_count` / `cohort`.`member_count`) > 0.33, 'Assignment has a large override group > 33% of the class. Are the groups/dates configured correctly?', NULL),
		IF ((`ovgroups`.`group_count` >= 4), 'Assignment has many override groups (4+). Are the groups/dates configured correctly?', NULL)
	  
	),'"') AS exceptions_description,
	a.workflow_state as `published?`,
	`cohort`.`member_count` as `#_students`,
	aweight.calculated_assignment_weight as `calculated_assignment_weight`,
	ovgroups.group_count as `#_override_groups`,
	`ovgroup`.`member_count` as `#_in_group`,
	convert_tz(d.calculated_course_start, 'UTC', 'Australia/Melbourne') AS course_start_aest,
  convert_tz(d.calculated_unlock_at, 'UTC', 'Australia/Melbourne') AS available_from_aest,
  convert_tz(d.calculated_due_at, 'UTC', 'Australia/Melbourne') AS due_at_aest,
  convert_tz(d.calculated_lock_at, 'UTC', 'Australia/Melbourne') AS available_until_aest,
  convert_tz(d.calculated_course_end, 'UTC', 'Australia/Melbourne') AS course_end_aest,
  convert_tz(`d`.term_start, 'UTC', 'Australia/Melbourne') AS tri_start,
  convert_tz(`d`.term_end, 'UTC', 'Australia/Melbourne') AS tri_end,
  convert_tz(d.original_unlock_at, 'UTC', 'Australia/Melbourne') AS original_unlock_at_aest,
  convert_tz(d.original_due_at, 'UTC', 'Australia/Melbourne') AS original_due_at_aest,
  convert_tz(d.original_lock_at, 'UTC', 'Australia/Melbourne') AS original_lock_at_aest,
  convert_tz(d.override_unlock_at, 'UTC', 'Australia/Melbourne') AS override_unlock_at_aest,
  convert_tz(d.override_due_at, 'UTC', 'Australia/Melbourne') AS override_due_at_aest,
  convert_tz(d.override_lock_at, 'UTC', 'Australia/Melbourne') AS override_lock_at_aest,
  d.overridden_unlock_flag,
	d.overridden_due_flag,
	d.overridden_lock_flag,
	d.assignment_override_id
FROM
	course_dim c
  join account_dim acc on (c.account_id = acc.id AND c.workflow_state <> 'deleted')
	join vw_assignment_due_date d on (d.course_id = c.id)
	join enrollment_term_dim t on (t.id = d.enrollment_term_id)
	join assignment_dim a on (a.id = d.assignment_id AND a.workflow_state <> 'deleted')
	join vw_assignment_weight aweight ON (a.id = aweight.assignment_id)
	left join enrollment_dim e on (e.id = d.enrollment_id AND e.workflow_state not in ('deleted', 'inactive', 'rejected'))
	left join (
	  select ovg.assignment_id, count(distinct ovg.assignment_override_id) as `group_count`
		from vw_assignment_due_date ovg
		group by ovg.assignment_id
	) ovgroups on ovgroups.assignment_id = d.assignment_id
	left join (
		select ovg.id, count(ou.user_id) as `member_count`
		from assignment_override_dim ovg
			left join assignment_override_user_dim ou on (
				ovg.id = ou.assignment_override_id
				and ovg.workflow_state <> 'deleted')
		group by ovg.id
	) ovgroup on ovgroup.id = d.assignment_override_id
	left join (
		select c2.id as course_id, count(e2.id) as `member_count`
		from course_dim c2 left join enrollment_dim e2 on
			(c2.id = e2.course_id
			AND e2.type = 'StudentEnrollment'
			AND e2.workflow_state NOT IN ('deleted', 'inactive', 'rejected') AND EXISTS(SELECT 1 FROM user_dim u WHERE u.id = e2.user_id AND u.workflow_state <> 'deleted' LIMIT 1))
		group by c2.id
	) cohort on cohort.course_id = c.id
	left join (
		select a2.id as assignment_id,
			a2.title as assignment_title,
			a2.description as assignment_description,
			CAST(REGEXP_SUBSTR(BINARY a2.description, @findDatesRegex) AS VARCHAR(256)) as `match`
		from assignment_dim a2
		join course_dim c2 on a2.course_id = c2.id
		where c2.enrollment_term_id = @currentTermId
		having `match` <> ""
	) offending_text on offending_text.assignment_id = a.id
WHERE c.enrollment_term_id = @currentTermId OR c.created_at > 
-- HAVING exceptions_description <> '""'
ORDER BY
term_start desc, account_name,course_code,original_due_at,d.assignment_id,d.calculated_due_at,d.assignment_override_id;