select acc.name as account_name, vt.sortable_name as term_map, lc.code as course_code, lc.name as course_name, lc.canvas_id as canvas_course_id, lc.sis_course_id as sis_course_id
from cll_courses lc
join account_dim acc on acc.canvas_id = lc.account_canvas_id
join vw_term_names vt on vt.canvas_id = lc.enrollment_term_canvas_id
where vt.sortable_name = '2022 T3'