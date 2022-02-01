select
	timestamp_month,
	course_id,
	-- web_application_context_type, 
	-- web_application_context_id, 
	-- http_method, 
	web_application_controller,
	-- web_application_action,
	count(*) as request_count,
	count(distinct user_id) as requesting_users_count
from requests r FORCE INDEX(`timestamp_month`)
where
	timestamp_month between "2021-09" AND "2021-12"
group by
  timestamp_month,
	course_id,
	-- web_application_context_type, 
	-- web_application_context_id, 
	-- http_method, 
	web_application_controller
	-- web_application_action
order by
	timestamp_month,
	course_id,
	-- web_application_context_type, 
	-- web_application_context_id, 
	-- http_method, 
	web_application_controller;
	-- web_application_action