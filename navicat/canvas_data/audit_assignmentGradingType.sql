select
	acc.name as account_name,
	c.code as course_code,
	t.name as term_name,
	agroup.name as `assignment_group`,
	a.title as assignment_title,
	atype.assignment_type as assignment_type,
	fn_gradebook_url(c.canvas_id) as gradebook_url,
	fn_assignment_url(c.canvas_id, a.canvas_id) as assignment_url,
	a.grading_type as grading_type,
	a.points_possible as assignment_points_possible,
	w.calculated_assignment_weight as `calculated_assignment_weight`,
	IF (GROUP_CONCAT(DISTINCT sister_a.grading_type SEPARATOR ' | ') LIKE '%|%', GROUP_CONCAT(sister_a.grading_type SEPARATOR ' | '), CONCAT(GROUP_CONCAT(DISTINCT sister_a.grading_type), ' (all match)')) as grading_type_per_assignment,
	GROUP_CONCAT(a.points_possible SEPARATOR ' | ') as points_per_assignment
from assignment_dim a
join assignment_dim sister_a on a.course_id = sister_a.course_id
join vw_assignment_type atype on a.id = atype.assignment_id
left join assignment_group_dim agroup on a.assignment_group_id = agroup.id
join vw_assignment_weight w on w.assignment_id = a.id
join course_dim c on c.id = a.course_id
join account_dim acc on acc.id = c.account_id and acc.id in (select id from ls_monitored_accounts)
join enrollment_term_dim t on t.id = c.enrollment_term_id
where a.created_at > '2021-11-01'
group by acc.name, c.code, a.canvas_id, agroup.name, a.title;