select acc.canvas_id as account_canvas_id, acc.name as account_name, vt.sortable_name as term_map, lc.code as course_code, lc.name as course_name, lc.canvas_id as canvas_course_id, lc.sis_course_id as sis_course_id
from cll_courses lc
join account_dim acc on acc.canvas_id = lc.account_canvas_id
join vw_term_names vt on vt.canvas_id = lc.enrollment_term_canvas_id
where acc.id in (select `id` from ls_monitored_accounts_he)
AND vt.sortable_name = '2023 T2'
ORDER BY account_name, account_canvas_id, term_map, course_code