select acc.canvas_id as canvas_account_id, acc.name as account_name, c.code as course_code, c.name as course_name, t.sortable_name as latest_term, "" as all_terms, CONCAT(c.code," | ",t.sortable_name) as code_and_term, c.canvas_id as course_canvas_id
from course_dim c
join account_dim acc on acc.id = c.account_id
join vw_term_names t on t.term_id = c.enrollment_term_id
where c.workflow_state <> "deleted"
and acc.id in (select account_id from ls_monitored_accounts_he)
and t.sortable_name not in ("Default Term", "Past Units")
and t.sortable_name >= "2022 T1"
order by account_name, canvas_account_id, course_code,latest_term DESC;