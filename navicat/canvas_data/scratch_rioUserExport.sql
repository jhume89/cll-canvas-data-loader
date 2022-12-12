select u.id as internal_canvas_id, p.sis_user_id as sis_user_id, u.sortable_name, u.name
from user_dim u 
join pseudonym_dim p on p.user_id = u.id;