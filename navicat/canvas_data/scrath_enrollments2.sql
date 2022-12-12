SET @targetTermId = (select term_id from vw_term_names t where t.sortable_name = '2022 T1');

select acc.name as account_name, c.code as course_code, t.sortable_name as term_map, u.name as student_name, e.type as enrollment_type, e.workflow_state as enrollment_state
from account_dim acc
join course_dim c on c.account_id = acc.id and c.workflow_state <> "deleted"
join vw_term_names t on t.term_id = c.enrollment_term_id
join enrollment_dim e on e.course_id = c.id
join user_dim u on u.id = e.user_id
WHERE acc.id in (select account_id from ls_monitored_accounts_he)
and t.term_id = @targetTermId
order by account_name, course_code, enrollment_type DESC, student_name;




