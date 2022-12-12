DELIMITER //
  -- DROP TABLE IF EXISTS cll_mv_major_degrees //
	IF (NOT EXISTS(SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'canvas_data' AND  TABLE_NAME = 'cll_mv_major_degrees')) THEN
		CREATE TABLE cll_mv_major_degrees
				(pkey bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY)
			AS SELECT *
			FROM vw_major_degrees;
		CREATE INDEX IF NOT EXISTS user_id ON cll_mv_major_degrees(user_id);
		CREATE INDEX IF NOT EXISTS user_canvas_id ON cll_mv_major_degrees(user_canvas_id);
		CREATE INDEX IF NOT EXISTS account_id ON cll_mv_major_degrees(account_id);
		CREATE INDEX IF NOT EXISTS degree_name ON cll_mv_major_degrees(degree_name);
	ELSE
	  TRUNCATE TABLE cll_mv_assignment_due_dates;
		INSERT INTO cll_mv_major_degrees SELECT NULL, vw.*
			FROM vw_major_degrees vw;
	END IF //
	
DELIMITER //
	-- DROP TABLE IF EXISTS cll_mv_course_teacher_list //
	IF (NOT EXISTS(SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'canvas_data' AND  TABLE_NAME = 'cll_mv_course_teacher_list')) THEN
		CREATE TABLE cll_mv_course_teacher_list
				(pkey bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY)
			AS SELECT *
			FROM vw_course_teacher_list;
 		CREATE INDEX IF NOT EXISTS course_id ON cll_mv_course_teacher_list(course_id );
	ELSE
	  TRUNCATE TABLE cll_mv_course_teacher_list;
		INSERT INTO cll_mv_course_teacher_list SELECT NULL, vw.*
			FROM vw_course_teacher_list vw;
	END IF //

DELIMITER //
  -- DROP TABLE IF EXISTS cll_mv_assignment_due_dates //
	IF (NOT EXISTS(SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'canvas_data' AND  TABLE_NAME = 'cll_mv_assignment_due_dates')) THEN
		CREATE TABLE cll_mv_assignment_due_dates
				(pkey bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY)
			AS SELECT *
			FROM vw_assignment_due_dates;
		CREATE INDEX IF NOT EXISTS user_id ON cll_mv_assignment_due_dates(user_id);
		CREATE INDEX IF NOT EXISTS course_id ON cll_mv_assignment_due_dates(course_id);
		CREATE INDEX IF NOT EXISTS enrollment_id ON cll_mv_assignment_due_dates(enrollment_id);
		CREATE INDEX IF NOT EXISTS assignment_id ON cll_mv_assignment_due_dates(assignment_id);
		CREATE INDEX IF NOT EXISTS assignment_canvas_id ON cll_mv_assignment_due_dates(assignment_canvas_id);
		CREATE INDEX IF NOT EXISTS enrollment_term_id ON cll_mv_assignment_due_dates(enrollment_term_id);
		CREATE INDEX IF NOT EXISTS assignment_override_id ON cll_mv_assignment_due_dates(assignment_override_id);
	ELSE
	  TRUNCATE TABLE cll_mv_assignment_due_dates;
		INSERT INTO cll_mv_assignment_due_dates SELECT NULL, vw.*
			FROM vw_assignment_due_dates vw;
	END IF //
	
DELIMITER //
  -- DROP TABLE IF EXISTS cll_mv_term_names;
	IF (NOT EXISTS(SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'canvas_data' AND  TABLE_NAME = 'cll_mv_term_names')) THEN
		CREATE TABLE cll_mv_term_names
				(pkey bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY)
			AS SELECT *
			FROM vw_term_names;
		CREATE INDEX IF NOT EXISTS term_id ON cll_mv_term_names(term_id);
		CREATE INDEX IF NOT EXISTS canvas_id ON cll_mv_term_names(canvas_id);
		CREATE INDEX IF NOT EXISTS `name` ON cll_mv_term_names(`name`);
		CREATE INDEX IF NOT EXISTS `sortable_name` ON cll_mv_term_names(`sortable_name`);
	ELSE
		TRUNCATE TABLE cll_mv_term_names;
	  INSERT INTO cll_mv_term_names SELECT NULL, vw.*
			FROM vw_term_names vw;
	END IF //

DELIMITER //
	-- DROP TABLE IF EXISTS cll_mv_assignment_weights_per_student;
	IF (NOT EXISTS(SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'canvas_data' AND  TABLE_NAME = 'cll_mv_assignment_weights_per_student')) THEN
		CREATE TABLE cll_mv_assignment_weights_per_student
				(pkey bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY)
			AS SELECT *
			FROM vw_assignment_weights_per_student;
		CREATE INDEX IF NOT EXISTS user_id ON cll_mv_assignment_weights_per_student(user_id);
		CREATE INDEX IF NOT EXISTS submission_canvas_id ON cll_mv_assignment_weights_per_student(submission_canvas_id);
		CREATE INDEX IF NOT EXISTS assignment_canvas_id ON cll_mv_assignment_weights_per_student(assignment_canvas_id);
		CREATE INDEX IF NOT EXISTS assignment_group_canvas_id ON cll_mv_assignment_weights_per_student(assignment_group_canvas_id);
		CREATE INDEX IF NOT EXISTS assignment_id ON cll_mv_assignment_weights_per_student(assignment_id);
	ELSE
	  TRUNCATE TABLE cll_mv_assignment_weights_per_student;
		INSERT INTO cll_mv_assignment_weights_per_student SELECT NULL, vw.*
			FROM vw_assignment_weights_per_student vw;
	END IF //

DELIMITER ;