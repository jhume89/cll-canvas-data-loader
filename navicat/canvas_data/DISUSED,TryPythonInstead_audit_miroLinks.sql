select
  acc.name as account_name, 
  t.sortable_name as term_map,
	c.code as course_code,
	c.name as course_name,
	p.title,
	p.workflow_state,
	fn_wiki_page_url(c.canvas_id, p.url) as url,
	p.body
from wiki_page_dim p
JOIN wiki_page_fact f on p.id = f.wiki_page_id
JOIN course_dim c on c.id = f.parent_course_id
JOIN vw_term_names t on t.term_id = c.enrollment_term_id
JOIN account_dim acc on acc.id = c.account_id
where p.body like '%padlet.org/embed%' AND t.sortable_name = '2023 T2' AND p.workflow_state = 'active'
order by account_name, course_code

-- 
-- 
-- select a.canvas_id, a.course_id, c.code, c.name, a.workflow_state, t.name, a.title, a.description, clla.description as live_desc
-- from assignment_dim a
-- JOIN course_dim c on c.id = a.course_id
-- JOIN enrollment_term_dim t on c.enrollment_term_id = t.id
-- left join cll_assignments clla on clla.canvas_id = a.canvas_id
-- where a.description like '%echo360.net.au%'; #AND t.name = 'T1 2022';
-- 
-- select clla.canvas_id as clla_canvas, clla.course_canvas_id, c.code, c.name, t.name, clla.title, clla.description
-- from cll_assignments clla
-- JOIN course_dim c on c.canvas_id = clla.course_canvas_id
-- JOIN enrollment_term_dim t on c.enrollment_term_id = t.id
-- where clla.description like "%echo360.org.au%";
-- 
-- select clla.*, clla.canvas_id, clla.course_canvas_id, clla.title, clla.description
-- from cll_assignments clla
-- where external_tool_canvas_id is not null;