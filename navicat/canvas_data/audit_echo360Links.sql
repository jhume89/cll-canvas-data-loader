-- select p.id, c.id, c.code, c.name, t.name, p.title, p.body
-- from wiki_page_dim p
-- JOIN wiki_page_fact f on p.id = f.wiki_page_id
-- JOIN course_dim c on c.id = f.parent_course_id
-- JOIN enrollment_term_dim t on c.enrollment_term_id = t.id
-- where p.body like '%echo360.org.au%'; #AND t.name = 'T1 2022';
-- 
-- 
-- 
select a.canvas_id, a.course_id, c.code, c.name, a.workflow_state, t.name, a.title, a.description, clla.description as live_desc
from assignment_dim a
JOIN course_dim c on c.id = a.course_id
JOIN enrollment_term_dim t on c.enrollment_term_id = t.id
left join cll_assignments clla on clla.canvas_id = a.canvas_id
where a.description like '%echo360.net.au%'; #AND t.name = 'T1 2022';

select clla.canvas_id as clla_canvas, clla.course_canvas_id, c.code, c.name, t.name, clla.title, clla.description
from cll_assignments clla
JOIN course_dim c on c.canvas_id = clla.course_canvas_id
JOIN enrollment_term_dim t on c.enrollment_term_id = t.id
where clla.description like "%echo360.org.au%";

select clla.*, clla.canvas_id, clla.course_canvas_id, clla.title, clla.description
from cll_assignments clla
where external_tool_canvas_id is not null;