SELECT
	lc.code AS `Course Id`,
	t.sortable_name AS `Term Id`,
	CONCAT( lc.code, " - ", t.sortable_name ) AS `Section Number`,
	"" AS `Description`,
	"" AS `Instructor Id`,
	"" AS `Secondary Instructor Ids`,
	lc.sis_course_id AS `LMS Course Ids`,
	lc.code AS `External Id` 
FROM
	cll_courses lc
	JOIN vw_term_names t ON t.canvas_id = lc.enrollment_term_canvas_id 
WHERE
	t.sortable_name = '2022 T3' 
	AND lc.workflow_state <> 'deleted' 
ORDER BY
	lc.code;