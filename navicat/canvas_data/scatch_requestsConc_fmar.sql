select
	CONCAT_WS(",",
		coalesce(r.collarts_student_id, ""),
		coalesce(r.user_name, ""),
		coalesce(r.course_code, ""),
		coalesce(r.req_time, ""),
		coalesce(r.timestamp_year, ""),
		coalesce(r.timestamp_month, ""),
		coalesce(r.timestamp_day, ""),
		-- coalesce(r.http_method, ""),
		-- coalesce(r.web_application_controller, ""),
		-- coalesce(r.web_application_action, ""),
		-- coalesce(r.url, ""),
		-- coalesce(r.http_status, ""),
		coalesce(r.discussion_id, ""),
		coalesce(r.conversation_id, ""),
		coalesce(r.assignment_id,  ""),
		coalesce(r.impersonating_user, ""),
		coalesce(r.user_agent_id, ""),
		coalesce(r.cll_request_id, "")
	) as record,
	concat(coalesce(r.web_application_controller, ""), ":", coalesce(r.web_application_action, ""), "::", r.url) as concatenated_url
from (
SELECT
	p.sis_user_id as collarts_student_id,
	u.name as user_name,
	c.`code` as course_code,
	r.timestamp as req_time,
	r.timestamp_year as timestamp_year,
	r.timestamp_month as timestamp_month,
	r.timestamp_day as timestamp_day,
	r.http_method,
	r.web_application_controller,
	r.web_application_action,
	r.url as url,
	r.http_status,
	r.discussion_id,
	r.conversation_id,
	r.assignment_id, 
	r.real_user_id as impersonating_user,
	r.user_agent_id,
	r.pkey as cll_request_id
FROM (select * from requests where course_id is NULL OR course_id in (select c.id from course_dim c where c.canvas_id in (2091, 2413, 2107, 2403))) r
JOIN user_dim u on u.id = r.user_id
LEFT JOIN pseudonym_dim p on p.user_id = u.id AND p.sis_user_id IS NOT NULL
LEFT JOIN course_dim c on c.id = r.course_id -- or c.id = regexp_substr(r.url, ".*/courses/([0-9]+)")
WHERE u.id in (select e.user_id from enrollment_dim e where e.type = "StudentEnrollment" AND e.workflow_state = "active" AND e.course_id in (select c.id from course_dim c where c.canvas_id in (2091, 2413, 2107, 2403)))
ORDER BY u.name, r.course_id
) r;
	