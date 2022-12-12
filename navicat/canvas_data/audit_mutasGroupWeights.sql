SELECT
acc.name as account_name,
 c.code as course_code,
 c.name as course_name,
	`agroup`.`name` AS `assignment_group_name`,
	`a`.`title` AS `title`,
	`agroupf`.`group_weight` AS `assignment_group_total_weight`,
	`a`.`points_possible` / `gsum`.`assignment_group_sum_possible` * `agroupf`.`group_weight` AS `calculated_assignment_weight`,
	`gsum`.`assignment_group_sum_possible` AS `assignment_group_sum_possible`,
	`a`.`points_possible` AS `assignment_points_possible`,
	`a`.`workflow_state` AS `workflow_state`
FROM
	(((
				`canvas_data`.`assignment_dim` `a`
				
			JOIN course_dim c on c.id = a.course_id and c.code like "MUTAS%"
			JOIN account_dim acc on acc.id = c.account_id and acc.name like "Music Performance"
			JOIN vw_term_names vt on vt.term_id = c.enrollment_term_id and vt.sortable_name = "2022 T3"
				JOIN `canvas_data`.`assignment_group_fact` `agroupf` ON ( `a`.`assignment_group_id` = `agroupf`.`assignment_group_id` ))
			JOIN `canvas_data`.`assignment_group_dim` `agroup` ON ( `agroup`.`id` = `agroupf`.`assignment_group_id` ))
		JOIN (
		SELECT
			`afact`.`assignment_group_id` AS `assignment_group_id`,
			sum( `afact`.`points_possible` ) AS `assignment_group_sum_possible` 
		FROM
			(
				`canvas_data`.`assignment_fact` `afact`
			JOIN `canvas_data`.`assignment_dim` `a2` ON ( `afact`.`assignment_id` = `a2`.`id` AND `a2`.`workflow_state` <> 'deleted' )) 
		GROUP BY
		`afact`.`assignment_group_id` 
	) `gsum` ON ( `a`.`assignment_group_id` = `gsum`.`assignment_group_id` ))
	order by course_code, assignment_group_name, a.title;