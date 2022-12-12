select acc.id as account_id, acc.name as account_name, c.code as course_code, c.name as course_name,
	max(t.sortable_name) as latest_term,
	GROUP_CONCAT(DISTINCT t.sortable_name ORDER BY t.sortable_name DESC SEPARATOR ", ") as all_terms,
	CONCAT(c.code," | ",max(t.sortable_name)) as code_and_term,
	c.canvas_id as course_canvas_id
from course_dim c
join account_dim acc on acc.id = c.account_id
join vw_term_names t on t.term_id = c.enrollment_term_id
where c.workflow_state <> "deleted"
and (
	(acc.id in (select account_id from ls_monitored_accounts_he) and t.sortable_name not in ("Default Term", "Past Units"))
	OR (acc.id = 55) -- Template shells incl. ElecTemp
)
group by account_id, account_name, course_code
order by account_name, account_id, course_code;