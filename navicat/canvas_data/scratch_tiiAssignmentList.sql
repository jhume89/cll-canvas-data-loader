select acc.name as account_name, t.sortable_name as term_map, c.code as course_code, c.name as course_name, live_a.title as assignment_title, live_atype.assignment_type, if(live_atype.assignment_type = "TurnItIn", "tii_assignment", "other_assignment") as `isTII?`, fn_assignment_url(c.canvas_id, live_a.canvas_id) as assignment_url, teachers.teacher_list
from course_dim c
join account_dim acc on acc.id = c.account_id and c.workflow_state <> "deleted"
join vw_term_names t on t.term_id = c.enrollment_term_id
join cll_assignments live_a on live_a.course_canvas_id = c.canvas_id
join vw_cll_assignment_types live_atype on live_atype.assignment_canvas_id = live_a.canvas_id
left join vw_course_teacher_list teachers on teachers.course_id = c.id
where t.sortable_name = "2023 T1"
order by acc.name, c.code, live_a.title;