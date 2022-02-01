select 
	course_account_id, 
	course_id,
	timestamp_month,
	timestamp_day,
	web_application_context_type, 
	web_application_context_id, 
	-- http_method, 
	web_application_controller, 
	-- web_application_action, 
	user_agent,
	count(*) as request_count
	count(distinct user_id)
from requests r
where
	timestamp_day between "2021-12-06" AND "2021-12-20"
	AND (course_id IN (139370000000001880, 139370000000001881) OR (web_application_context_type = "Course" AND web_application_context_id IN (1880, 1881)))
	AND web_application_controller in (
group by
  course_account_id, 
	course_id,
	timestamp_month,
	timestamp_day,
	web_application_context_type, 
	web_application_context_id, 
	-- http_method, 
	web_application_controller, 
	-- web_application_action, 
	user_agent
order by
	course_account_id, 
	course_id,
	timestamp_month,
	timestamp_day,
	web_application_context_type, 
	web_application_context_id, 
	-- http_method, 
	web_application_controller, 
	-- web_application_action, 
	user_agent;