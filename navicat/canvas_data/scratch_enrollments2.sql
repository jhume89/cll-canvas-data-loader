select acc.name as account_name, c.code as course_code, t.sortable_name as term, u.name as student_name, REPLACE(r.name,"Enrollment","") as role_name, e.type as role_base_type, e.workflow_state as enrollment_state,
fn_course_url(c.canvas_id) as course_url
from account_dim acc
join course_dim c on c.account_id = acc.id and c.workflow_state <> "deleted"
join vw_term_names t on t.term_id = c.enrollment_term_id
join enrollment_dim e on e.course_id = c.id
join user_dim u on u.id = e.user_id
join role_dim r on r.id = e.role_id
WHERE acc.id in (select m.account_id from ls_monitored_accounts_he m) and e.workflow_state <> "deleted" and e.workflow_state <> "rejected"
order by t.sortable_name DESC, account_name, course_code, role_base_type DESC, role_name, student_name;




