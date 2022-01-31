/*
 Navicat Premium Data Transfer

 Source Server         : root@localhost
 Source Server Type    : MySQL
 Source Server Version : 100604
 Source Host           : localhost:3306
 Source Schema         : canvas_data

 Target Server Type    : MySQL
 Target Server Version : 100604
 File Encoding         : 65001

 Date: 31/01/2022 15:55:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_dim
-- ----------------------------
DROP TABLE IF EXISTS `account_dim`;
CREATE TABLE `account_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `depth` int(10) unsigned DEFAULT NULL,
  `workflow_state` enum('active','deleted') DEFAULT NULL,
  `parent_account` varchar(256) DEFAULT NULL,
  `parent_account_id` bigint(20) unsigned DEFAULT NULL,
  `grandparent_account` varchar(256) DEFAULT NULL,
  `grandparent_account_id` bigint(20) unsigned DEFAULT NULL,
  `root_account` varchar(256) DEFAULT NULL,
  `root_account_id` bigint(20) unsigned DEFAULT NULL,
  `subaccount1` varchar(256) DEFAULT NULL,
  `subaccount1_id` bigint(20) unsigned DEFAULT NULL,
  `subaccount2` varchar(256) DEFAULT NULL,
  `subaccount2_id` bigint(20) unsigned DEFAULT NULL,
  `subaccount3` varchar(256) DEFAULT NULL,
  `subaccount3_id` bigint(20) unsigned DEFAULT NULL,
  `subaccount4` varchar(256) DEFAULT NULL,
  `subaccount4_id` bigint(20) unsigned DEFAULT NULL,
  `subaccount5` varchar(256) DEFAULT NULL,
  `subaccount5_id` bigint(20) unsigned DEFAULT NULL,
  `subaccount6` varchar(256) DEFAULT NULL,
  `subaccount6_id` bigint(20) unsigned DEFAULT NULL,
  `subaccount7` varchar(256) DEFAULT NULL,
  `subaccount7_id` bigint(20) unsigned DEFAULT NULL,
  `subaccount8` varchar(256) DEFAULT NULL,
  `subaccount8_id` bigint(20) unsigned DEFAULT NULL,
  `subaccount9` varchar(256) DEFAULT NULL,
  `subaccount9_id` bigint(20) unsigned DEFAULT NULL,
  `subaccount10` varchar(256) DEFAULT NULL,
  `subaccount10_id` bigint(20) unsigned DEFAULT NULL,
  `subaccount11` varchar(256) DEFAULT NULL,
  `subaccount11_id` bigint(20) unsigned DEFAULT NULL,
  `subaccount12` varchar(256) DEFAULT NULL,
  `subaccount12_id` bigint(20) unsigned DEFAULT NULL,
  `subaccount13` varchar(256) DEFAULT NULL,
  `subaccount13_id` bigint(20) unsigned DEFAULT NULL,
  `subaccount14` varchar(256) DEFAULT NULL,
  `subaccount14_id` bigint(20) unsigned DEFAULT NULL,
  `subaccount15` varchar(256) DEFAULT NULL,
  `subaccount15_id` bigint(20) unsigned DEFAULT NULL,
  `sis_source_id` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `workflow_state` (`workflow_state`),
  KEY `parent_account_id` (`parent_account_id`),
  KEY `grandparent_account_id` (`grandparent_account_id`),
  KEY `root_account_id` (`root_account_id`),
  KEY `sis_source_id` (`sis_source_id`),
  KEY `subaccount1_id` (`subaccount1_id`),
  KEY `subaccount2_id` (`subaccount2_id`),
  KEY `subaccount3_id` (`subaccount3_id`),
  KEY `subaccount4_id` (`subaccount4_id`),
  KEY `subaccount5_id` (`subaccount5_id`),
  KEY `subaccount6_id` (`subaccount6_id`),
  KEY `subaccount7_id` (`subaccount7_id`),
  KEY `subaccount8_id` (`subaccount8_id`),
  KEY `subaccount9_id` (`subaccount9_id`),
  KEY `subaccount10_id` (`subaccount10_id`),
  KEY `subaccount11_id` (`subaccount11_id`),
  KEY `subaccount12_id` (`subaccount12_id`),
  KEY `subaccount13_id` (`subaccount13_id`),
  KEY `subaccount14_id` (`subaccount14_id`),
  KEY `subaccount15_id` (`subaccount15_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for assignment_dim
-- ----------------------------
DROP TABLE IF EXISTS `assignment_dim`;
CREATE TABLE `assignment_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(256) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `due_at` datetime DEFAULT NULL,
  `unlock_at` datetime DEFAULT NULL,
  `lock_at` datetime DEFAULT NULL,
  `points_possible` double DEFAULT NULL,
  `grading_type` varchar(256) DEFAULT NULL,
  `submission_types` varchar(256) DEFAULT NULL,
  `workflow_state` enum('unpublished','published','deleted','fail_to_import') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `peer_review_count` int(10) unsigned DEFAULT NULL,
  `peer_reviews_due_at` datetime DEFAULT NULL,
  `peer_reviews_assigned` enum('false','true') DEFAULT NULL,
  `peer_reviews` enum('false','true') DEFAULT NULL,
  `automatic_peer_reviews` enum('false','true') DEFAULT NULL,
  `all_day` enum('false','true') DEFAULT NULL,
  `all_day_date` date DEFAULT NULL,
  `could_be_locked` enum('false','true') DEFAULT NULL,
  `grade_group_students_individually` enum('false','true') DEFAULT NULL,
  `anonymous_peer_reviews` enum('false','true') DEFAULT NULL,
  `muted` enum('false','true') DEFAULT NULL,
  `assignment_group_id` bigint(20) unsigned DEFAULT NULL,
  `position` int(10) unsigned DEFAULT NULL,
  `visibility` enum('everyone','only_visible_to_overrides') DEFAULT NULL,
  `external_tool_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `course_id` (`course_id`),
  KEY `workflow_state` (`workflow_state`),
  KEY `assignment_group_id` (`assignment_group_id`),
  KEY `external_tool_id` (`external_tool_id`),
  KEY `due_at` (`due_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for assignment_fact
-- ----------------------------
DROP TABLE IF EXISTS `assignment_fact`;
CREATE TABLE `assignment_fact` (
  `assignment_id` bigint(20) unsigned NOT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `course_account_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_term_id` bigint(20) unsigned DEFAULT NULL,
  `points_possible` double DEFAULT NULL,
  `peer_review_count` int(10) unsigned DEFAULT NULL,
  `assignment_group_id` bigint(20) unsigned DEFAULT NULL,
  `external_tool_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`assignment_id`),
  KEY `course_id` (`course_id`),
  KEY `course_account_id` (`course_account_id`),
  KEY `enrollment_term_id` (`enrollment_term_id`),
  KEY `assignment_group_id` (`assignment_group_id`),
  KEY `external_tool_id` (`external_tool_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for assignment_group_dim
-- ----------------------------
DROP TABLE IF EXISTS `assignment_group_dim`;
CREATE TABLE `assignment_group_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `_default_assignment_name` varchar(256) DEFAULT NULL,
  `workflow_state` enum('available','active','deleted') DEFAULT NULL,
  `position` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `course_id` (`course_id`),
  KEY `workflow_state` (`workflow_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for assignment_group_fact
-- ----------------------------
DROP TABLE IF EXISTS `assignment_group_fact`;
CREATE TABLE `assignment_group_fact` (
  `assignment_group_id` bigint(20) unsigned NOT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `group_weight` double DEFAULT NULL,
  PRIMARY KEY (`assignment_group_id`),
  KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for assignment_group_rule_dim
-- ----------------------------
DROP TABLE IF EXISTS `assignment_group_rule_dim`;
CREATE TABLE `assignment_group_rule_dim` (
  `assignment_group_id` bigint(20) unsigned NOT NULL,
  `drop_lowest` int(10) unsigned DEFAULT NULL,
  `drop_highest` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`assignment_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for assignment_group_score_dim
-- ----------------------------
DROP TABLE IF EXISTS `assignment_group_score_dim`;
CREATE TABLE `assignment_group_score_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_group_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `workflow_state` enum('active','deleted') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `assignment_group_id` (`assignment_group_id`),
  KEY `enrollment_id` (`enrollment_id`),
  KEY `workflow_state` (`workflow_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for assignment_group_score_fact
-- ----------------------------
DROP TABLE IF EXISTS `assignment_group_score_fact`;
CREATE TABLE `assignment_group_score_fact` (
  `score_id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_group_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_id` bigint(20) unsigned DEFAULT NULL,
  `current_score` double DEFAULT NULL,
  `final_score` double DEFAULT NULL,
  `muted_current_score` double DEFAULT NULL,
  `muted_final_score` double DEFAULT NULL,
  PRIMARY KEY (`score_id`),
  KEY `assignment_group_id` (`assignment_group_id`),
  KEY `canvas_id` (`canvas_id`),
  KEY `account_id` (`account_id`),
  KEY `course_id` (`course_id`),
  KEY `enrollment_id` (`enrollment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for assignment_override_dim
-- ----------------------------
DROP TABLE IF EXISTS `assignment_override_dim`;
CREATE TABLE `assignment_override_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_id` bigint(20) unsigned DEFAULT NULL,
  `course_section_id` bigint(20) unsigned DEFAULT NULL,
  `group_id` bigint(20) unsigned DEFAULT NULL,
  `quiz_id` bigint(20) unsigned DEFAULT NULL,
  `all_day` enum('new_all_day','same_all_day') DEFAULT NULL,
  `all_day_date` date DEFAULT NULL,
  `assignment_version` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `due_at` datetime DEFAULT NULL,
  `due_at_overridden` enum('new_due_at','same_due_at') DEFAULT NULL,
  `lock_at` datetime DEFAULT NULL,
  `lock_at_overridden` enum('new_lock_at','same_lock_at') DEFAULT NULL,
  `set_type` enum('course_section','group','adhoc') DEFAULT NULL,
  `title` longtext DEFAULT NULL,
  `unlock_at` datetime DEFAULT NULL,
  `unlock_at_overridden` enum('new_unlock_at','same_unlock_at') DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `quiz_version` int(10) unsigned DEFAULT NULL,
  `workflow_state` enum('active','deleted') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `assignment_id` (`assignment_id`),
  KEY `course_section_id` (`course_section_id`),
  KEY `group_id` (`group_id`),
  KEY `quiz_id` (`quiz_id`),
  KEY `workflow_state` (`workflow_state`),
  KEY `due_at` (`due_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for assignment_override_fact
-- ----------------------------
DROP TABLE IF EXISTS `assignment_override_fact`;
CREATE TABLE `assignment_override_fact` (
  `assignment_override_id` bigint(20) unsigned NOT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_group_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `course_section_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_term_id` bigint(20) unsigned DEFAULT NULL,
  `group_id` bigint(20) unsigned DEFAULT NULL,
  `group_category_id` bigint(20) unsigned DEFAULT NULL,
  `group_parent_account_id` bigint(20) unsigned DEFAULT NULL,
  `nonxlist_course_id` bigint(20) unsigned DEFAULT NULL,
  `quiz_id` bigint(20) unsigned DEFAULT NULL,
  `group_wiki_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`assignment_override_id`),
  KEY `account_id` (`account_id`),
  KEY `assignment_id` (`assignment_id`),
  KEY `assignment_group_id` (`assignment_group_id`),
  KEY `course_id` (`course_id`),
  KEY `course_section_id` (`course_section_id`),
  KEY `enrollment_term_id` (`enrollment_term_id`),
  KEY `group_id` (`group_id`),
  KEY `group_category_id` (`group_category_id`),
  KEY `group_parent_account_id` (`group_parent_account_id`),
  KEY `nonxlist_course_id` (`nonxlist_course_id`),
  KEY `quiz_id` (`quiz_id`),
  KEY `group_wiki_id` (`group_wiki_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for assignment_override_user_dim
-- ----------------------------
DROP TABLE IF EXISTS `assignment_override_user_dim`;
CREATE TABLE `assignment_override_user_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_override_id` bigint(20) unsigned DEFAULT NULL,
  `quiz_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `assignment_id` (`assignment_id`),
  KEY `assignment_override_id` (`assignment_override_id`),
  KEY `quiz_id` (`quiz_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for assignment_override_user_fact
-- ----------------------------
DROP TABLE IF EXISTS `assignment_override_user_fact`;
CREATE TABLE `assignment_override_user_fact` (
  `assignment_override_user_id` bigint(20) unsigned NOT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_group_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_override_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_term_id` bigint(20) unsigned DEFAULT NULL,
  `quiz_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`assignment_override_user_id`),
  KEY `account_id` (`account_id`),
  KEY `assignment_group_id` (`assignment_group_id`),
  KEY `assignment_id` (`assignment_id`),
  KEY `assignment_override_id` (`assignment_override_id`),
  KEY `course_id` (`course_id`),
  KEY `enrollment_term_id` (`enrollment_term_id`),
  KEY `quiz_id` (`quiz_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for assignment_override_user_rollup_fact
-- ----------------------------
DROP TABLE IF EXISTS `assignment_override_user_rollup_fact`;
CREATE TABLE `assignment_override_user_rollup_fact` (
  `assignment_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_override_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_override_user_adhoc_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_group_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `course_account_id` bigint(20) unsigned DEFAULT NULL,
  `course_section_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_term_id` bigint(20) unsigned DEFAULT NULL,
  `group_category_id` bigint(20) unsigned DEFAULT NULL,
  `group_id` bigint(20) unsigned DEFAULT NULL,
  `group_parent_account_id` bigint(20) unsigned DEFAULT NULL,
  `group_wiki_id` bigint(20) unsigned DEFAULT NULL,
  `nonxlist_course_id` bigint(20) unsigned DEFAULT NULL,
  `quiz_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  KEY `assignment_id` (`assignment_id`),
  KEY `assignment_override_id` (`assignment_override_id`),
  KEY `assignment_override_user_adhoc_id` (`assignment_override_user_adhoc_id`),
  KEY `assignment_group_id` (`assignment_group_id`),
  KEY `course_id` (`course_id`),
  KEY `course_account_id` (`course_account_id`),
  KEY `course_section_id` (`course_section_id`),
  KEY `enrollment_id` (`enrollment_id`),
  KEY `enrollment_term_id` (`enrollment_term_id`),
  KEY `group_category_id` (`group_category_id`),
  KEY `group_id` (`group_id`),
  KEY `group_parent_account_id` (`group_parent_account_id`),
  KEY `group_wiki_id` (`group_wiki_id`),
  KEY `nonxlist_course_id` (`nonxlist_course_id`),
  KEY `quiz_id` (`quiz_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for assignment_rule_dim
-- ----------------------------
DROP TABLE IF EXISTS `assignment_rule_dim`;
CREATE TABLE `assignment_rule_dim` (
  `assignment_id` bigint(20) unsigned NOT NULL,
  `drop_rule` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`assignment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for cll_assignments
-- ----------------------------
DROP TABLE IF EXISTS `cll_assignments`;
CREATE TABLE `cll_assignments` (
  `canvas_id` bigint(20) unsigned NOT NULL,
  `course_canvas_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(256) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `due_at` datetime DEFAULT NULL,
  `unlock_at` datetime DEFAULT NULL,
  `lock_at` datetime DEFAULT NULL,
  `points_possible` double DEFAULT NULL,
  `grading_type` varchar(256) DEFAULT NULL,
  `submission_types` varchar(256) DEFAULT NULL,
  `workflow_state` enum('unpublished','published','deleted','fail_to_import') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `peer_review_count` int(10) unsigned DEFAULT NULL,
  `peer_reviews` enum('false','true') DEFAULT NULL,
  `automatic_peer_reviews` enum('false','true') DEFAULT NULL,
  `grade_group_students_individually` enum('false','true') DEFAULT NULL,
  `anonymous_peer_reviews` enum('false','true') DEFAULT NULL,
  `muted` enum('false','true') DEFAULT NULL,
  `assignment_group_canvas_id` bigint(20) unsigned DEFAULT NULL,
  `position` int(10) unsigned DEFAULT NULL,
  `external_tool_canvas_id` bigint(20) unsigned DEFAULT NULL,
  `cll_retrieved_at` datetime DEFAULT NULL,
  PRIMARY KEY (`canvas_id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `course_id` (`course_canvas_id`),
  KEY `workflow_state` (`workflow_state`),
  KEY `assignment_group_id` (`assignment_group_canvas_id`),
  KEY `external_tool_id` (`external_tool_canvas_id`),
  KEY `due_at` (`due_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for cll_rubric_associations
-- ----------------------------
DROP TABLE IF EXISTS `cll_rubric_associations`;
CREATE TABLE `cll_rubric_associations` (
  `id` bigint(20) NOT NULL,
  `rubric_id` bigint(20) DEFAULT NULL,
  `association_type` varchar(256) DEFAULT NULL,
  `association_id` bigint(20) DEFAULT NULL,
  `use_for_grading` enum('false','true') DEFAULT NULL,
  `summary_data` longtext DEFAULT NULL,
  `purpose` enum('grading','bookmark','unknown') DEFAULT NULL,
  `hide_score_total` enum('false','true') DEFAULT NULL,
  `hide_points` enum('false','true') DEFAULT NULL,
  `hide_outcome_results` enum('false','true') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rubric_id` (`rubric_id`),
  KEY `association_id` (`association_type`,`association_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for cll_rubric_criteria
-- ----------------------------
DROP TABLE IF EXISTS `cll_rubric_criteria`;
CREATE TABLE `cll_rubric_criteria` (
  `id` varchar(256) NOT NULL,
  `rubric_id` bigint(20) DEFAULT NULL,
  `ordinal` bigint(20) DEFAULT NULL,
  `title` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `points` double DEFAULT NULL,
  `mastery_points` double DEFAULT NULL,
  `ignore_for_scoring` enum('false','true') DEFAULT NULL,
  `criterion_use_range` enum('false','true') DEFAULT NULL,
  `long_description` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rubric_id` (`rubric_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for cll_rubric_ratings
-- ----------------------------
DROP TABLE IF EXISTS `cll_rubric_ratings`;
CREATE TABLE `cll_rubric_ratings` (
  `id` varchar(256) NOT NULL,
  `rubric_id` bigint(20) DEFAULT NULL,
  `criterion_id` varchar(256) DEFAULT NULL,
  `ordinal` bigint(20) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `long_description` longtext DEFAULT NULL,
  `points` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rubric_id` (`rubric_id`),
  KEY `criterion_id` (`criterion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for cll_rubrics
-- ----------------------------
DROP TABLE IF EXISTS `cll_rubrics`;
CREATE TABLE `cll_rubrics` (
  `id` bigint(20) NOT NULL,
  `context_id` bigint(20) DEFAULT NULL,
  `context_type` varchar(256) DEFAULT NULL,
  `points_possible` double DEFAULT NULL,
  `title` longtext DEFAULT NULL,
  `reusable` enum('false','true') DEFAULT NULL,
  `public` enum('false','true') DEFAULT NULL,
  `read_only` enum('false','true') DEFAULT NULL,
  `free_form_criterion_comments` enum('false','true') DEFAULT NULL,
  `hide_score_total` enum('false','true') DEFAULT NULL,
  `retrieved_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `context_id` (`context_type`,`context_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for communication_channel_dim
-- ----------------------------
DROP TABLE IF EXISTS `communication_channel_dim`;
CREATE TABLE `communication_channel_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `type` enum('email','facebook','push','sms','twitter') DEFAULT NULL,
  `position` int(10) unsigned DEFAULT NULL,
  `workflow_state` enum('unconfirmed','active','retired') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `user_id` (`user_id`),
  KEY `workflow_state` (`workflow_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for communication_channel_fact
-- ----------------------------
DROP TABLE IF EXISTS `communication_channel_fact`;
CREATE TABLE `communication_channel_fact` (
  `communication_channel_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `bounce_count` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`communication_channel_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for conference_dim
-- ----------------------------
DROP TABLE IF EXISTS `conference_dim`;
CREATE TABLE `conference_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(256) DEFAULT NULL,
  `conference_type` varchar(256) DEFAULT NULL,
  `group_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `start_at` datetime DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `end_at` datetime DEFAULT NULL,
  `ended_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `group_id` (`group_id`),
  KEY `course_id` (`course_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for conference_fact
-- ----------------------------
DROP TABLE IF EXISTS `conference_fact`;
CREATE TABLE `conference_fact` (
  `conference_id` bigint(20) unsigned NOT NULL,
  `group_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `duration` double DEFAULT NULL,
  PRIMARY KEY (`conference_id`),
  KEY `group_id` (`group_id`),
  KEY `course_id` (`course_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for conference_participant_dim
-- ----------------------------
DROP TABLE IF EXISTS `conference_participant_dim`;
CREATE TABLE `conference_participant_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `conference_id` bigint(20) unsigned DEFAULT NULL,
  `participation_type` varchar(256) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `conference_id` (`conference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for conference_participant_fact
-- ----------------------------
DROP TABLE IF EXISTS `conference_participant_fact`;
CREATE TABLE `conference_participant_fact` (
  `conference_participant_id` bigint(20) unsigned NOT NULL,
  `conference_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `group_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`conference_participant_id`),
  KEY `conference_id` (`conference_id`),
  KEY `user_id` (`user_id`),
  KEY `group_id` (`group_id`),
  KEY `course_id` (`course_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for conversation_dim
-- ----------------------------
DROP TABLE IF EXISTS `conversation_dim`;
CREATE TABLE `conversation_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `has_attachments` enum('false','true') DEFAULT NULL,
  `has_media_objects` enum('false','true') DEFAULT NULL,
  `subject` varchar(256) DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `group_id` bigint(20) unsigned DEFAULT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `course_id` (`course_id`),
  KEY `group_id` (`group_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for conversation_message_dim
-- ----------------------------
DROP TABLE IF EXISTS `conversation_message_dim`;
CREATE TABLE `conversation_message_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `conversation_id` bigint(20) unsigned DEFAULT NULL,
  `author_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `_generated` enum('false','true') DEFAULT NULL,
  `has_attachments` enum('false','true') DEFAULT NULL,
  `has_media_objects` enum('false','true') DEFAULT NULL,
  `body` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `conversation_id` (`conversation_id`),
  KEY `author_id` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for conversation_message_participant_fact
-- ----------------------------
DROP TABLE IF EXISTS `conversation_message_participant_fact`;
CREATE TABLE `conversation_message_participant_fact` (
  `conversation_message_id` bigint(20) unsigned NOT NULL,
  `conversation_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_term_id` bigint(20) unsigned DEFAULT NULL,
  `course_account_id` bigint(20) unsigned DEFAULT NULL,
  `group_id` bigint(20) unsigned DEFAULT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_rollup_id` bigint(20) unsigned DEFAULT NULL,
  `message_size_bytes` int(10) unsigned DEFAULT NULL,
  `message_character_count` int(10) unsigned DEFAULT NULL,
  `message_word_count` int(10) unsigned DEFAULT NULL,
  `message_line_count` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`conversation_message_id`,`user_id`),
  KEY `conversation_message_id` (`conversation_message_id`),
  KEY `conversation_id` (`conversation_id`),
  KEY `user_id` (`user_id`),
  KEY `course_id` (`course_id`),
  KEY `enrollment_term_id` (`enrollment_term_id`),
  KEY `course_account_id` (`course_account_id`),
  KEY `group_id` (`group_id`),
  KEY `account_id` (`account_id`),
  KEY `enrollment_rollup_id` (`enrollment_rollup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for course_dim
-- ----------------------------
DROP TABLE IF EXISTS `course_dim`;
CREATE TABLE `course_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `root_account_id` bigint(20) unsigned DEFAULT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_term_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `code` varchar(256) DEFAULT NULL,
  `type` varchar(256) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `start_at` datetime DEFAULT NULL,
  `conclude_at` datetime DEFAULT NULL,
  `publicly_visible` enum('false','true') DEFAULT NULL,
  `sis_source_id` varchar(256) DEFAULT NULL,
  `workflow_state` enum('completed','created','deleted','available','claimed') DEFAULT NULL,
  `wiki_id` bigint(20) unsigned DEFAULT NULL,
  `syllabus_body` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `root_account_id` (`root_account_id`),
  KEY `account_id` (`account_id`),
  KEY `enrollment_term_id` (`enrollment_term_id`),
  KEY `sis_source_id` (`sis_source_id`),
  KEY `workflow_state` (`workflow_state`),
  KEY `wiki_id` (`wiki_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for course_score_dim
-- ----------------------------
DROP TABLE IF EXISTS `course_score_dim`;
CREATE TABLE `course_score_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `workflow_state` enum('active','deleted') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `enrollment_id` (`enrollment_id`),
  KEY `workflow_state` (`workflow_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for course_score_fact
-- ----------------------------
DROP TABLE IF EXISTS `course_score_fact`;
CREATE TABLE `course_score_fact` (
  `score_id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_id` bigint(20) unsigned DEFAULT NULL,
  `current_score` double DEFAULT NULL,
  `final_score` double DEFAULT NULL,
  `muted_current_score` double DEFAULT NULL,
  `muted_final_score` double DEFAULT NULL,
  PRIMARY KEY (`score_id`),
  KEY `canvas_id` (`canvas_id`),
  KEY `account_id` (`account_id`),
  KEY `course_id` (`course_id`),
  KEY `enrollment_id` (`enrollment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for course_section_dim
-- ----------------------------
DROP TABLE IF EXISTS `course_section_dim`;
CREATE TABLE `course_section_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_term_id` bigint(20) unsigned DEFAULT NULL,
  `_default_section` enum('false','true') DEFAULT NULL,
  `accepting_enrollments` enum('false','true') DEFAULT NULL,
  `can_manually_enroll` enum('false','true') DEFAULT NULL,
  `start_at` datetime DEFAULT NULL,
  `end_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `workflow_state` enum('active','deleted','inactive') DEFAULT NULL,
  `restrict_enrollments_to_section_dates` enum('false','true') DEFAULT NULL,
  `nonxlist_course_id` bigint(20) unsigned DEFAULT NULL,
  `sis_source_id` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `course_id` (`course_id`),
  KEY `enrollment_term_id` (`enrollment_term_id`),
  KEY `workflow_state` (`workflow_state`),
  KEY `nonxlist_course_id` (`nonxlist_course_id`),
  KEY `sis_source_id` (`sis_source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for course_ui_canvas_navigation_dim
-- ----------------------------
DROP TABLE IF EXISTS `course_ui_canvas_navigation_dim`;
CREATE TABLE `course_ui_canvas_navigation_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `_default` varchar(256) DEFAULT NULL,
  `original_position` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for course_ui_navigation_item_dim
-- ----------------------------
DROP TABLE IF EXISTS `course_ui_navigation_item_dim`;
CREATE TABLE `course_ui_navigation_item_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `root_account_id` bigint(20) unsigned DEFAULT NULL,
  `visible` varchar(256) DEFAULT NULL,
  `position` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `root_account_id` (`root_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for course_ui_navigation_item_fact
-- ----------------------------
DROP TABLE IF EXISTS `course_ui_navigation_item_fact`;
CREATE TABLE `course_ui_navigation_item_fact` (
  `root_account_id` bigint(20) unsigned DEFAULT NULL,
  `course_ui_navigation_item_id` bigint(20) unsigned NOT NULL,
  `course_ui_canvas_navigation_id` bigint(20) unsigned DEFAULT NULL,
  `external_tool_activation_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `course_account_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_term_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`course_ui_navigation_item_id`),
  KEY `root_account_id` (`root_account_id`),
  KEY `course_ui_canvas_navigation_id` (`course_ui_canvas_navigation_id`),
  KEY `external_tool_activation_id` (`external_tool_activation_id`),
  KEY `course_id` (`course_id`),
  KEY `course_account_id` (`course_account_id`),
  KEY `enrollment_term_id` (`enrollment_term_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for discussion_entry_dim
-- ----------------------------
DROP TABLE IF EXISTS `discussion_entry_dim`;
CREATE TABLE `discussion_entry_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `workflow_state` enum('active','deleted') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `depth` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `workflow_state` (`workflow_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for discussion_entry_fact
-- ----------------------------
DROP TABLE IF EXISTS `discussion_entry_fact`;
CREATE TABLE `discussion_entry_fact` (
  `discussion_entry_id` bigint(20) unsigned NOT NULL,
  `parent_discussion_entry_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `topic_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_term_id` bigint(20) unsigned DEFAULT NULL,
  `course_account_id` bigint(20) unsigned DEFAULT NULL,
  `topic_user_id` bigint(20) unsigned DEFAULT NULL,
  `topic_assignment_id` bigint(20) unsigned DEFAULT NULL,
  `topic_editor_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_rollup_id` bigint(20) unsigned DEFAULT NULL,
  `message_length` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`discussion_entry_id`),
  KEY `parent_discussion_entry_id` (`parent_discussion_entry_id`),
  KEY `user_id` (`user_id`),
  KEY `topic_id` (`topic_id`),
  KEY `course_id` (`course_id`),
  KEY `enrollment_term_id` (`enrollment_term_id`),
  KEY `course_account_id` (`course_account_id`),
  KEY `topic_user_id` (`topic_user_id`),
  KEY `topic_assignment_id` (`topic_assignment_id`),
  KEY `topic_editor_id` (`topic_editor_id`),
  KEY `enrollment_rollup_id` (`enrollment_rollup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for discussion_topic_dim
-- ----------------------------
DROP TABLE IF EXISTS `discussion_topic_dim`;
CREATE TABLE `discussion_topic_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(256) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `type` varchar(256) DEFAULT NULL,
  `workflow_state` enum('unpublished','active','locked','deleted','post_delayed') DEFAULT NULL,
  `last_reply_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `delayed_post_at` datetime DEFAULT NULL,
  `posted_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `discussion_type` varchar(256) DEFAULT NULL,
  `pinned` enum('false','true') DEFAULT NULL,
  `locked` enum('false','true') DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `group_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `workflow_state` (`workflow_state`),
  KEY `course_id` (`course_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for discussion_topic_fact
-- ----------------------------
DROP TABLE IF EXISTS `discussion_topic_fact`;
CREATE TABLE `discussion_topic_fact` (
  `discussion_topic_id` bigint(20) unsigned NOT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_term_id` bigint(20) unsigned DEFAULT NULL,
  `course_account_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_id` bigint(20) unsigned DEFAULT NULL,
  `editor_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_rollup_id` bigint(20) unsigned DEFAULT NULL,
  `message_length` int(10) unsigned DEFAULT NULL,
  `group_id` bigint(20) unsigned DEFAULT NULL,
  `group_parent_course_id` bigint(20) unsigned DEFAULT NULL,
  `group_parent_account_id` bigint(20) unsigned DEFAULT NULL,
  `group_parent_course_account_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`discussion_topic_id`),
  KEY `course_id` (`course_id`),
  KEY `enrollment_term_id` (`enrollment_term_id`),
  KEY `course_account_id` (`course_account_id`),
  KEY `user_id` (`user_id`),
  KEY `assignment_id` (`assignment_id`),
  KEY `editor_id` (`editor_id`),
  KEY `enrollment_rollup_id` (`enrollment_rollup_id`),
  KEY `group_id` (`group_id`),
  KEY `group_parent_course_id` (`group_parent_course_id`),
  KEY `group_parent_account_id` (`group_parent_account_id`),
  KEY `group_parent_course_account_id` (`group_parent_course_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for enrollment_dim
-- ----------------------------
DROP TABLE IF EXISTS `enrollment_dim`;
CREATE TABLE `enrollment_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `root_account_id` bigint(20) unsigned DEFAULT NULL,
  `course_section_id` bigint(20) unsigned DEFAULT NULL,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `type` varchar(256) DEFAULT NULL,
  `workflow_state` enum('active','completed','creation_pending','deleted','inactive','invited','rejected') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `start_at` datetime DEFAULT NULL,
  `end_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `self_enrolled` enum('false','true') DEFAULT NULL,
  `sis_source_id` varchar(256) DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `last_activity_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `root_account_id` (`root_account_id`),
  KEY `course_section_id` (`course_section_id`),
  KEY `role_id` (`role_id`),
  KEY `workflow_state` (`workflow_state`),
  KEY `sis_source_id` (`sis_source_id`),
  KEY `course_id` (`course_id`),
  KEY `user_id` (`user_id`),
  KEY `created_at` (`created_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for enrollment_fact
-- ----------------------------
DROP TABLE IF EXISTS `enrollment_fact`;
CREATE TABLE `enrollment_fact` (
  `enrollment_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_term_id` bigint(20) unsigned DEFAULT NULL,
  `course_account_id` bigint(20) unsigned DEFAULT NULL,
  `course_section_id` bigint(20) unsigned DEFAULT NULL,
  `computed_final_score` double DEFAULT NULL,
  `computed_current_score` double DEFAULT NULL,
  PRIMARY KEY (`enrollment_id`),
  KEY `user_id` (`user_id`),
  KEY `course_id` (`course_id`),
  KEY `enrollment_term_id` (`enrollment_term_id`),
  KEY `course_account_id` (`course_account_id`),
  KEY `course_section_id` (`course_section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for enrollment_rollup_dim
-- ----------------------------
DROP TABLE IF EXISTS `enrollment_rollup_dim`;
CREATE TABLE `enrollment_rollup_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_count` int(10) unsigned DEFAULT NULL,
  `role_count` int(10) unsigned DEFAULT NULL,
  `base_role_count` int(10) unsigned DEFAULT NULL,
  `account_admin_role_count` int(10) unsigned DEFAULT NULL,
  `teacher_enrollment_role_count` int(10) unsigned DEFAULT NULL,
  `designer_enrollment_role_count` int(10) unsigned DEFAULT NULL,
  `ta_enrollment_role_count` int(10) unsigned DEFAULT NULL,
  `student_enrollment_role_count` int(10) unsigned DEFAULT NULL,
  `observer_enrollment_role_count` int(10) unsigned DEFAULT NULL,
  `account_membership_role_count` int(10) unsigned DEFAULT NULL,
  `no_permissions_role_count` int(10) unsigned DEFAULT NULL,
  `account_admin_enrollment_id` bigint(20) unsigned DEFAULT NULL,
  `teacher_enrollment_enrollment_id` bigint(20) unsigned DEFAULT NULL,
  `designer_enrollment_enrollment_id` bigint(20) unsigned DEFAULT NULL,
  `ta_enrollment_enrollment_id` bigint(20) unsigned DEFAULT NULL,
  `student_enrollment_enrollment_id` bigint(20) unsigned DEFAULT NULL,
  `observer_enrollment_enrollment_id` bigint(20) unsigned DEFAULT NULL,
  `account_membership_enrollment_id` bigint(20) unsigned DEFAULT NULL,
  `no_permissions_enrollment_id` bigint(20) unsigned DEFAULT NULL,
  `most_privileged_role` varchar(256) DEFAULT NULL,
  `least_privileged_role` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `course_id` (`course_id`),
  KEY `account_admin_enrollment_id` (`account_admin_enrollment_id`),
  KEY `teacher_enrollment_enrollment_id` (`teacher_enrollment_enrollment_id`),
  KEY `designer_enrollment_enrollment_id` (`designer_enrollment_enrollment_id`),
  KEY `ta_enrollment_enrollment_id` (`ta_enrollment_enrollment_id`),
  KEY `student_enrollment_enrollment_id` (`student_enrollment_enrollment_id`),
  KEY `observer_enrollment_enrollment_id` (`observer_enrollment_enrollment_id`),
  KEY `account_membership_enrollment_id` (`account_membership_enrollment_id`),
  KEY `no_permissions_enrollment_id` (`no_permissions_enrollment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for enrollment_term_dim
-- ----------------------------
DROP TABLE IF EXISTS `enrollment_term_dim`;
CREATE TABLE `enrollment_term_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `root_account_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `sis_source_id` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `root_account_id` (`root_account_id`),
  KEY `sis_source_id` (`sis_source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for external_tool_activation_dim
-- ----------------------------
DROP TABLE IF EXISTS `external_tool_activation_dim`;
CREATE TABLE `external_tool_activation_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `activation_target_type` varchar(256) DEFAULT NULL,
  `url` varchar(4096) DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `workflow_state` enum('active','deleted') DEFAULT NULL,
  `privacy_level` varchar(256) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `tool_id` varchar(256) DEFAULT NULL,
  `selectable_all` enum('false','true') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `course_id` (`course_id`),
  KEY `account_id` (`account_id`),
  KEY `workflow_state` (`workflow_state`),
  KEY `tool_id` (`tool_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for external_tool_activation_fact
-- ----------------------------
DROP TABLE IF EXISTS `external_tool_activation_fact`;
CREATE TABLE `external_tool_activation_fact` (
  `external_tool_activation_id` bigint(20) unsigned NOT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `root_account_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_term_id` bigint(20) unsigned DEFAULT NULL,
  `course_account_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`external_tool_activation_id`),
  KEY `course_id` (`course_id`),
  KEY `account_id` (`account_id`),
  KEY `root_account_id` (`root_account_id`),
  KEY `enrollment_term_id` (`enrollment_term_id`),
  KEY `course_account_id` (`course_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for file_dim
-- ----------------------------
DROP TABLE IF EXISTS `file_dim`;
CREATE TABLE `file_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `display_name` longtext DEFAULT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_id` bigint(20) unsigned DEFAULT NULL,
  `conversation_message_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `folder_id` bigint(20) unsigned DEFAULT NULL,
  `group_id` bigint(20) unsigned DEFAULT NULL,
  `quiz_id` bigint(20) unsigned DEFAULT NULL,
  `quiz_submission_id` bigint(20) unsigned DEFAULT NULL,
  `replacement_file_id` bigint(20) unsigned DEFAULT NULL,
  `root_file_id` bigint(20) unsigned DEFAULT NULL,
  `submission_id` bigint(20) unsigned DEFAULT NULL,
  `uploader_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `owner_entity_type` enum('account','assignment','conversation_message','course','group','quiz','quiz_submission','submission','user') DEFAULT NULL,
  `content_type` varchar(256) DEFAULT NULL,
  `md5` varchar(256) DEFAULT NULL,
  `file_state` enum('available','broken','deleted','errored','hidden') DEFAULT NULL,
  `could_be_locked` enum('allow_locking','disallow_locking') DEFAULT NULL,
  `locked` enum('is_locked','is_not_locked') DEFAULT NULL,
  `lock_at` datetime DEFAULT NULL,
  `unlock_at` datetime DEFAULT NULL,
  `viewed_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `assignment_id` (`assignment_id`),
  KEY `user_id` (`user_id`),
  KEY `submission_id` (`submission_id`),
  KEY `account_id` (`account_id`),
  KEY `conversation_message_id` (`conversation_message_id`),
  KEY `course_id` (`course_id`),
  KEY `folder_id` (`folder_id`),
  KEY `group_id` (`group_id`),
  KEY `quiz_id` (`quiz_id`),
  KEY `quiz_submission_id` (`quiz_submission_id`),
  KEY `replacement_file_id` (`replacement_file_id`),
  KEY `root_file_id` (`root_file_id`),
  KEY `uploader_id` (`uploader_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for file_fact
-- ----------------------------
DROP TABLE IF EXISTS `file_fact`;
CREATE TABLE `file_fact` (
  `file_id` bigint(20) unsigned NOT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_group_id` bigint(20) unsigned DEFAULT NULL,
  `conversation_id` bigint(20) unsigned DEFAULT NULL,
  `conversation_message_author_id` bigint(20) unsigned DEFAULT NULL,
  `conversation_message_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_rollup_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_term_id` bigint(20) unsigned DEFAULT NULL,
  `folder_id` bigint(20) unsigned DEFAULT NULL,
  `grader_id` bigint(20) unsigned DEFAULT NULL,
  `group_id` bigint(20) unsigned DEFAULT NULL,
  `group_category_id` bigint(20) unsigned DEFAULT NULL,
  `quiz_id` bigint(20) unsigned DEFAULT NULL,
  `quiz_submission_id` bigint(20) unsigned DEFAULT NULL,
  `replacement_file_id` bigint(20) unsigned DEFAULT NULL,
  `root_file_id` bigint(20) unsigned DEFAULT NULL,
  `sis_source_id` varchar(256) DEFAULT NULL,
  `submission_id` bigint(20) unsigned DEFAULT NULL,
  `uploader_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `wiki_id` bigint(20) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`file_id`),
  KEY `file_id` (`file_id`),
  KEY `assignment_id` (`assignment_id`),
  KEY `user_id` (`user_id`),
  KEY `submission_id` (`submission_id`),
  KEY `account_id` (`account_id`),
  KEY `assignment_group_id` (`assignment_group_id`),
  KEY `conversation_id` (`conversation_id`),
  KEY `conversation_message_author_id` (`conversation_message_author_id`),
  KEY `conversation_message_id` (`conversation_message_id`),
  KEY `course_id` (`course_id`),
  KEY `enrollment_rollup_id` (`enrollment_rollup_id`),
  KEY `enrollment_term_id` (`enrollment_term_id`),
  KEY `folder_id` (`folder_id`),
  KEY `grader_id` (`grader_id`),
  KEY `group_id` (`group_id`),
  KEY `group_category_id` (`group_category_id`),
  KEY `quiz_id` (`quiz_id`),
  KEY `quiz_submission_id` (`quiz_submission_id`),
  KEY `replacement_file_id` (`replacement_file_id`),
  KEY `root_file_id` (`root_file_id`),
  KEY `sis_source_id` (`sis_source_id`),
  KEY `uploader_id` (`uploader_id`),
  KEY `wiki_id` (`wiki_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for grading_period_dim
-- ----------------------------
DROP TABLE IF EXISTS `grading_period_dim`;
CREATE TABLE `grading_period_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `grading_period_group_id` bigint(20) unsigned DEFAULT NULL,
  `close_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `title` varchar(256) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `workflow_state` enum('active','deleted') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `grading_period_group_id` (`grading_period_group_id`),
  KEY `workflow_state` (`workflow_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for grading_period_fact
-- ----------------------------
DROP TABLE IF EXISTS `grading_period_fact`;
CREATE TABLE `grading_period_fact` (
  `grading_period_id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `grading_period_group_id` bigint(20) unsigned DEFAULT NULL,
  `grading_period_group_account_id` bigint(20) unsigned DEFAULT NULL,
  `grading_period_group_course_id` bigint(20) unsigned DEFAULT NULL,
  `weight` double DEFAULT NULL,
  PRIMARY KEY (`grading_period_id`),
  KEY `canvas_id` (`canvas_id`),
  KEY `grading_period_group_id` (`grading_period_group_id`),
  KEY `grading_period_group_account_id` (`grading_period_group_account_id`),
  KEY `grading_period_group_course_id` (`grading_period_group_course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for grading_period_group_dim
-- ----------------------------
DROP TABLE IF EXISTS `grading_period_group_dim`;
CREATE TABLE `grading_period_group_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `title` varchar(256) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `workflow_state` enum('active','deleted') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `course_id` (`course_id`),
  KEY `account_id` (`account_id`),
  KEY `workflow_state` (`workflow_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for grading_period_score_dim
-- ----------------------------
DROP TABLE IF EXISTS `grading_period_score_dim`;
CREATE TABLE `grading_period_score_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_id` bigint(20) unsigned DEFAULT NULL,
  `grading_period_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `workflow_state` enum('active','deleted') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `enrollment_id` (`enrollment_id`),
  KEY `grading_period_id` (`grading_period_id`),
  KEY `workflow_state` (`workflow_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for grading_period_score_fact
-- ----------------------------
DROP TABLE IF EXISTS `grading_period_score_fact`;
CREATE TABLE `grading_period_score_fact` (
  `score_id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_id` bigint(20) unsigned DEFAULT NULL,
  `grading_period_id` bigint(20) unsigned DEFAULT NULL,
  `grading_period_group_id` bigint(20) unsigned DEFAULT NULL,
  `grading_period_group_account_id` bigint(20) unsigned DEFAULT NULL,
  `current_score` double DEFAULT NULL,
  `final_score` double DEFAULT NULL,
  `muted_current_score` double DEFAULT NULL,
  `muted_final_score` double DEFAULT NULL,
  PRIMARY KEY (`score_id`),
  KEY `canvas_id` (`canvas_id`),
  KEY `account_id` (`account_id`),
  KEY `course_id` (`course_id`),
  KEY `enrollment_id` (`enrollment_id`),
  KEY `grading_period_id` (`grading_period_id`),
  KEY `grading_period_group_id` (`grading_period_group_id`),
  KEY `grading_period_group_account_id` (`grading_period_group_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for group_dim
-- ----------------------------
DROP TABLE IF EXISTS `group_dim`;
CREATE TABLE `group_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `is_public` enum('false','true') DEFAULT NULL,
  `workflow_state` enum('active','deleted','available') DEFAULT NULL,
  `context_type` varchar(256) DEFAULT NULL,
  `category` longtext DEFAULT NULL,
  `join_level` varchar(256) DEFAULT NULL,
  `_default_view` varchar(256) DEFAULT NULL,
  `sis_source_id` bigint(20) unsigned DEFAULT NULL,
  `group_category_id` bigint(20) unsigned DEFAULT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `wiki_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `workflow_state` (`workflow_state`),
  KEY `sis_source_id` (`sis_source_id`),
  KEY `group_category_id` (`group_category_id`),
  KEY `account_id` (`account_id`),
  KEY `wiki_id` (`wiki_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for group_fact
-- ----------------------------
DROP TABLE IF EXISTS `group_fact`;
CREATE TABLE `group_fact` (
  `group_id` bigint(20) unsigned NOT NULL,
  `parent_course_id` bigint(20) unsigned DEFAULT NULL,
  `parent_account_id` bigint(20) unsigned DEFAULT NULL,
  `parent_course_account_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_term_id` bigint(20) unsigned DEFAULT NULL,
  `max_membership` int(10) unsigned DEFAULT NULL,
  `storage_quota` bigint(20) unsigned DEFAULT NULL,
  `group_category_id` bigint(20) unsigned DEFAULT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `wiki_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`group_id`),
  KEY `parent_course_id` (`parent_course_id`),
  KEY `parent_account_id` (`parent_account_id`),
  KEY `parent_course_account_id` (`parent_course_account_id`),
  KEY `enrollment_term_id` (`enrollment_term_id`),
  KEY `group_category_id` (`group_category_id`),
  KEY `account_id` (`account_id`),
  KEY `wiki_id` (`wiki_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for group_membership_dim
-- ----------------------------
DROP TABLE IF EXISTS `group_membership_dim`;
CREATE TABLE `group_membership_dim` (
  `id` varchar(256) NOT NULL,
  `canvas_id` varchar(256) DEFAULT NULL,
  `group_id` bigint(20) unsigned DEFAULT NULL,
  `moderator` enum('is_moderator','not_moderator') DEFAULT NULL,
  `workflow_state` enum('accepted','invited','requested','deleted') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`) USING HASH,
  KEY `group_id` (`group_id`),
  KEY `workflow_state` (`workflow_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for group_membership_fact
-- ----------------------------
DROP TABLE IF EXISTS `group_membership_fact`;
CREATE TABLE `group_membership_fact` (
  `group_id` bigint(20) unsigned DEFAULT NULL,
  `parent_course_id` bigint(20) unsigned DEFAULT NULL,
  `parent_account_id` bigint(20) unsigned DEFAULT NULL,
  `parent_course_account_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_term_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `group_membership_id` varchar(256) NOT NULL,
  PRIMARY KEY (`group_membership_id`),
  KEY `group_id` (`group_id`),
  KEY `parent_course_id` (`parent_course_id`),
  KEY `parent_account_id` (`parent_account_id`),
  KEY `parent_course_account_id` (`parent_course_account_id`),
  KEY `enrollment_term_id` (`enrollment_term_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for learning_outcome_dim
-- ----------------------------
DROP TABLE IF EXISTS `learning_outcome_dim`;
CREATE TABLE `learning_outcome_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `short_description` varchar(256) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `workflow_state` enum('active','deleted') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `vendor_guid` varchar(256) DEFAULT NULL,
  `display_name` varchar(256) DEFAULT NULL,
  `calculation_method` longtext DEFAULT NULL,
  `calculation_int` int(10) unsigned DEFAULT NULL,
  `outcome_import_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `account_id` (`account_id`),
  KEY `course_id` (`course_id`),
  KEY `workflow_state` (`workflow_state`),
  KEY `outcome_import_id` (`outcome_import_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for learning_outcome_fact
-- ----------------------------
DROP TABLE IF EXISTS `learning_outcome_fact`;
CREATE TABLE `learning_outcome_fact` (
  `learning_outcome_id` bigint(20) unsigned NOT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_term_id` bigint(20) unsigned DEFAULT NULL,
  `mastery_points` double DEFAULT NULL,
  `points_possible` double DEFAULT NULL,
  `outcome_import_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`learning_outcome_id`),
  KEY `account_id` (`account_id`),
  KEY `course_id` (`course_id`),
  KEY `enrollment_term_id` (`enrollment_term_id`),
  KEY `outcome_import_id` (`outcome_import_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for learning_outcome_group_association_fact
-- ----------------------------
DROP TABLE IF EXISTS `learning_outcome_group_association_fact`;
CREATE TABLE `learning_outcome_group_association_fact` (
  `learning_outcome_id` bigint(20) unsigned DEFAULT NULL,
  `learning_outcome_group_id` bigint(20) unsigned DEFAULT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_term_id` bigint(20) unsigned DEFAULT NULL,
  KEY `learning_outcome_id` (`learning_outcome_id`),
  KEY `learning_outcome_group_id` (`learning_outcome_group_id`),
  KEY `account_id` (`account_id`),
  KEY `course_id` (`course_id`),
  KEY `enrollment_term_id` (`enrollment_term_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for learning_outcome_group_dim
-- ----------------------------
DROP TABLE IF EXISTS `learning_outcome_group_dim`;
CREATE TABLE `learning_outcome_group_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(256) DEFAULT NULL,
  `parent_group_id` bigint(20) unsigned DEFAULT NULL,
  `root_group_id` bigint(20) unsigned DEFAULT NULL,
  `workflow_state` enum('active','deleted') DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `vendor_guid` varchar(256) DEFAULT NULL,
  `outcome_import_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `account_id` (`account_id`),
  KEY `course_id` (`course_id`),
  KEY `parent_group_id` (`parent_group_id`),
  KEY `root_group_id` (`root_group_id`),
  KEY `workflow_state` (`workflow_state`),
  KEY `outcome_import_id` (`outcome_import_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for learning_outcome_group_fact
-- ----------------------------
DROP TABLE IF EXISTS `learning_outcome_group_fact`;
CREATE TABLE `learning_outcome_group_fact` (
  `learning_outcome_group_id` bigint(20) unsigned NOT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_term_id` bigint(20) unsigned DEFAULT NULL,
  `parent_group_id` bigint(20) unsigned DEFAULT NULL,
  `root_group_id` bigint(20) unsigned DEFAULT NULL,
  `outcome_import_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`learning_outcome_group_id`),
  KEY `account_id` (`account_id`),
  KEY `course_id` (`course_id`),
  KEY `enrollment_term_id` (`enrollment_term_id`),
  KEY `parent_group_id` (`parent_group_id`),
  KEY `root_group_id` (`root_group_id`),
  KEY `outcome_import_id` (`outcome_import_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for learning_outcome_question_result_dim
-- ----------------------------
DROP TABLE IF EXISTS `learning_outcome_question_result_dim`;
CREATE TABLE `learning_outcome_question_result_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `learning_outcome_result_id` bigint(20) unsigned DEFAULT NULL,
  `learning_outcome_id` bigint(20) unsigned DEFAULT NULL,
  `assessment_question_id` bigint(20) unsigned DEFAULT NULL,
  `title` longtext DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `assessed_at` datetime DEFAULT NULL,
  `submitted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `learning_outcome_result_id` (`learning_outcome_result_id`),
  KEY `learning_outcome_id` (`learning_outcome_id`),
  KEY `assessment_question_id` (`assessment_question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for learning_outcome_question_result_fact
-- ----------------------------
DROP TABLE IF EXISTS `learning_outcome_question_result_fact`;
CREATE TABLE `learning_outcome_question_result_fact` (
  `learning_outcome_question_result_id` bigint(20) unsigned NOT NULL,
  `learning_outcome_result_id` bigint(20) unsigned DEFAULT NULL,
  `learning_outcome_id` bigint(20) unsigned DEFAULT NULL,
  `assessment_question_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_term_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_id` bigint(20) unsigned DEFAULT NULL,
  `quiz_id` bigint(20) unsigned DEFAULT NULL,
  `mastery` enum('false','true') DEFAULT NULL,
  `score` double DEFAULT NULL,
  `attempts` int(10) unsigned DEFAULT NULL,
  `possible` double DEFAULT NULL,
  `original_score` double DEFAULT NULL,
  `original_possible` double DEFAULT NULL,
  `original_mastery` enum('false','true') DEFAULT NULL,
  `percent` double DEFAULT NULL,
  PRIMARY KEY (`learning_outcome_question_result_id`),
  KEY `learning_outcome_result_id` (`learning_outcome_result_id`),
  KEY `learning_outcome_id` (`learning_outcome_id`),
  KEY `assessment_question_id` (`assessment_question_id`),
  KEY `user_id` (`user_id`),
  KEY `account_id` (`account_id`),
  KEY `course_id` (`course_id`),
  KEY `enrollment_term_id` (`enrollment_term_id`),
  KEY `assignment_id` (`assignment_id`),
  KEY `quiz_id` (`quiz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for learning_outcome_result_dim
-- ----------------------------
DROP TABLE IF EXISTS `learning_outcome_result_dim`;
CREATE TABLE `learning_outcome_result_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_id` bigint(20) unsigned DEFAULT NULL,
  `quiz_id` bigint(20) unsigned DEFAULT NULL,
  `learning_outcome_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `assessed_at` datetime DEFAULT NULL,
  `submitted_at` datetime DEFAULT NULL,
  `hide_points` enum('false','true') DEFAULT NULL,
  `hidden` enum('false','true') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `account_id` (`account_id`),
  KEY `course_id` (`course_id`),
  KEY `assignment_id` (`assignment_id`),
  KEY `quiz_id` (`quiz_id`),
  KEY `learning_outcome_id` (`learning_outcome_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for learning_outcome_result_fact
-- ----------------------------
DROP TABLE IF EXISTS `learning_outcome_result_fact`;
CREATE TABLE `learning_outcome_result_fact` (
  `learning_outcome_result_id` bigint(20) unsigned NOT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_term_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_id` bigint(20) unsigned DEFAULT NULL,
  `quiz_id` bigint(20) unsigned DEFAULT NULL,
  `learning_outcome_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `mastery` enum('false','true') DEFAULT NULL,
  `score` double DEFAULT NULL,
  `attempts` int(10) unsigned DEFAULT NULL,
  `possible` double DEFAULT NULL,
  `original_score` double DEFAULT NULL,
  `original_possible` double DEFAULT NULL,
  `original_mastery` enum('false','true') DEFAULT NULL,
  `percent` double DEFAULT NULL,
  PRIMARY KEY (`learning_outcome_result_id`),
  KEY `account_id` (`account_id`),
  KEY `course_id` (`course_id`),
  KEY `enrollment_term_id` (`enrollment_term_id`),
  KEY `assignment_id` (`assignment_id`),
  KEY `quiz_id` (`quiz_id`),
  KEY `learning_outcome_id` (`learning_outcome_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for learning_outcome_rubric_criterion_dim
-- ----------------------------
DROP TABLE IF EXISTS `learning_outcome_rubric_criterion_dim`;
CREATE TABLE `learning_outcome_rubric_criterion_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `learning_outcome_id` bigint(20) unsigned DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `learning_outcome_id` (`learning_outcome_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for learning_outcome_rubric_criterion_fact
-- ----------------------------
DROP TABLE IF EXISTS `learning_outcome_rubric_criterion_fact`;
CREATE TABLE `learning_outcome_rubric_criterion_fact` (
  `learning_outcome_rubric_criterion_id` bigint(20) unsigned NOT NULL,
  `learning_outcome_id` bigint(20) unsigned DEFAULT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_term_id` bigint(20) unsigned DEFAULT NULL,
  `points` double DEFAULT NULL,
  PRIMARY KEY (`learning_outcome_rubric_criterion_id`),
  KEY `learning_outcome_id` (`learning_outcome_id`),
  KEY `account_id` (`account_id`),
  KEY `course_id` (`course_id`),
  KEY `enrollment_term_id` (`enrollment_term_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for module_completion_requirement_dim
-- ----------------------------
DROP TABLE IF EXISTS `module_completion_requirement_dim`;
CREATE TABLE `module_completion_requirement_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `module_id` bigint(20) unsigned DEFAULT NULL,
  `module_item_id` bigint(20) unsigned DEFAULT NULL,
  `requirement_type` enum('must_view','must_mark_done','min_score','must_submit','must_contribute') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `module_id` (`module_id`),
  KEY `module_item_id` (`module_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for module_completion_requirement_fact
-- ----------------------------
DROP TABLE IF EXISTS `module_completion_requirement_fact`;
CREATE TABLE `module_completion_requirement_fact` (
  `module_completion_requirement_id` bigint(20) unsigned NOT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_group_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `discussion_topic_id` bigint(20) unsigned DEFAULT NULL,
  `discussion_topic_editor_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_rollup_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_term_id` bigint(20) unsigned DEFAULT NULL,
  `file_id` bigint(20) unsigned DEFAULT NULL,
  `module_id` bigint(20) unsigned DEFAULT NULL,
  `module_item_id` bigint(20) unsigned DEFAULT NULL,
  `quiz_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `wiki_id` bigint(20) unsigned DEFAULT NULL,
  `wiki_page_id` bigint(20) unsigned DEFAULT NULL,
  `min_score` double DEFAULT NULL,
  PRIMARY KEY (`module_completion_requirement_id`),
  KEY `account_id` (`account_id`),
  KEY `assignment_id` (`assignment_id`),
  KEY `assignment_group_id` (`assignment_group_id`),
  KEY `course_id` (`course_id`),
  KEY `discussion_topic_id` (`discussion_topic_id`),
  KEY `discussion_topic_editor_id` (`discussion_topic_editor_id`),
  KEY `enrollment_rollup_id` (`enrollment_rollup_id`),
  KEY `enrollment_term_id` (`enrollment_term_id`),
  KEY `file_id` (`file_id`),
  KEY `module_id` (`module_id`),
  KEY `module_item_id` (`module_item_id`),
  KEY `quiz_id` (`quiz_id`),
  KEY `user_id` (`user_id`),
  KEY `wiki_id` (`wiki_id`),
  KEY `wiki_page_id` (`wiki_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for module_dim
-- ----------------------------
DROP TABLE IF EXISTS `module_dim`;
CREATE TABLE `module_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `require_sequential_progress` enum('required','not_required','unspecified','not_specified') DEFAULT NULL,
  `workflow_state` enum('locked','completed','unlocked','started','active','unpublished','deleted') DEFAULT NULL,
  `position` int(10) unsigned DEFAULT NULL,
  `name` longtext DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `unlock_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `course_id` (`course_id`),
  KEY `workflow_state` (`workflow_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for module_fact
-- ----------------------------
DROP TABLE IF EXISTS `module_fact`;
CREATE TABLE `module_fact` (
  `module_id` bigint(20) unsigned NOT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_term_id` bigint(20) unsigned DEFAULT NULL,
  `wiki_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`module_id`),
  KEY `account_id` (`account_id`),
  KEY `course_id` (`course_id`),
  KEY `enrollment_term_id` (`enrollment_term_id`),
  KEY `wiki_id` (`wiki_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for module_item_dim
-- ----------------------------
DROP TABLE IF EXISTS `module_item_dim`;
CREATE TABLE `module_item_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `discussion_topic_id` bigint(20) unsigned DEFAULT NULL,
  `file_id` bigint(20) unsigned DEFAULT NULL,
  `module_id` bigint(20) unsigned DEFAULT NULL,
  `quiz_id` bigint(20) unsigned DEFAULT NULL,
  `wiki_page_id` bigint(20) unsigned DEFAULT NULL,
  `content_type` enum('Assignment','Attachment','DiscussionTopic','ContextExternalTool','ContextModuleSubHeader','ExternalUrl','LearningOutcome','Quiz','Rubric','WikiPage') DEFAULT NULL,
  `workflow_state` enum('active','unpublished','deleted') DEFAULT NULL,
  `position` int(10) unsigned DEFAULT NULL,
  `title` longtext DEFAULT NULL,
  `url` longtext DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `assignment_id` (`assignment_id`),
  KEY `course_id` (`course_id`),
  KEY `discussion_topic_id` (`discussion_topic_id`),
  KEY `file_id` (`file_id`),
  KEY `module_id` (`module_id`),
  KEY `quiz_id` (`quiz_id`),
  KEY `wiki_page_id` (`wiki_page_id`),
  KEY `workflow_state` (`workflow_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for module_item_fact
-- ----------------------------
DROP TABLE IF EXISTS `module_item_fact`;
CREATE TABLE `module_item_fact` (
  `module_item_id` bigint(20) unsigned NOT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_group_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `discussion_topic_id` bigint(20) unsigned DEFAULT NULL,
  `discussion_topic_editor_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_rollup_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_term_id` bigint(20) unsigned DEFAULT NULL,
  `file_id` bigint(20) unsigned DEFAULT NULL,
  `module_id` bigint(20) unsigned DEFAULT NULL,
  `quiz_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `wiki_id` bigint(20) unsigned DEFAULT NULL,
  `wiki_page_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`module_item_id`),
  KEY `account_id` (`account_id`),
  KEY `assignment_id` (`assignment_id`),
  KEY `assignment_group_id` (`assignment_group_id`),
  KEY `course_id` (`course_id`),
  KEY `discussion_topic_id` (`discussion_topic_id`),
  KEY `discussion_topic_editor_id` (`discussion_topic_editor_id`),
  KEY `enrollment_rollup_id` (`enrollment_rollup_id`),
  KEY `enrollment_term_id` (`enrollment_term_id`),
  KEY `file_id` (`file_id`),
  KEY `module_id` (`module_id`),
  KEY `quiz_id` (`quiz_id`),
  KEY `user_id` (`user_id`),
  KEY `wiki_id` (`wiki_id`),
  KEY `wiki_page_id` (`wiki_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for module_prerequisite_dim
-- ----------------------------
DROP TABLE IF EXISTS `module_prerequisite_dim`;
CREATE TABLE `module_prerequisite_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `module_id` bigint(20) unsigned DEFAULT NULL,
  `prerequisite_module_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `module_id` (`module_id`),
  KEY `prerequisite_module_id` (`prerequisite_module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for module_prerequisite_fact
-- ----------------------------
DROP TABLE IF EXISTS `module_prerequisite_fact`;
CREATE TABLE `module_prerequisite_fact` (
  `module_prerequisite_id` bigint(20) unsigned NOT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_term_id` bigint(20) unsigned DEFAULT NULL,
  `module_id` bigint(20) unsigned DEFAULT NULL,
  `prerequisite_module_id` bigint(20) unsigned DEFAULT NULL,
  `prerequisite_wiki_id` bigint(20) unsigned DEFAULT NULL,
  `wiki_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`module_prerequisite_id`),
  KEY `account_id` (`account_id`),
  KEY `course_id` (`course_id`),
  KEY `enrollment_term_id` (`enrollment_term_id`),
  KEY `module_id` (`module_id`),
  KEY `prerequisite_module_id` (`prerequisite_module_id`),
  KEY `prerequisite_wiki_id` (`prerequisite_wiki_id`),
  KEY `wiki_id` (`wiki_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for module_progression_completion_requirement_dim
-- ----------------------------
DROP TABLE IF EXISTS `module_progression_completion_requirement_dim`;
CREATE TABLE `module_progression_completion_requirement_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `module_progression_id` bigint(20) unsigned DEFAULT NULL,
  `module_item_id` bigint(20) unsigned DEFAULT NULL,
  `requirement_type` enum('must_view','must_mark_done','min_score','must_submit','must_contribute') DEFAULT NULL,
  `completion_status` enum('complete','incomplete') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `module_progression_id` (`module_progression_id`),
  KEY `module_item_id` (`module_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for module_progression_completion_requirement_fact
-- ----------------------------
DROP TABLE IF EXISTS `module_progression_completion_requirement_fact`;
CREATE TABLE `module_progression_completion_requirement_fact` (
  `module_progression_completion_requirement_id` bigint(20) unsigned NOT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_group_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `discussion_topic_id` bigint(20) unsigned DEFAULT NULL,
  `discussion_topic_editor_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_rollup_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_term_id` bigint(20) unsigned DEFAULT NULL,
  `file_id` bigint(20) unsigned DEFAULT NULL,
  `module_id` bigint(20) unsigned DEFAULT NULL,
  `module_item_id` bigint(20) unsigned DEFAULT NULL,
  `module_progression_id` bigint(20) unsigned DEFAULT NULL,
  `quiz_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `wiki_id` bigint(20) unsigned DEFAULT NULL,
  `wiki_page_id` bigint(20) unsigned DEFAULT NULL,
  `min_score` double DEFAULT NULL,
  `score` double DEFAULT NULL,
  PRIMARY KEY (`module_progression_completion_requirement_id`),
  KEY `account_id` (`account_id`),
  KEY `assignment_id` (`assignment_id`),
  KEY `assignment_group_id` (`assignment_group_id`),
  KEY `course_id` (`course_id`),
  KEY `discussion_topic_id` (`discussion_topic_id`),
  KEY `discussion_topic_editor_id` (`discussion_topic_editor_id`),
  KEY `enrollment_rollup_id` (`enrollment_rollup_id`),
  KEY `enrollment_term_id` (`enrollment_term_id`),
  KEY `file_id` (`file_id`),
  KEY `module_id` (`module_id`),
  KEY `module_item_id` (`module_item_id`),
  KEY `module_progression_id` (`module_progression_id`),
  KEY `quiz_id` (`quiz_id`),
  KEY `user_id` (`user_id`),
  KEY `wiki_id` (`wiki_id`),
  KEY `wiki_page_id` (`wiki_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for module_progression_dim
-- ----------------------------
DROP TABLE IF EXISTS `module_progression_dim`;
CREATE TABLE `module_progression_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `module_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `collapsed` enum('collapsed','not_collapsed','unspecified','true','false') DEFAULT NULL,
  `is_current` enum('current','not_current','unspecified','true','false') DEFAULT NULL,
  `workflow_state` enum('locked','completed','unlocked','started') DEFAULT NULL,
  `current_position` int(10) unsigned DEFAULT NULL,
  `lock_version` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `evaluated_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `module_id` (`module_id`),
  KEY `user_id` (`user_id`),
  KEY `workflow_state` (`workflow_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for module_progression_fact
-- ----------------------------
DROP TABLE IF EXISTS `module_progression_fact`;
CREATE TABLE `module_progression_fact` (
  `module_progression_id` bigint(20) unsigned NOT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_term_id` bigint(20) unsigned DEFAULT NULL,
  `module_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `wiki_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`module_progression_id`),
  KEY `account_id` (`account_id`),
  KEY `course_id` (`course_id`),
  KEY `enrollment_term_id` (`enrollment_term_id`),
  KEY `module_id` (`module_id`),
  KEY `user_id` (`user_id`),
  KEY `wiki_id` (`wiki_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for pseudonym_dim
-- ----------------------------
DROP TABLE IF EXISTS `pseudonym_dim`;
CREATE TABLE `pseudonym_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `workflow_state` enum('active','deleted','suspended') DEFAULT NULL,
  `last_request_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `current_login_at` datetime DEFAULT NULL,
  `last_login_ip` varchar(256) DEFAULT NULL,
  `current_login_ip` varchar(256) DEFAULT NULL,
  `position` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `password_auto__generated` enum('false','true') DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `sis_user_id` varchar(256) DEFAULT NULL,
  `unique_name` varchar(256) DEFAULT NULL,
  `integration_id` varchar(256) DEFAULT NULL,
  `authentication_provider_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `user_id` (`user_id`),
  KEY `account_id` (`account_id`),
  KEY `workflow_state` (`workflow_state`),
  KEY `sis_user_id` (`sis_user_id`),
  KEY `integration_id` (`integration_id`),
  KEY `authentication_provider_id` (`authentication_provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for pseudonym_fact
-- ----------------------------
DROP TABLE IF EXISTS `pseudonym_fact`;
CREATE TABLE `pseudonym_fact` (
  `pseudonym_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `login_count` int(10) unsigned DEFAULT NULL,
  `failed_login_count` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`pseudonym_id`),
  KEY `user_id` (`user_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for quiz_dim
-- ----------------------------
DROP TABLE IF EXISTS `quiz_dim`;
CREATE TABLE `quiz_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `root_account_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `points_possible` double DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `quiz_type` enum('practice_quiz','assignment','graded_survey','survey','NULL') DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_id` bigint(20) unsigned DEFAULT NULL,
  `workflow_state` enum('unpublished','published','deleted') DEFAULT NULL,
  `scoring_policy` enum('keep_highest','keep_latest','keep_average') DEFAULT NULL,
  `anonymous_submissions` enum('allow_anonymous_submissions','disallow_anonymous_submissions') DEFAULT NULL,
  `display_questions` enum('multiple_at_a_time','one_at_a_time','one_question_at_a_time') DEFAULT NULL,
  `answer_display_order` enum('in_order','shuffled','shuffle_answers') DEFAULT NULL,
  `go_back_to_previous_question` enum('display_questions','one_at_a_time','allow_going_back','disallow_going_back','cant_go_back') DEFAULT NULL,
  `could_be_locked` enum('allow_locking','disallow_locking') DEFAULT NULL,
  `browser_lockdown` enum('required','not_required') DEFAULT NULL,
  `browser_lockdown_for_displaying_results` enum('hide_results','never','until_after_last_attempt','required','not_required') DEFAULT NULL,
  `browser_lockdown_monitor` enum('required','not_required') DEFAULT NULL,
  `ip_filter` varchar(256) DEFAULT NULL,
  `show_results` enum('always','never','always_after_last_attempt','only_once_after_last_attempt') DEFAULT NULL,
  `show_correct_answers` enum('always','never','always_after_last_attempt','only_once_after_last_attempt') DEFAULT NULL,
  `show_correct_answers_at` datetime DEFAULT NULL,
  `hide_correct_answers_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `unlock_at` datetime DEFAULT NULL,
  `lock_at` datetime DEFAULT NULL,
  `due_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `root_account_id` (`root_account_id`),
  KEY `course_id` (`course_id`),
  KEY `assignment_id` (`assignment_id`),
  KEY `workflow_state` (`workflow_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for quiz_fact
-- ----------------------------
DROP TABLE IF EXISTS `quiz_fact`;
CREATE TABLE `quiz_fact` (
  `quiz_id` bigint(20) unsigned NOT NULL,
  `points_possible` double DEFAULT NULL,
  `time_limit` int(10) DEFAULT NULL,
  `allowed_attempts` int(10) DEFAULT NULL,
  `unpublished_question_count` int(10) unsigned DEFAULT NULL,
  `question_count` int(10) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_id` bigint(20) unsigned DEFAULT NULL,
  `course_account_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_term_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`quiz_id`),
  KEY `course_id` (`course_id`),
  KEY `assignment_id` (`assignment_id`),
  KEY `course_account_id` (`course_account_id`),
  KEY `enrollment_term_id` (`enrollment_term_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for quiz_question_answer_dim
-- ----------------------------
DROP TABLE IF EXISTS `quiz_question_answer_dim`;
CREATE TABLE `quiz_question_answer_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `quiz_question_id` bigint(20) unsigned DEFAULT NULL,
  `text` longtext DEFAULT NULL,
  `html` longtext DEFAULT NULL,
  `comments` longtext DEFAULT NULL,
  `text_after_answers` longtext DEFAULT NULL,
  `answer_match_left` varchar(512) DEFAULT NULL,
  `answer_match_right` varchar(512) DEFAULT NULL,
  `matching_answer_incorrect_matches` varchar(256) DEFAULT NULL,
  `numerical_answer_type` enum('numerical_question','NULL','exact_answer','range_answer') DEFAULT NULL,
  `blank_id` varchar(256) DEFAULT NULL,
  `exact` double DEFAULT NULL,
  `margin` double DEFAULT NULL,
  `starting_range` double DEFAULT NULL,
  `ending_range` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `canvas_id` (`canvas_id`),
  KEY `quiz_question_id` (`quiz_question_id`),
  KEY `blank_id` (`blank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for quiz_question_answer_fact
-- ----------------------------
DROP TABLE IF EXISTS `quiz_question_answer_fact`;
CREATE TABLE `quiz_question_answer_fact` (
  `quiz_question_answer_id` bigint(20) unsigned NOT NULL,
  `quiz_question_id` bigint(20) unsigned DEFAULT NULL,
  `quiz_question_group_id` bigint(20) unsigned DEFAULT NULL,
  `quiz_id` bigint(20) unsigned DEFAULT NULL,
  `assessment_question_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_id` bigint(20) unsigned DEFAULT NULL,
  `course_account_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_term_id` bigint(20) unsigned DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `exact` double DEFAULT NULL,
  `margin` double DEFAULT NULL,
  `starting_range` double DEFAULT NULL,
  `ending_range` double DEFAULT NULL,
  PRIMARY KEY (`quiz_question_answer_id`),
  KEY `quiz_question_id` (`quiz_question_id`),
  KEY `quiz_question_group_id` (`quiz_question_group_id`),
  KEY `quiz_id` (`quiz_id`),
  KEY `assessment_question_id` (`assessment_question_id`),
  KEY `course_id` (`course_id`),
  KEY `assignment_id` (`assignment_id`),
  KEY `course_account_id` (`course_account_id`),
  KEY `enrollment_term_id` (`enrollment_term_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for quiz_question_dim
-- ----------------------------
DROP TABLE IF EXISTS `quiz_question_dim`;
CREATE TABLE `quiz_question_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `quiz_id` bigint(20) unsigned DEFAULT NULL,
  `quiz_question_group_id` bigint(20) unsigned DEFAULT NULL,
  `position` int(10) unsigned DEFAULT NULL,
  `workflow_state` enum('unpublished','published','deleted') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `assessment_question_id` bigint(20) unsigned DEFAULT NULL,
  `assessment_question_version` int(10) unsigned DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `question_type` enum('calculated_question','essay_question','file_upload_question','fill_in_multiple_blanks_question','matching_question','multiple_answers_question','multiple_choice_question','multiple_dropdowns_question','numerical_question','short_answer_question','text_only_question','true_false_question') DEFAULT NULL,
  `question_text` longtext DEFAULT NULL,
  `regrade_option` enum('available','unavailable','multiple_answers_question','multiple_choice_question','true_false_question','NULL') DEFAULT NULL,
  `correct_comments` longtext DEFAULT NULL,
  `incorrect_comments` longtext DEFAULT NULL,
  `neutral_comments` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `quiz_id` (`quiz_id`),
  KEY `quiz_question_group_id` (`quiz_question_group_id`),
  KEY `workflow_state` (`workflow_state`),
  KEY `assessment_question_id` (`assessment_question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for quiz_question_fact
-- ----------------------------
DROP TABLE IF EXISTS `quiz_question_fact`;
CREATE TABLE `quiz_question_fact` (
  `quiz_question_id` bigint(20) unsigned NOT NULL,
  `quiz_id` bigint(20) unsigned DEFAULT NULL,
  `quiz_question_group_id` bigint(20) unsigned DEFAULT NULL,
  `assessment_question_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_id` bigint(20) unsigned DEFAULT NULL,
  `course_account_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_term_id` bigint(20) unsigned DEFAULT NULL,
  `points_possible` double DEFAULT NULL,
  PRIMARY KEY (`quiz_question_id`),
  KEY `quiz_id` (`quiz_id`),
  KEY `quiz_question_group_id` (`quiz_question_group_id`),
  KEY `assessment_question_id` (`assessment_question_id`),
  KEY `course_id` (`course_id`),
  KEY `assignment_id` (`assignment_id`),
  KEY `course_account_id` (`course_account_id`),
  KEY `enrollment_term_id` (`enrollment_term_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for quiz_question_group_dim
-- ----------------------------
DROP TABLE IF EXISTS `quiz_question_group_dim`;
CREATE TABLE `quiz_question_group_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `quiz_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `position` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `quiz_id` (`quiz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for quiz_question_group_fact
-- ----------------------------
DROP TABLE IF EXISTS `quiz_question_group_fact`;
CREATE TABLE `quiz_question_group_fact` (
  `quiz_question_group_id` bigint(20) unsigned NOT NULL,
  `quiz_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_term_id` bigint(20) unsigned DEFAULT NULL,
  `pick_count` int(10) unsigned DEFAULT NULL,
  `question_points` double DEFAULT NULL,
  `course_account_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`quiz_question_group_id`),
  KEY `quiz_id` (`quiz_id`),
  KEY `course_id` (`course_id`),
  KEY `assignment_id` (`assignment_id`),
  KEY `enrollment_term_id` (`enrollment_term_id`),
  KEY `course_account_id` (`course_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for quiz_submission_dim
-- ----------------------------
DROP TABLE IF EXISTS `quiz_submission_dim`;
CREATE TABLE `quiz_submission_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `quiz_id` bigint(20) unsigned DEFAULT NULL,
  `submission_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `workflow_state` enum('untaken','complete','pending_review','preview','settings_only','essay_question') DEFAULT NULL,
  `quiz_state_during_submission` varchar(256) DEFAULT NULL,
  `submission_scoring_policy` enum('keep_highest','keep_latest','keep_average','manually_overridden') DEFAULT NULL,
  `submission_source` enum('student','test_preview') DEFAULT NULL,
  `has_seen_results` varchar(256) DEFAULT NULL,
  `temporary_user_code` varchar(256) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `finished_at` datetime DEFAULT NULL,
  `due_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `quiz_id` (`quiz_id`),
  KEY `submission_id` (`submission_id`),
  KEY `user_id` (`user_id`),
  KEY `workflow_state` (`workflow_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for quiz_submission_fact
-- ----------------------------
DROP TABLE IF EXISTS `quiz_submission_fact`;
CREATE TABLE `quiz_submission_fact` (
  `score` double DEFAULT NULL,
  `kept_score` double DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_term_id` bigint(20) unsigned DEFAULT NULL,
  `course_account_id` bigint(20) unsigned DEFAULT NULL,
  `quiz_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `submission_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_rollup_id` bigint(20) unsigned DEFAULT NULL,
  `quiz_submission_id` bigint(20) unsigned NOT NULL,
  `quiz_points_possible` double DEFAULT NULL,
  `score_before_regrade` double DEFAULT NULL,
  `fudge_points` double DEFAULT NULL,
  `total_attempts` int(10) unsigned DEFAULT NULL,
  `extra_attempts` int(10) unsigned DEFAULT NULL,
  `extra_time` int(10) unsigned DEFAULT NULL,
  `time_taken` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`quiz_submission_id`),
  KEY `course_id` (`course_id`),
  KEY `enrollment_term_id` (`enrollment_term_id`),
  KEY `course_account_id` (`course_account_id`),
  KEY `quiz_id` (`quiz_id`),
  KEY `assignment_id` (`assignment_id`),
  KEY `user_id` (`user_id`),
  KEY `submission_id` (`submission_id`),
  KEY `enrollment_rollup_id` (`enrollment_rollup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for quiz_submission_historical_dim
-- ----------------------------
DROP TABLE IF EXISTS `quiz_submission_historical_dim`;
CREATE TABLE `quiz_submission_historical_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `quiz_id` bigint(20) unsigned DEFAULT NULL,
  `submission_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `version_number` int(10) unsigned DEFAULT NULL,
  `submission_state` enum('current_submission','previous_submission') DEFAULT NULL,
  `workflow_state` enum('untaken','complete','pending_review','preview','settings_only') DEFAULT NULL,
  `quiz_state_during_submission` varchar(256) DEFAULT NULL,
  `submission_scoring_policy` enum('keep_highest','keep_latest','keep_average','manually_overridden') DEFAULT NULL,
  `submission_source` enum('student','test_preview') DEFAULT NULL,
  `has_seen_results` varchar(256) DEFAULT NULL,
  `temporary_user_code` varchar(256) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `finished_at` datetime DEFAULT NULL,
  `due_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `canvas_id` (`canvas_id`),
  KEY `quiz_id` (`quiz_id`),
  KEY `submission_id` (`submission_id`),
  KEY `user_id` (`user_id`),
  KEY `workflow_state` (`workflow_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for quiz_submission_historical_fact
-- ----------------------------
DROP TABLE IF EXISTS `quiz_submission_historical_fact`;
CREATE TABLE `quiz_submission_historical_fact` (
  `quiz_submission_historical_id` bigint(20) unsigned NOT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_term_id` bigint(20) unsigned DEFAULT NULL,
  `course_account_id` bigint(20) unsigned DEFAULT NULL,
  `quiz_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `submission_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_rollup_id` bigint(20) unsigned DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `score` double DEFAULT NULL,
  `kept_score` double DEFAULT NULL,
  `quiz_points_possible` double DEFAULT NULL,
  `score_before_regrade` double DEFAULT NULL,
  `fudge_points` double DEFAULT NULL,
  `total_attempts` int(10) unsigned DEFAULT NULL,
  `time_taken` int(10) unsigned DEFAULT NULL,
  `extra_attempts` int(10) unsigned DEFAULT NULL,
  `extra_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`quiz_submission_historical_id`),
  KEY `course_id` (`course_id`),
  KEY `enrollment_term_id` (`enrollment_term_id`),
  KEY `course_account_id` (`course_account_id`),
  KEY `quiz_id` (`quiz_id`),
  KEY `assignment_id` (`assignment_id`),
  KEY `user_id` (`user_id`),
  KEY `submission_id` (`submission_id`),
  KEY `enrollment_rollup_id` (`enrollment_rollup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for requests
-- ----------------------------
DROP TABLE IF EXISTS `requests`;
CREATE TABLE `requests` (
  `pkey` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id` varchar(128) DEFAULT NULL,
  `timestamp` datetime(3) DEFAULT NULL,
  `timestamp_year` varchar(8) DEFAULT NULL,
  `timestamp_month` varchar(16) DEFAULT NULL,
  `timestamp_day` varchar(32) DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `root_account_id` bigint(20) unsigned DEFAULT NULL,
  `course_account_id` bigint(20) unsigned DEFAULT NULL,
  `quiz_id` bigint(20) unsigned DEFAULT NULL,
  `discussion_id` bigint(20) unsigned DEFAULT NULL,
  `conversation_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_id` bigint(20) unsigned DEFAULT NULL,
  `url` longtext DEFAULT NULL,
  `user_agent` longtext DEFAULT NULL,
  `http_method` varchar(16) DEFAULT NULL,
  `remote_ip` varchar(64) DEFAULT NULL,
  `interaction_micros` bigint(20) unsigned DEFAULT NULL,
  `web_application_controller` varchar(128) DEFAULT NULL,
  `web_application_action` varchar(128) DEFAULT NULL,
  `web_application_context_type` varchar(128) DEFAULT NULL,
  `web_application_context_id` varchar(128) DEFAULT NULL,
  `real_user_id` bigint(20) unsigned DEFAULT NULL,
  `session_id` varchar(128) DEFAULT NULL,
  `user_agent_id` bigint(20) unsigned DEFAULT NULL,
  `http_status` int(10) unsigned DEFAULT NULL,
  `http_version` varchar(16) DEFAULT NULL,
  `developer_key_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`pkey`),
  KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `course_id` (`course_id`),
  KEY `real_user_id` (`real_user_id`),
  KEY `timestamp_month` (`timestamp_month`),
  KEY `timestamp_day` (`timestamp_day`),
  KEY `web_application_controller` (`web_application_controller`),
  KEY `web_application_action` (`web_application_action`),
  KEY `web_application_context_type` (`web_application_context_type`)
) ENGINE=InnoDB AUTO_INCREMENT=138811907 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for role_dim
-- ----------------------------
DROP TABLE IF EXISTS `role_dim`;
CREATE TABLE `role_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `root_account_id` bigint(20) unsigned DEFAULT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `base_role_type` varchar(256) DEFAULT NULL,
  `workflow_state` enum('active','built_in','deleted','inactive') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `root_account_id` (`root_account_id`),
  KEY `account_id` (`account_id`),
  KEY `workflow_state` (`workflow_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for submission_comment_dim
-- ----------------------------
DROP TABLE IF EXISTS `submission_comment_dim`;
CREATE TABLE `submission_comment_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `submission_id` bigint(20) unsigned DEFAULT NULL,
  `recipient_id` bigint(20) unsigned DEFAULT NULL,
  `author_id` bigint(20) unsigned DEFAULT NULL,
  `assessment_request_id` bigint(20) unsigned DEFAULT NULL,
  `group_comment_id` varchar(256) DEFAULT NULL,
  `comment` longtext DEFAULT NULL,
  `author_name` varchar(256) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `anonymous` enum('false','true') DEFAULT NULL,
  `teacher_only_comment` enum('false','true') DEFAULT NULL,
  `hidden` enum('false','true') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `submission_id` (`submission_id`),
  KEY `author_id` (`author_id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `assessment_request_id` (`assessment_request_id`),
  KEY `group_comment_id` (`group_comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for submission_comment_fact
-- ----------------------------
DROP TABLE IF EXISTS `submission_comment_fact`;
CREATE TABLE `submission_comment_fact` (
  `submission_comment_id` bigint(20) unsigned NOT NULL,
  `submission_id` bigint(20) unsigned DEFAULT NULL,
  `recipient_id` bigint(20) unsigned DEFAULT NULL,
  `author_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_term_id` bigint(20) unsigned DEFAULT NULL,
  `course_account_id` bigint(20) unsigned DEFAULT NULL,
  `message_size_bytes` int(10) unsigned DEFAULT NULL,
  `message_character_count` int(10) unsigned DEFAULT NULL,
  `message_word_count` int(10) unsigned DEFAULT NULL,
  `message_line_count` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`submission_comment_id`),
  KEY `course_id` (`course_id`),
  KEY `assignment_id` (`assignment_id`),
  KEY `submission_id` (`submission_id`),
  KEY `submission_comment_id` (`submission_comment_id`),
  KEY `author_id` (`author_id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `enrollment_term_id` (`enrollment_term_id`),
  KEY `course_account_id` (`course_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for submission_dim
-- ----------------------------
DROP TABLE IF EXISTS `submission_dim`;
CREATE TABLE `submission_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `group_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_id` bigint(20) unsigned DEFAULT NULL,
  `quiz_submission_id` bigint(20) unsigned DEFAULT NULL,
  `submission_type` enum('discussion_topic','external_tool','media_recording','online_file_upload','online_quiz','online_text_entry','online_upload','online_url','basic_lti_launch') DEFAULT NULL,
  `workflow_state` enum('graded','pending_review','submitted','unsubmitted','deleted') DEFAULT NULL,
  `attempt` int(10) unsigned DEFAULT NULL,
  `grade_matches_current_submission` enum('false','true') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `submitted_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `graded_at` datetime DEFAULT NULL,
  `posted_at` datetime DEFAULT NULL,
  `grade_state` enum('auto_graded','human_graded','not_graded') DEFAULT NULL,
  `grade` varchar(256) DEFAULT NULL,
  `published_grade` varchar(256) DEFAULT NULL,
  `grader_id` bigint(20) unsigned DEFAULT NULL,
  `graded_anonymously` enum('graded_anonymously','not_graded_anonymously') DEFAULT NULL,
  `has_rubric_assessment` enum('false','true') DEFAULT NULL,
  `has_admin_comment` enum('false','true') DEFAULT NULL,
  `excused` enum('excused_submission','regular_submission') DEFAULT NULL,
  `processed` enum('false','true') DEFAULT NULL,
  `process_attempts` int(10) unsigned DEFAULT NULL,
  `url` varchar(256) DEFAULT NULL,
  `body` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`),
  KEY `assignment_id` (`assignment_id`),
  KEY `quiz_submission_id` (`quiz_submission_id`),
  KEY `workflow_state` (`workflow_state`),
  KEY `grader_id` (`grader_id`),
  KEY `submitted_at` (`submitted_at`) USING BTREE,
  KEY `updated_at` (`updated_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for submission_fact
-- ----------------------------
DROP TABLE IF EXISTS `submission_fact`;
CREATE TABLE `submission_fact` (
  `submission_id` bigint(20) unsigned NOT NULL,
  `assignment_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_term_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `grader_id` bigint(20) unsigned DEFAULT NULL,
  `course_account_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_rollup_id` bigint(20) unsigned DEFAULT NULL,
  `score` double DEFAULT NULL,
  `published_score` double DEFAULT NULL,
  `what_if_score` double DEFAULT NULL,
  `submission_comments_count` int(10) unsigned DEFAULT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_group_id` bigint(20) unsigned DEFAULT NULL,
  `group_id` bigint(20) unsigned DEFAULT NULL,
  `quiz_id` bigint(20) unsigned DEFAULT NULL,
  `quiz_submission_id` bigint(20) unsigned DEFAULT NULL,
  `wiki_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`submission_id`),
  KEY `user_id` (`user_id`),
  KEY `course_id` (`course_id`),
  KEY `assignment_id` (`assignment_id`),
  KEY `submission_id` (`submission_id`),
  KEY `enrollment_term_id` (`enrollment_term_id`),
  KEY `grader_id` (`grader_id`),
  KEY `course_account_id` (`course_account_id`),
  KEY `enrollment_rollup_id` (`enrollment_rollup_id`),
  KEY `account_id` (`account_id`),
  KEY `assignment_group_id` (`assignment_group_id`),
  KEY `group_id` (`group_id`),
  KEY `quiz_id` (`quiz_id`),
  KEY `quiz_submission_id` (`quiz_submission_id`),
  KEY `wiki_id` (`wiki_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for submission_file_fact
-- ----------------------------
DROP TABLE IF EXISTS `submission_file_fact`;
CREATE TABLE `submission_file_fact` (
  `submission_file_id` bigint(20) unsigned NOT NULL,
  `file_id` bigint(20) unsigned DEFAULT NULL,
  `submission_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `grader_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_term_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`submission_file_id`),
  KEY `submission_file_id` (`submission_file_id`),
  KEY `submission_id` (`submission_id`),
  KEY `user_id` (`user_id`),
  KEY `course_id` (`course_id`),
  KEY `file_id` (`file_id`),
  KEY `assignment_id` (`assignment_id`),
  KEY `grader_id` (`grader_id`),
  KEY `enrollment_term_id` (`enrollment_term_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for user_dim
-- ----------------------------
DROP TABLE IF EXISTS `user_dim`;
CREATE TABLE `user_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `root_account_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `time_zone` varchar(256) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `visibility` varchar(256) DEFAULT NULL,
  `school_name` varchar(256) DEFAULT NULL,
  `school_position` varchar(256) DEFAULT NULL,
  `gender` varchar(256) DEFAULT NULL,
  `locale` varchar(256) DEFAULT NULL,
  `public` varchar(256) DEFAULT NULL,
  `birthdate` datetime DEFAULT NULL,
  `country_code` varchar(256) DEFAULT NULL,
  `workflow_state` enum('creation_pending','deleted','pre_registered','registered') DEFAULT NULL,
  `sortable_name` varchar(256) DEFAULT NULL,
  `global_canvas_id` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `root_account_id` (`root_account_id`),
  KEY `workflow_state` (`workflow_state`),
  KEY `global_canvas_id` (`global_canvas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for wiki_dim
-- ----------------------------
DROP TABLE IF EXISTS `wiki_dim`;
CREATE TABLE `wiki_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `parent_type` varchar(256) DEFAULT NULL,
  `title` longtext DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `front_page_url` longtext DEFAULT NULL,
  `has_no_front_page` enum('false','true') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for wiki_fact
-- ----------------------------
DROP TABLE IF EXISTS `wiki_fact`;
CREATE TABLE `wiki_fact` (
  `wiki_id` bigint(20) unsigned NOT NULL,
  `parent_course_id` bigint(20) unsigned DEFAULT NULL,
  `parent_group_id` bigint(20) unsigned DEFAULT NULL,
  `parent_course_account_id` bigint(20) unsigned DEFAULT NULL,
  `parent_group_account_id` bigint(20) unsigned DEFAULT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `root_account_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_term_id` bigint(20) unsigned DEFAULT NULL,
  `group_category_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`wiki_id`),
  KEY `wiki_id` (`wiki_id`),
  KEY `parent_course_id` (`parent_course_id`),
  KEY `parent_group_id` (`parent_group_id`),
  KEY `parent_course_account_id` (`parent_course_account_id`),
  KEY `parent_group_account_id` (`parent_group_account_id`),
  KEY `account_id` (`account_id`),
  KEY `root_account_id` (`root_account_id`),
  KEY `enrollment_term_id` (`enrollment_term_id`),
  KEY `group_category_id` (`group_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for wiki_page_dim
-- ----------------------------
DROP TABLE IF EXISTS `wiki_page_dim`;
CREATE TABLE `wiki_page_dim` (
  `id` bigint(20) unsigned NOT NULL,
  `canvas_id` bigint(20) unsigned DEFAULT NULL,
  `title` longtext DEFAULT NULL,
  `body` longtext DEFAULT NULL,
  `workflow_state` enum('active','unpublished','deleted') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `url` longtext DEFAULT NULL,
  `protected_editing` enum('false','true') DEFAULT NULL,
  `editing_roles` varchar(256) DEFAULT NULL,
  `revised_at` datetime DEFAULT NULL,
  `could_be_locked` enum('false','true') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_id` (`canvas_id`),
  KEY `workflow_state` (`workflow_state`),
  FULLTEXT KEY `body` (`body`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for wiki_page_fact
-- ----------------------------
DROP TABLE IF EXISTS `wiki_page_fact`;
CREATE TABLE `wiki_page_fact` (
  `wiki_page_id` bigint(20) unsigned NOT NULL,
  `wiki_id` bigint(20) unsigned DEFAULT NULL,
  `parent_course_id` bigint(20) unsigned DEFAULT NULL,
  `parent_group_id` bigint(20) unsigned DEFAULT NULL,
  `parent_course_account_id` bigint(20) unsigned DEFAULT NULL,
  `parent_group_account_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `root_account_id` bigint(20) unsigned DEFAULT NULL,
  `enrollment_term_id` bigint(20) unsigned DEFAULT NULL,
  `group_category_id` bigint(20) unsigned DEFAULT NULL,
  `wiki_page_comments_count` int(10) unsigned DEFAULT NULL,
  `view_count` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`wiki_page_id`),
  KEY `wiki_id` (`wiki_id`),
  KEY `user_id` (`user_id`),
  KEY `wiki_page_id` (`wiki_page_id`),
  KEY `parent_course_id` (`parent_course_id`),
  KEY `account_id` (`account_id`),
  KEY `parent_group_id` (`parent_group_id`),
  KEY `parent_course_account_id` (`parent_course_account_id`),
  KEY `parent_group_account_id` (`parent_group_account_id`),
  KEY `root_account_id` (`root_account_id`),
  KEY `enrollment_term_id` (`enrollment_term_id`),
  KEY `group_category_id` (`group_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- View structure for ls_monitored_accounts
-- ----------------------------
DROP VIEW IF EXISTS `ls_monitored_accounts`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `ls_monitored_accounts` AS select `acc`.`id` AS `id`,`acc`.`name` AS `NAME` from `account_dim` `acc` where `acc`.`name` not in ('Sandbox','VETDSS','VET','Templates','JH Account','Student Resources','WIL','Training','Test','Manually-Created Courses','Ruth Fleishman sandbox','Short Courses','Exemplar','Collarts Resources','Unit Refresh','Dev','Onboarding','ED TECH','PROJECTS','ORIENTATION');

-- ----------------------------
-- View structure for vw_assignment_due_date
-- ----------------------------
DROP VIEW IF EXISTS `vw_assignment_due_date`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_assignment_due_date` AS select `e`.`user_id` AS `user_id`,`a`.`course_id` AS `course_id`,`e`.`id` AS `enrollment_id`,`a`.`id` AS `assignment_id`,`c`.`enrollment_term_id` AS `enrollment_term_id`,`e`.`created_at` AS `enrollment_created_at`,`c`.`start_at` AS `course_start`,`c`.`conclude_at` AS `course_end`,`t`.`date_start` AS `term_start`,`t`.`date_end` AS `term_end`,`ovu`.`assignment_override_id` AS `assignment_override_id`,`a`.`unlock_at` AS `original_unlock_at`,`a`.`due_at` AS `original_due_at`,`a`.`lock_at` AS `original_lock_at`,`ov`.`unlock_at` AS `override_unlock_at`,`ov`.`due_at` AS `override_due_at`,`ov`.`lock_at` AS `override_lock_at`,`ov`.`unlock_at_overridden` AS `overridden_unlock_flag`,`ov`.`due_at_overridden` AS `overridden_due_flag`,`ov`.`lock_at_overridden` AS `overridden_lock_flag`,if(`c`.`start_at` is not null,`c`.`start_at`,`t`.`date_start`) AS `calculated_course_start`,if(`ov`.`unlock_at` is not null,`ov`.`unlock_at`,`a`.`unlock_at`) AS `calculated_unlock_at`,if(`ov`.`due_at` is not null,`ov`.`due_at`,`a`.`due_at`) AS `calculated_due_at`,if(`ov`.`lock_at` is not null,`ov`.`lock_at`,`a`.`lock_at`) AS `calculated_lock_at`,if(`c`.`conclude_at` is not null,`c`.`conclude_at`,`t`.`date_end`) AS `calculated_course_end`,if(utc_timestamp() >= if(`ov`.`due_at` is not null,`ov`.`due_at`,`a`.`due_at`),'due','not_yet_due') AS `calculated_due_state` from (((((`course_dim` `c` join `assignment_dim` `a` on(`a`.`course_id` = `c`.`id` and `a`.`workflow_state` <> 'deleted' and `c`.`workflow_state` <> 'deleted')) join `enrollment_term_dim` `t` on(`t`.`id` = `c`.`enrollment_term_id`)) left join `enrollment_dim` `e` on(`e`.`course_id` = `c`.`id` and `e`.`type` = 'StudentEnrollment' and `e`.`workflow_state` not in ('deleted','inactive','rejected'))) left join `assignment_override_user_dim` `ovu` on(`ovu`.`user_id` = `e`.`user_id` and `ovu`.`assignment_id` = `a`.`id` and exists(select 1 from `assignment_override_dim` `ao` where `ao`.`id` = `ovu`.`assignment_override_id` and `ao`.`workflow_state` <> 'deleted' limit 1))) left join `assignment_override_dim` `ov` on(`ov`.`id` = `ovu`.`assignment_override_id`));

-- ----------------------------
-- View structure for vw_assignment_rubrics
-- ----------------------------
DROP VIEW IF EXISTS `vw_assignment_rubrics`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_assignment_rubrics` AS select `c`.`id` AS `course_id`,`c`.`canvas_id` AS `course_canvas_id`,`a`.`id` AS `assignment_id`,`j`.`id` AS `rubric_association_id`,`r`.`id` AS `rubric_id`,`r`.`id` AS `rubric_canvas_id`,`r`.`points_possible` AS `rubric_points_possible`,`r`.`title` AS `rubric_title`,`r`.`reusable` AS `rubric_is_reuseable`,`r`.`public` AS `rubric_is_public`,`r`.`read_only` AS `rubric_is_read_only`,`r`.`free_form_criterion_comments` AS `rubric_free_form_criterion_comments`,`r`.`hide_score_total` AS `rubric_hide_score_total`,`j`.`purpose` AS `rubric_purpose`,`r`.`retrieved_at` AS `rubric_retrieved_at`,`cri`.`id` AS `criterion_id`,`cri`.`ordinal` AS `criterion_ordinal`,`cri`.`title` AS `criterion_title`,`cri`.`description` AS `criterion_description`,`cri`.`points` AS `criterion_points`,`cri`.`mastery_points` AS `criterion_mastery_points`,`cri`.`ignore_for_scoring` AS `criterion_ignore_for_scoring`,`cri`.`criterion_use_range` AS `criterion_use_range`,`cri`.`long_description` AS `criterion_long_description`,group_concat('[',replace(lpad(format(`rt`.`points`,2),6,char(0xe28087 using utf8mb4)),'.00',concat(' ',repeat(char(0xe28087 using utf8mb4),2))),'] ',coalesce(`rt`.`description`,''),' >>> ',coalesce(`rt`.`long_description`,'(...no further detail...)') order by `rt`.`ordinal` ASC separator '\n') AS `criterion_ratings` from (((((`cll_rubrics` `r` join `cll_rubric_associations` `j` on(`r`.`id` = `j`.`rubric_id`)) join `assignment_dim` `a` on(`a`.`canvas_id` = `j`.`association_id` and `j`.`association_type` = 'Assignment')) join `course_dim` `c` on(`c`.`id` = `a`.`course_id`)) left join `cll_rubric_criteria` `cri` on(`cri`.`rubric_id` = `r`.`id`)) left join `cll_rubric_ratings` `rt` on(`rt`.`criterion_id` = `cri`.`id`)) group by `c`.`id`,`a`.`id`,`r`.`id`,`rt`.`criterion_id` order by `c`.`id`,`a`.`id`,`r`.`id`,`cri`.`ordinal`;

-- ----------------------------
-- View structure for vw_assignment_type
-- ----------------------------
DROP VIEW IF EXISTS `vw_assignment_type`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_assignment_type` AS select `a`.`id` AS `assignment_id`,`a`.`title` AS `title`,`a`.`workflow_state` AS `workflow_state`,if(`a`.`submission_types` <> 'external_tool',`a`.`submission_types`,`tool`.`name`) AS `assignment_type` from (`assignment_dim` `a` left join `external_tool_activation_dim` `tool` on(`a`.`external_tool_id` = `tool`.`id`));

-- ----------------------------
-- View structure for vw_assignment_weight
-- ----------------------------
DROP VIEW IF EXISTS `vw_assignment_weight`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_assignment_weight` AS select `a`.`id` AS `assignment_id`,`agroupf`.`assignment_group_id` AS `assignment_group_id`,`a`.`title` AS `title`,`a`.`workflow_state` AS `workflow_state`,`gsum`.`assignment_group_sum_possible` AS `assignment_group_sum_possible`,`a`.`points_possible` AS `assignment_points_possible`,`a`.`points_possible` / `gsum`.`assignment_group_sum_possible` * `agroupf`.`group_weight` AS `calculated_assignment_weight`,`agroupf`.`group_weight` AS `assignment_group_total_weight` from (((`canvas_data`.`assignment_dim` `a` join `canvas_data`.`assignment_group_fact` `agroupf` on(`a`.`assignment_group_id` = `agroupf`.`assignment_group_id`)) join `canvas_data`.`assignment_group_dim` `agroup` on(`agroup`.`id` = `agroupf`.`assignment_group_id`)) join (select `afact`.`assignment_group_id` AS `assignment_group_id`,sum(`afact`.`points_possible`) AS `assignment_group_sum_possible` from (`canvas_data`.`assignment_fact` `afact` join `canvas_data`.`assignment_dim` `a2` on(`afact`.`assignment_id` = `a2`.`id` and `a2`.`workflow_state` <> 'deleted')) group by `afact`.`assignment_group_id`) `gsum` on(`a`.`assignment_group_id` = `gsum`.`assignment_group_id`));

-- ----------------------------
-- View structure for vw_course_teacher_list
-- ----------------------------
DROP VIEW IF EXISTS `vw_course_teacher_list`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_course_teacher_list` AS select `c`.`id` AS `course_id`,group_concat(distinct `teacher`.`name` separator ', ') AS `teacher_list` from ((`course_dim` `c` left join `enrollment_dim` `te` on(`te`.`course_id` = `c`.`id` and (`te`.`type` = 'TeacherEnrollment' or `te`.`type` = 'TaEnrollment'))) left join `user_dim` `teacher` on(`teacher`.`id` = `te`.`user_id`)) group by `te`.`course_id` order by `teacher`.`created_at`;

-- ----------------------------
-- View structure for vw_degree_prevalence
-- ----------------------------
DROP VIEW IF EXISTS `vw_degree_prevalence`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_degree_prevalence` AS select `p`.`account_id` AS `account_id`,`p`.`account_name` AS `account_name`,`p`.`degree_name` AS `degree_name`,`u`.`id` AS `user_id`,`u`.`canvas_id` AS `user_canvas_id`,`u`.`name` AS `user_name`,`p`.`enrollment_count` AS `enrollment_count`,`p`.`core_enrollment_count` AS `core_enrollment_count`,`p`.`ia_enrollment_count` AS `ia_enrollment_count`,`p`.`other_enrollment_count` AS `other_enrollment_count`,`p`.`latest_enrollment_at` AS `latest_enrollment_at`,`p`.`enrollment_dates` AS `enrollment_dates` from (`canvas_data`.`user_dim` `u` left join (select `acc`.`id` AS `account_id`,`acc`.`name` AS `account_name`,`acc`.`name` AS `degree_name`,`u`.`id` AS `user_id`,count(`e`.`id`) AS `enrollment_count`,if(`acc`.`name` not in ('Sandbox','Dev','Student Resources','Industry Awareness','Training','Onboarding','CG Spectrum','WIL'),count(`e`.`id`),0) AS `core_enrollment_count`,if(`acc`.`name` = 'Industry Awareness',count(`e`.`id`),0) AS `ia_enrollment_count`,if(`acc`.`name` in ('Sandbox','Dev','Student Resources','Training','Onboarding','CG Spectrum','WIL'),count(`e`.`id`),0) AS `other_enrollment_count`,max(`e`.`created_at`) AS `latest_enrollment_at`,group_concat(distinct date_format(`e`.`created_at`,'%Y%m%d') order by `e`.`created_at` DESC separator '|') AS `enrollment_dates` from (((`canvas_data`.`account_dim` `acc` join `canvas_data`.`course_dim` `c` on(`acc`.`id` = `c`.`account_id`)) join `canvas_data`.`enrollment_dim` `e` on(`c`.`id` = `e`.`course_id`)) join `canvas_data`.`user_dim` `u` on(`e`.`user_id` = `u`.`id` and `e`.`type` = 'StudentEnrollment' and `e`.`workflow_state` = 'active')) group by `acc`.`id`,`acc`.`name`,`acc`.`name`,`e`.`user_id`,`u`.`canvas_id`,`u`.`name`) `p` on(`p`.`user_id` = `u`.`id`)) order by `u`.`name`,`p`.`core_enrollment_count` desc,`p`.`latest_enrollment_at` desc,`p`.`degree_name` desc;

-- ----------------------------
-- View structure for vw_enrollment_dates
-- ----------------------------
DROP VIEW IF EXISTS `vw_enrollment_dates`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_enrollment_dates` AS select `e`.`id` AS `enrollment_id`,`e`.`user_id` AS `user_id`,`e`.`course_id` AS `course_id`,`e`.`created_at` AS `enrollment_created_at`,coalesce(`c`.`start_at`,`t`.`date_start`) AS `course_start_at`,coalesce(`c`.`conclude_at`,`t`.`date_end`) AS `course_end_at`,`e`.`workflow_state` AS `enrollment_workflow_state`,`c`.`workflow_state` AS `course_workflow_state` from ((`enrollment_dim` `e` join `course_dim` `c` on(`e`.`course_id` = `c`.`id`)) left join `enrollment_term_dim` `t` on(`t`.`id` = `c`.`enrollment_term_id`));

-- ----------------------------
-- View structure for vw_major_degree
-- ----------------------------
DROP VIEW IF EXISTS `vw_major_degree`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_major_degree` AS select `p`.`user_id` AS `user_id`,`p`.`user_canvas_id` AS `user_canvas_id`,`p`.`user_name` AS `user_name`,if(`m`.`max_core_count` > 0,group_concat(distinct `d`.`degree_name` separator ','),NULL) AS `degree_name`,group_concat(`p`.`degree_name` order by `p`.`core_enrollment_count` DESC,`p`.`latest_enrollment_at` DESC,`p`.`degree_name` ASC separator '|') AS `all_degree_names`,group_concat(`p`.`enrollment_count` order by `p`.`core_enrollment_count` DESC,`p`.`latest_enrollment_at` DESC,`p`.`degree_name` ASC separator '|') AS `enrollment_split`,group_concat(date_format(`p`.`latest_enrollment_at`,'%Y%m%d') order by `p`.`core_enrollment_count` DESC,`p`.`latest_enrollment_at` DESC,`p`.`degree_name` ASC separator '|') AS `latest_enrollment_dates`,sum(`p`.`core_enrollment_count`) AS `total_core_enrollment_count`,max(`m`.`ia_enrollment_count`) AS `ia_enrollment_count`,max(`m`.`other_enrollment_count`) AS `other_enrollment_count`,max(`m`.`total_enrollment_count`) AS `total_enrollment_count`,group_concat(distinct `d`.`account_id` separator ',') AS `account_id` from ((`canvas_data`.`vw_degree_prevalence` `p` join (select `g`.`user_id` AS `user_id`,max(`g`.`core_enrollment_count`) AS `max_core_count`,sum(`g`.`ia_enrollment_count`) AS `ia_enrollment_count`,sum(`g`.`other_enrollment_count`) AS `other_enrollment_count`,sum(`g`.`enrollment_count`) AS `total_enrollment_count` from `canvas_data`.`vw_degree_prevalence` `g` group by `g`.`user_id`) `m` on(`m`.`user_id` = `p`.`user_id` and `m`.`max_core_count` = `p`.`core_enrollment_count`)) left join (select row_number() over ( partition by `l`.`user_id` order by `l`.`core_enrollment_count` desc,`l`.`latest_enrollment_at` desc,`l`.`degree_name`) AS `degree_rank`,`l`.`user_id` AS `user_id`,`l`.`degree_name` AS `degree_name`,`l`.`account_id` AS `account_id` from `canvas_data`.`vw_degree_prevalence` `l`) `d` on(`d`.`user_id` = `m`.`user_id` and `d`.`degree_rank` = 1)) group by `p`.`user_id`,`p`.`user_name` order by group_concat(distinct `d`.`degree_name` separator ','),`p`.`user_name`;

-- ----------------------------
-- View structure for vw_submission_counts
-- ----------------------------
DROP VIEW IF EXISTS `vw_submission_counts`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_submission_counts` AS select `es`.`enrollment_id` AS `enrollment_id`,`es`.`calculated_due_state` AS `calculated_due_state`,`es`.`simple_submitted_state` AS `simple_submitted_state`,`es`.`calculated_late_state` AS `calculated_late_state`,count(0) AS `submissions_count` from `canvas_data`.`vw_submission_state` `es` group by `es`.`enrollment_id`,`es`.`calculated_due_state`,`es`.`simple_submitted_state`,`es`.`calculated_late_state`;

-- ----------------------------
-- View structure for vw_submission_count_by_enrollment
-- ----------------------------
DROP VIEW IF EXISTS `vw_submission_count_by_enrollment`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_submission_count_by_enrollment` AS select `es`.`enrollment_id` AS `enrollment_id`,`es`.`calculated_due_state` AS `calculated_due_state`,`es`.`simple_submitted_state` AS `simple_submitted_state`,`es`.`calculated_late_state` AS `calculated_late_state`,count(0) AS `count` from `canvas_data`.`vw_submission_state` `es` group by `es`.`enrollment_id`,`es`.`calculated_due_state`,`es`.`simple_submitted_state`,`es`.`calculated_late_state`;

-- ----------------------------
-- View structure for vw_submission_count_by_student
-- ----------------------------
DROP VIEW IF EXISTS `vw_submission_count_by_student`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_submission_count_by_student` AS select `us`.`user_id` AS `user_id`,`us`.`calculated_due_state` AS `calculated_due_state`,`us`.`simple_submitted_state` AS `simple_submitted_state`,`us`.`calculated_late_state` AS `calculated_late_state`,date_format(`us`.`enrollment_created_at`,'%Y-%m') AS `enrollment_created_month`,count(0) AS `count` from `canvas_data`.`vw_submission_state` `us` group by `us`.`user_id`,`us`.`calculated_due_state`,`us`.`simple_submitted_state`,`us`.`calculated_late_state`,date_format(`us`.`enrollment_created_at`,'%Y-%m');

-- ----------------------------
-- View structure for vw_submission_state
-- ----------------------------
DROP VIEW IF EXISTS `vw_submission_state`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_submission_state` AS select convert_tz((select max(`exports`.`updated_at`) from `canvas_data`.`submission_dim` `exports`),'UTC','Australia/Melbourne') AS `export_cutoff_AEST`,`e`.`created_at` AS `enrollment_created_at`,`acc`.`name` AS `course_account`,`d`.`degree_name` AS `student_degree`,`u`.`name` AS `student_name`,`u`.`id` AS `user_id`,`e`.`id` AS `enrollment_id`,`e`.`course_id` AS `course_id`,`c`.`code` AS `course_code`,`c`.`name` AS `course_name`,`vt`.`sortable_name` AS `term_map`,`a`.`id` AS `assignment_id`,`a`.`title` AS `assignment_title`,if(`a`.`submission_types` <> 'external_tool',`a`.`submission_types`,`tool`.`name`) AS `assignment_type`,`a`.`workflow_state` AS `assignment_workflow_state`,`ad`.`original_due_at` AS `original_due_at`,`ad`.`override_due_at` AS `override_due_at`,`ad`.`calculated_due_at` AS `calculated_due_at`,`ad`.`calculated_due_state` AS `calculated_due_state`,case `l`.`workflow_state` when 'unsubmitted' then '1_unsubmitted' when 'submitted' then '2_submitted' when 'pending_review' then '3_pending_review' when 'graded' then '4_graded' else if(`l`.`workflow_state` is null,'0_null_submission',`l`.`workflow_state`) end AS `submission_workflow_state`,if(`l`.`submitted_at` is null,'1_unsubmitted','2_submitted') AS `simple_submitted_state`,if(`l`.`submitted_at` <= `ad`.`calculated_due_at`,'submitted_ontime',if(`l`.`submitted_at` > `ad`.`calculated_due_at`,'submitted_late',if(`l`.`submitted_at` is null and `l`.`workflow_state` = 'graded','graded_nosub',if(`l`.`submitted_at` is null and `ad`.`calculated_due_at` <= utc_timestamp(),'overdue','not_yet_due')))) AS `calculated_late_state`,if(`l`.`submitted_at` is null,NULL,round(timestampdiff(MINUTE,`ad`.`calculated_due_at`,`l`.`submitted_at`) / (24 * 60),4)) AS `calculated_late_days`,`l`.`updated_at` AS `submission_updated_at`,`l`.`submitted_at` AS `submitted_at`,`a`.`assignment_group_id` AS `assignment_group_id`,`aweight`.`assignment_group_total_weight` AS `assignment_group_total_weight`,`aweight`.`calculated_assignment_weight` AS `calculated_assignment_weight`,`sf`.`score` / `aweight`.`assignment_group_sum_possible` * `aweight`.`assignment_group_total_weight` / 100 AS `score_weighted_contribution`,`aweight`.`assignment_group_sum_possible` AS `assignment_group_sum_possible`,`a`.`points_possible` AS `assignment_points_possible`,`sf`.`score` AS `score_raw`,`sf`.`score` / `a`.`points_possible` AS `score_percent`,`l`.`grade` AS `grade_raw`,concat('https://collarts.instructure.com/courses/',`c`.`canvas_id`,'/assignments/',`a`.`canvas_id`) AS `assignment_url`,concat('https://collarts.instructure.com/courses/',`c`.`canvas_id`,'/gradebook/speed_grader?assignment_id=',`a`.`canvas_id`,'&student_id=',`u`.`canvas_id`) AS `speedgrader_url`,`teachers`.`teacher_list` AS `teacher_list` from (((((((((((((`canvas_data`.`enrollment_dim` `e` join `canvas_data`.`user_dim` `u` on(`e`.`user_id` = `u`.`id`)) join `canvas_data`.`course_dim` `c` on(`e`.`course_id` = `c`.`id`)) join `canvas_data`.`account_dim` `acc` on(`acc`.`id` = `c`.`account_id`)) join `canvas_data`.`vw_course_teacher_list` `teachers` on(`teachers`.`course_id` = `c`.`id`)) join `canvas_data`.`enrollment_fact` `ef` on(`e`.`id` = `ef`.`enrollment_id`)) join `canvas_data`.`assignment_dim` `a` on(`e`.`course_id` = `a`.`course_id`)) join `canvas_data`.`vw_assignment_due_date` `ad` on(`ad`.`user_id` = `u`.`id` and `ad`.`assignment_id` = `a`.`id`)) join `canvas_data`.`vw_assignment_weight` `aweight` on(`aweight`.`assignment_id` = `a`.`id`)) left join `canvas_data`.`vw_major_degree` `d` on(`d`.`user_id` = `u`.`id`)) left join `canvas_data`.`vw_term_name` `vt` on(`ef`.`enrollment_term_id` = `vt`.`id`)) left join `canvas_data`.`submission_dim` `l` on(`a`.`id` = `l`.`assignment_id` and `l`.`user_id` = `u`.`id` and (`l`.`workflow_state` is null or `l`.`workflow_state` <> 'deleted'))) left join `canvas_data`.`submission_fact` `sf` on(`sf`.`submission_id` = `l`.`id`)) left join `canvas_data`.`external_tool_activation_dim` `tool` on(`a`.`external_tool_id` = `tool`.`id`)) where `a`.`workflow_state` = 'published' and `e`.`type` = 'StudentEnrollment' and `e`.`workflow_state` = 'active' and `e`.`created_at` >= '2019-08-01';

-- ----------------------------
-- View structure for vw_submission_state_aest_exportable
-- ----------------------------
DROP VIEW IF EXISTS `vw_submission_state_aest_exportable`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_submission_state_aest_exportable` AS select `subs`.`export_cutoff_AEST` AS `export_cutoff_AEST`,convert_tz(`subs`.`enrollment_created_at`,'UTC','Australia/Melbourne') AS `enrollment_created_at_AEST`,`subs`.`course_account` AS `course_account`,`subs`.`student_degree` AS `student_degree`,`subs`.`student_name` AS `student_name`,`subs`.`user_id` AS `user_id`,`subs`.`course_code` AS `course_code`,`subs`.`course_name` AS `course_name`,`subs`.`term_map` AS `term_map`,`subs`.`assignment_title` AS `assignment_title`,`subs`.`assignment_type` AS `assignment_type`,`subs`.`assignment_workflow_state` AS `assignment_workflow_state`,convert_tz(`subs`.`original_due_at`,'UTC','Australia/Melbourne') AS `original_due_at_AEST`,convert_tz(`subs`.`override_due_at`,'UTC','Australia/Melbourne') AS `override_due_at_AEST`,convert_tz(`subs`.`calculated_due_at`,'UTC','Australia/Melbourne') AS `calculated_due_at_AEST`,`subs`.`calculated_due_state` AS `calculated_due_state`,`subs`.`submission_workflow_state` AS `submission_workflow_state`,`subs`.`simple_submitted_state` AS `simple_submitted_state`,`subs`.`calculated_late_state` AS `calculated_late_state`,`subs`.`calculated_late_days` AS `calculated_late_days`,convert_tz(`subs`.`submission_updated_at`,'UTC','Australia/Melbourne') AS `submission_updated_at_AEST`,convert_tz(`subs`.`submitted_at`,'UTC','Australia/Melbourne') AS `submitted_at_AEST`,`subs`.`assignment_points_possible` AS `assignment_points_possible`,`subs`.`assignment_group_sum_possible` AS `assignment_group_sum_possible`,`subs`.`calculated_assignment_weight` AS `calculated_assignment_weight`,`subs`.`assignment_group_total_weight` AS `assignment_group_total_weight`,`subs`.`assignment_url` AS `assignment_url`,`subs`.`speedgrader_url` AS `speedgrader_url` from `canvas_data`.`vw_submission_state` `subs` order by `subs`.`student_degree`,`subs`.`student_name`,`subs`.`enrollment_created_at` desc,`subs`.`course_account`,`subs`.`course_code`,`subs`.`calculated_due_at`;

-- ----------------------------
-- View structure for vw_term_name
-- ----------------------------
DROP VIEW IF EXISTS `vw_term_name`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_term_name` AS select `t`.`id` AS `id`,`t`.`canvas_id` AS `canvas_id`,`t`.`root_account_id` AS `root_account_id`,`t`.`name` AS `name`,if(`t`.`name` like 'T%',concat(substr(`t`.`name`,-4),' ',substr(`t`.`name`,1,2)),`t`.`name`) AS `sortable_name`,`t`.`date_start` AS `date_start`,`t`.`date_end` AS `date_end`,`t`.`sis_source_id` AS `sis_source_id` from `enrollment_term_dim` `t`;

-- ----------------------------
-- Function structure for fn_assignment_url
-- ----------------------------
DROP FUNCTION IF EXISTS `fn_assignment_url`;
delimiter ;;
CREATE FUNCTION `fn_assignment_url`(course_canvas_id BIGINT UNSIGNED, assignment_canvas_id BIGINT UNSIGNED)
 RETURNS varchar(256) CHARSET utf8mb4
  NO SQL 
  DETERMINISTIC
  SQL SECURITY INVOKER
BEGIN
	RETURN CONCAT('https://collarts.instructure.com/courses/',course_canvas_id,'/assignments/',assignment_canvas_id);
END
;;
delimiter ;

-- ----------------------------
-- Function structure for fn_gradebook_url
-- ----------------------------
DROP FUNCTION IF EXISTS `fn_gradebook_url`;
delimiter ;;
CREATE FUNCTION `fn_gradebook_url`(course_canvas_id BIGINT UNSIGNED)
 RETURNS varchar(256) CHARSET utf8mb4
  NO SQL 
  DETERMINISTIC
  SQL SECURITY INVOKER
BEGIN
	RETURN CONCAT('https://collarts.instructure.com/courses/',course_canvas_id,'/gradebook');
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
