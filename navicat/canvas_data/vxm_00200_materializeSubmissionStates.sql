-- SET @targetTerm= '2022 T3';

DELIMITER //

	-- DROP TABLE IF EXISTS cll_mv_submission_states;
	IF (NOT EXISTS(SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'canvas_data' AND  TABLE_NAME = 'cll_mv_submission_states')) THEN
		CREATE TABLE cll_mv_submission_states
				(pkey bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY)
			AS SELECT *
			FROM vwmv_submission_states_wtfix;
 		CREATE INDEX IF NOT EXISTS user_id ON cll_mv_submission_states(user_id);
		CREATE INDEX IF NOT EXISTS enrollment_id ON cll_mv_submission_states(enrollment_id);
		CREATE INDEX IF NOT EXISTS course_id ON cll_mv_submission_states(course_id);
		CREATE INDEX IF NOT EXISTS assignment_id ON cll_mv_submission_states(assignment_id);
		CREATE INDEX IF NOT EXISTS assignment_group_canvas_id ON cll_mv_submission_states(assignment_group_canvas_id);
		CREATE INDEX IF NOT EXISTS enrollment_created_at ON cll_mv_submission_states(enrollment_created_at);
		CREATE INDEX IF NOT EXISTS original_due_at ON cll_mv_submission_states(original_due_at);
		CREATE INDEX IF NOT EXISTS calculated_due_at ON cll_mv_submission_states(calculated_due_at);
		CREATE INDEX IF NOT EXISTS submitted_at ON cll_mv_submission_states(submitted_at);
		CREATE INDEX IF NOT EXISTS graded_at ON cll_mv_submission_states(graded_at);
		CREATE INDEX IF NOT EXISTS collarts_student_id ON cll_mv_submission_states(collarts_student_id);
		CREATE INDEX IF NOT EXISTS course_code ON cll_mv_submission_states(course_code);
		CREATE INDEX IF NOT EXISTS term_map ON cll_mv_submission_states(term_map);
	ELSE
	  TRUNCATE TABLE cll_mv_submission_states;
		INSERT INTO cll_mv_submission_states SELECT NULL, subs.*
			FROM vwmv_submission_states_wtfix subs;
			-- WHERE subs.term_map = @targetTerm;
	END IF //

DELIMITER ;