SELECT DISTINCT u.`name`, e.`course_id`, a.`title`, a.`due_at`, l.id,
(SELECT count(sT.id)
	FROM `submission_dim` sT
	JOIN `assignment_dim` a3 ON a3.id = sT.`assignment_id` AND sT.`user_id` = u.`id` AND a3.`due_at` BETWEEN '2021-09-01' AND '2021-10-18') AS submissionCount

FROM `enrollment_dim` e
LEFT JOIN `assignment_dim` a ON e.`course_id` = a.`course_id`
LEFT JOIN `submission_dim` l ON a.id = l.`assignment_id`
JOIN `user_dim` u ON e.`user_id` = u.id
JOIN `course_dim` c ON e.`course_id` = c.id

WHERE a.`due_at` BETWEEN '2021-09-01' AND '2021-10-18'
AND EXISTS(
	SELECT s.id
	FROM `submission_dim` s
	JOIN `assignment_dim` a2 ON a2.id = s.`assignment_id` AND s.`user_id` = u.`id` AND a2.`due_at` BETWEEN '2021-09-01' AND '2021-10-18')
AND l.id IS NULL
AND e.`type` = 'StudentEnrollment';


SELECT u.`name`, e.id AS enrollment, e.`course_id`, c.name AS courseName, t.`name`AS term, a.`title` AS assignmentName, a.`workflow_state` AS assignmentState, a.`due_at`, l.`workflow_state` AS submittedState
FROM `enrollment_dim` e
JOIN `user_dim` u ON e.`user_id` = u.id
JOIN `course_dim` c ON e.`course_id` = c.id
JOIN `enrollment_fact` ef ON e.id = ef.`enrollment_id`
LEFT JOIN `enrollment_term_dim` t ON ef.`enrollment_term_id` = t.id
JOIN `assignment_dim` a ON e.`course_id` = a.`course_id`
JOIN `submission_dim` l ON a.id = l.`assignment_id` AND l.user_id = u.id AND (l.`workflow_state` = 'unsubmitted' OR l.`workflow_state` = 'submitted')
WHERE a.`due_at` BETWEEN '2021-09-01' AND '2021-10-14'
AND e.`TYPE` = 'StudentEnrollment'
AND e.`workflow_state` = 'active'
AND e.`created_at` >= '2021-08-01'
AND a.`workflow_state` <> 'deleted';




SELECT u.`NAME`, a.id, e.`course_id`, c.name AS courseName, a.`title` AS assignmentTitle, a.`due_at`, l.`updated_at` AS submissionUpdated, a.`points_possible`,
(SELECT count(*)
	FROM `submission_dim` sub
	INNER JOIN `assignment_dim` a3 ON a3.id = sub.`assignment_id` AND sub.`user_id` = u.`id` AND a3.`due_at` BETWEEN '2021-09-01' AND '2021-10-18'
--	AND a3.id NOT IN (139370000000007440, 139370000000007208, 139370000000006303,139370000000007459,139370000000007248)
    AND a3.workflow_state <> 'deleted' ) AS submissionCount,
(SELECT count(due.id)
	FROM `enrollment_dim` en
	INNER JOIN `assignment_dim` due ON en.`course_id` = due.`course_id` AND en.`user_id` = u.`id` AND due.`due_at` BETWEEN '2021-09-01' AND '2021-10-18' 
	WHERE en.`TYPE` = 'StudentEnrollment'
--	AND due.id NOT IN (139370000000007440, 139370000000007208, 139370000000006303,139370000000007459,139370000000007248)
    AND due.workflow_state <> 'deleted') AS dueCount

FROM `enrollment_dim` e
JOIN `user_dim` u ON e.`user_id` = u.id
JOIN `course_dim` c ON e.`course_id` = c.id
LEFT JOIN `assignment_dim` a ON e.`course_id` = a.`course_id`
LEFT JOIN `submission_dim` l ON a.id = l.`assignment_id` AND l.`user_id` = u.id
WHERE a.`due_at` BETWEEN '2021-09-01' AND '2021-10-18'
AND e.`TYPE` = 'StudentEnrollment'
HAVING submissionCount <> dueCount
ORDER BY NAME, courseName;



AND EXISTS( 
	SELECT s.id
	FROM `submission_dim` s
	JOIN `assignment_dim` a2 ON a2.id = s.`assignment_id` AND s.`user_id` = u.`id` AND a2.`due_at` BETWEEN '2021-09-01' AND '2021-10-18')
AND l.id IS NULL;

SELECT u.name, s.* FROM `submission_dim` s JOIN assignment_dim a ON a.id = s.`assignment_id` AND a.`due_at` > '2021-09-01' JOIN `user_dim` u ON u.id = s.`user_id`;



SELECT * FROM assignment_dim WHERE id IN (139370000000007440, 139370000000007208, 139370000000006303,139370000000007459,139370000000007248);

SELECT * FROM requests WHERE id LIKE '5916926b-2b74-42e0-be7b-99b9f79cd070';



SELECT MAX(updated_at) FROM submissions_dim;