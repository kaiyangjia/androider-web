/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : PostgreSQL
 Source Server Version : 90502
 Source Host           : localhost
 Source Database       : androider
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 90502
 File Encoding         : utf-8

 Date: 07/22/2016 08:36:23 AM
*/

-- ----------------------------
--  Table structure for bbs_article
-- ----------------------------
DROP TABLE IF EXISTS "public"."bbs_article";
CREATE TABLE "public"."bbs_article" (
	"id" int4 NOT NULL,
	"title" varchar COLLATE "default",
	"content" varchar COLLATE "default",
	"content_format" int4,
	"title_format" int4 NOT NULL DEFAULT 1,
	"creator_id" int4,
	"c_time" time(6) WITH TIME ZONE,
	"u_time" time(6) WITH TIME ZONE,
	"last_update_user_id" int4,
	"node_id" int4,
	"collection_id" int4,
	"chapter" int4,
	"dic_status" int4 NOT NULL DEFAULT 1
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."bbs_article" OWNER TO "postgres";

COMMENT ON COLUMN "public"."bbs_article"."collection_id" IS 'article can  have a collecetion,the collection belong the user of tha article';
COMMENT ON COLUMN "public"."bbs_article"."chapter" IS 'articel can have a chapter,in a collection the articel will sort by the chapter';

-- ----------------------------
--  Table structure for bbs_comment
-- ----------------------------
DROP TABLE IF EXISTS "public"."bbs_comment";
CREATE TABLE "public"."bbs_comment" (
	"id" int4 NOT NULL,
	"content" varchar COLLATE "default",
	"content_format" int4 NOT NULL DEFAULT 1,
	"creator_id" int4,
	"c_time" time(6) WITH TIME ZONE,
	"u_time" time(6) WITH TIME ZONE,
	"parent_id" int4,
	"topic_id" int4,
	"dic_status" int4,
	"article_id" int4
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."bbs_comment" OWNER TO "postgres";

COMMENT ON COLUMN "public"."bbs_comment"."topic_id" IS 'the topic of the commit, maybe a aticle';
COMMENT ON COLUMN "public"."bbs_comment"."dic_status" IS 'the status of the comment, comply with CDD';
COMMENT ON COLUMN "public"."bbs_comment"."article_id" IS '文章的id，和topic_id中只能有一个';

-- ----------------------------
--  Table structure for bbs_node
-- ----------------------------
DROP TABLE IF EXISTS "public"."bbs_node";
CREATE TABLE "public"."bbs_node" (
	"id" int4 NOT NULL,
	"parent_id" int4,
	"name" varchar COLLATE "default",
	"desc" varchar COLLATE "default",
	"avatar" varchar COLLATE "default",
	"c_time" time(6) WITH TIME ZONE,
	"u_time" time(6) WITH TIME ZONE
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."bbs_node" OWNER TO "postgres";

COMMENT ON COLUMN "public"."bbs_node"."name" IS 'the name of node';
COMMENT ON COLUMN "public"."bbs_node"."desc" IS 'description of the node';
COMMENT ON COLUMN "public"."bbs_node"."avatar" IS 'the url of the node avatar';

-- ----------------------------
--  Table structure for bbs_tag
-- ----------------------------
DROP TABLE IF EXISTS "public"."bbs_tag";
CREATE TABLE "public"."bbs_tag" (
	"id" int4 NOT NULL,
	"name" varchar COLLATE "default",
	"creator_id" int4
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."bbs_tag" OWNER TO "postgres";

COMMENT ON COLUMN "public"."bbs_tag"."name" IS 'tag'' name, must be uniquo';

-- ----------------------------
--  Table structure for bbs_topic
-- ----------------------------
DROP TABLE IF EXISTS "public"."bbs_topic";
CREATE TABLE "public"."bbs_topic" (
	"title" varchar COLLATE "default",
	"content" varchar COLLATE "default",
	"content_format" int4,
	"title_format" int4 NOT NULL DEFAULT 1,
	"creator_id" int4,
	"c_time" time(6) WITH TIME ZONE,
	"u_time" time(6) WITH TIME ZONE,
	"last_update_user_id" int4,
	"node_id" int4,
	"id" int4 NOT NULL,
	"dic_status" int4 NOT NULL DEFAULT 1
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."bbs_topic" OWNER TO "postgres";

COMMENT ON COLUMN "public"."bbs_topic"."title" IS 'article title';
COMMENT ON COLUMN "public"."bbs_topic"."content" IS 'article cntent';
COMMENT ON COLUMN "public"."bbs_topic"."content_format" IS 'the format of the content,comply with CDD';
COMMENT ON COLUMN "public"."bbs_topic"."title_format" IS 'the format of title, comply with CDD';
COMMENT ON COLUMN "public"."bbs_topic"."creator_id" IS 'the creator of the article';
COMMENT ON COLUMN "public"."bbs_topic"."c_time" IS 'create time';
COMMENT ON COLUMN "public"."bbs_topic"."u_time" IS 'last update time';
COMMENT ON COLUMN "public"."bbs_topic"."node_id" IS 'the article must have a node';
COMMENT ON COLUMN "public"."bbs_topic"."dic_status" IS 'the status of the topic, comply with CDD';

-- ----------------------------
--  Table structure for bbs_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."bbs_user";
CREATE TABLE "public"."bbs_user" (
	"id" int4 NOT NULL,
	"username" varchar(15) NOT NULL COLLATE "default",
	"password" varchar(16) COLLATE "default",
	"name" varchar(20) COLLATE "default",
	"sex" int4,
	"avatar" varchar COLLATE "default",
	"role_id" int4 NOT NULL DEFAULT 1,
	"dic_status" int4 NOT NULL DEFAULT 2,
	"email" varchar NOT NULL COLLATE "default",
	"github_username" varchar COLLATE "default",
	"github_email" varchar COLLATE "default",
	"last_login_ip" varchar COLLATE "default",
	"last_login_time" time(6) WITH TIME ZONE,
	"c_time" time(6) WITH TIME ZONE,
	"u_time" time(6) WITH TIME ZONE,
	"phone" varchar COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."bbs_user" OWNER TO "postgres";

COMMENT ON COLUMN "public"."bbs_user"."username" IS 'username must be unique';
COMMENT ON COLUMN "public"."bbs_user"."password" IS 'password';
COMMENT ON COLUMN "public"."bbs_user"."name" IS 'user''s name';
COMMENT ON COLUMN "public"."bbs_user"."sex" IS '1 for male, 2 for female, 3 for other';
COMMENT ON COLUMN "public"."bbs_user"."avatar" IS 'the url of a image for the user''s avatar';
COMMENT ON COLUMN "public"."bbs_user"."role_id" IS 'user role id, comply with the CDD';
COMMENT ON COLUMN "public"."bbs_user"."dic_status" IS 'the user status, comply with CDD';
COMMENT ON COLUMN "public"."bbs_user"."email" IS 'email of user';
COMMENT ON COLUMN "public"."bbs_user"."github_username" IS 'github username for user';
COMMENT ON COLUMN "public"."bbs_user"."github_email" IS 'github email for user';
COMMENT ON COLUMN "public"."bbs_user"."last_login_ip" IS 'the user last login ip address';
COMMENT ON COLUMN "public"."bbs_user"."c_time" IS 'data create time';
COMMENT ON COLUMN "public"."bbs_user"."u_time" IS 'data update time';
COMMENT ON COLUMN "public"."bbs_user"."phone" IS 'phone number of user';

-- ----------------------------
--  Table structure for r_user_article
-- ----------------------------
DROP TABLE IF EXISTS "public"."r_user_article";
CREATE TABLE "public"."r_user_article" (
	"id" int4 NOT NULL,
	"user_id" int4,
	"article_id" int4
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."r_user_article" OWNER TO "postgres";

COMMENT ON TABLE "public"."r_user_article" IS 'user and articel associate table';

-- ----------------------------
--  Table structure for r_user_comment
-- ----------------------------
DROP TABLE IF EXISTS "public"."r_user_comment";
CREATE TABLE "public"."r_user_comment" (
	"id" int4 NOT NULL,
	"user_id" int4,
	"comment_id" int4
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."r_user_comment" OWNER TO "postgres";

-- ----------------------------
--  Table structure for r_user_node
-- ----------------------------
DROP TABLE IF EXISTS "public"."r_user_node";
CREATE TABLE "public"."r_user_node" (
	"id" int4 NOT NULL,
	"user_id" int4,
	"node_id" int4
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."r_user_node" OWNER TO "postgres";

-- ----------------------------
--  Table structure for r_user_tag
-- ----------------------------
DROP TABLE IF EXISTS "public"."r_user_tag";
CREATE TABLE "public"."r_user_tag" (
	"id" int4 NOT NULL,
	"user_id" int4,
	"tag_id" int4
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."r_user_tag" OWNER TO "postgres";

-- ----------------------------
--  Table structure for r_user_topic
-- ----------------------------
DROP TABLE IF EXISTS "public"."r_user_topic";
CREATE TABLE "public"."r_user_topic" (
	"id" int4 NOT NULL,
	"user_id" int4,
	"topic_id" int4
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."r_user_topic" OWNER TO "postgres";

COMMENT ON TABLE "public"."r_user_topic" IS 'user and topic associate table';

-- ----------------------------
--  Primary key structure for table bbs_article
-- ----------------------------
ALTER TABLE "public"."bbs_article" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table bbs_comment
-- ----------------------------
ALTER TABLE "public"."bbs_comment" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table bbs_node
-- ----------------------------
ALTER TABLE "public"."bbs_node" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table bbs_tag
-- ----------------------------
ALTER TABLE "public"."bbs_tag" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table bbs_topic
-- ----------------------------
ALTER TABLE "public"."bbs_topic" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table bbs_user
-- ----------------------------
ALTER TABLE "public"."bbs_user" ADD PRIMARY KEY ("id", "username", "email") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table r_user_article
-- ----------------------------
ALTER TABLE "public"."r_user_article" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table r_user_comment
-- ----------------------------
ALTER TABLE "public"."r_user_comment" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table r_user_node
-- ----------------------------
ALTER TABLE "public"."r_user_node" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table r_user_tag
-- ----------------------------
ALTER TABLE "public"."r_user_tag" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table r_user_topic
-- ----------------------------
ALTER TABLE "public"."r_user_topic" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

