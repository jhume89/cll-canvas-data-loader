select
	acc.name as account_name,
	c.code as course_code,
	t.name as term_map,
	fn_canvas_url(CONCAT("/courses/", c.canvas_id, "/users")) as url,
	u.name as user_name,
	e.type as enrollment_type,
	e.workflow_state as enrollment_status,
	e.created_at as enrollment_created_at,
	(SELECT group_concat(t2.sortable_name SEPARATOR ",")
		FROM enrollment_dim e2
		JOIN course_dim c2 on c2.id = e2.course_id AND c2.code = c.code AND e2.user_id = u.id
		JOIN vw_term_names t2 on t2.term_id = c2.enrollment_term_id AND t2.sortable_name < t.sortable_name
		group by e2.user_id) as prior_enrollments
from enrollment_dim e
join course_dim c on c.id = e.course_id
join vw_term_names t on t.term_id = c.enrollment_term_id
join user_dim u on u.id = e.user_id
join account_dim acc on acc.id = c.account_id
where t.sortable_name = "2022 T1";