select acc.name as account_name, t.sortable_name as term_name, u.sortable_name as user_name, c.code as course_code, c.name as course_name, e.workflow_state as enrollment_status, a.title as assignment_title, s.submitted_at,
fn_course_url(c.canvas_id) as course_url,
fn_assignment_url(c.canvas_id, a.canvas_id) as assignment_url

from account_dim acc
join course_dim c on c.account_id = acc.id
join vw_term_names t on t.term_id = c.enrollment_term_id
join enrollment_dim e on e.course_id = c.id and e.type = "StudentEnrollment" and e.workflow_state <> "deleted" and c.workflow_state <> "deleted"
join user_dim u on u.id = e.user_id
join assignment_dim a on a.course_id = c.id
join submission_dim s on s.assignment_id = a.id and s.user_id = u.id

where acc.name = "VETDSS"
AND t.sortable_name = "VETDSS - 2022"

order by acc.name, c.code, u.name;