SELECT
	* 
FROM
	requests 
WHERE
	timestamp_month >= "2022-01" 
	LIMIT 1000;
	

SELECT DISTINCT
	http_method,
	web_application_controller,
	web_application_action 
FROM
	requests 
WHERE
	timestamp_day BETWEEN "2021-12-01" 
	AND "2021-12-10" 
ORDER BY
	web_application_controller,
	web_application_action;
	
-- EXPLAIN SELECT r.* from requests r WHERE r.timestamp_month >= "2022-01" and r.user_id in (SELECT vu.user_id FROM vw_major_degrees vu WHERE vu.degree_name = "Fashion Marketing" AND vu.latest_enrollment_dates LIKE "%2022%");

	
SELECT vu.degree_name, vu.user_name, r.*
FROM requests r
JOIN course_dim c on r.course_id = c.id AND c.canvas_id in (2116, 2091, 2104, 2413, 2106, 2107, 2434, 2403)
JOIN vw_major_degrees vu on vu.user_id = r.user_id
JOIN enrollment_dim e on e.course_id = c.id and e.user_id = vu.user_id and e.type = "StudentEnrollment"
ORDER BY vu.degree_name, vu.user_name
LIMIT 1000;


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
LEFT JOIN course_dim c on c.id = r.course_id or c.id = regex_substr(r.url, ".*/courses/([0-9]+)")
WHERE u.id in (select e.user_id from enrollment_dim e where e.type = "StudentEnrollment" AND e.workflow_state = "active" AND e.course_id in (select c.id from course_dim c where c.canvas_id in (2091, 2413, 2107, 2403)))
ORDER BY u.name, r.course_id;