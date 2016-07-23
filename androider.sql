/*
Navicat PGSQL Data Transfer

Source Server         : localhost
Source Server Version : 90600
Source Host           : localhost:5432
Source Database       : androider
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90600
File Encoding         : 65001

Date: 2016-07-23 18:17:49
*/


-- ----------------------------
-- Sequence structure for bbs_article_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bbs_article_id_seq";
CREATE SEQUENCE "public"."bbs_article_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 2
 CACHE 1;
SELECT setval('"public"."bbs_article_id_seq"', 2, true);

-- ----------------------------
-- Sequence structure for bbs_comment_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bbs_comment_id_seq";
CREATE SEQUENCE "public"."bbs_comment_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for bbs_node_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bbs_node_id_seq";
CREATE SEQUENCE "public"."bbs_node_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for bbs_tag_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bbs_tag_id_seq";
CREATE SEQUENCE "public"."bbs_tag_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for bbs_topic_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bbs_topic_id_seq";
CREATE SEQUENCE "public"."bbs_topic_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for bbs_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bbs_user_id_seq";
CREATE SEQUENCE "public"."bbs_user_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for event_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."event_id_seq";
CREATE SEQUENCE "public"."event_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 2
 CACHE 1;
SELECT setval('"public"."event_id_seq"', 2, true);

-- ----------------------------
-- Sequence structure for r_user_article_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."r_user_article_id_seq";
CREATE SEQUENCE "public"."r_user_article_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for r_user_comment_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."r_user_comment_id_seq";
CREATE SEQUENCE "public"."r_user_comment_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for r_user_node_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."r_user_node_id_seq";
CREATE SEQUENCE "public"."r_user_node_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for r_user_tag_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."r_user_tag_id_seq";
CREATE SEQUENCE "public"."r_user_tag_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for r_user_topic_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."r_user_topic_id_seq";
CREATE SEQUENCE "public"."r_user_topic_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Table structure for bbs_article
-- ----------------------------
DROP TABLE IF EXISTS "public"."bbs_article";
CREATE TABLE "public"."bbs_article" (
"id" int4 DEFAULT nextval('bbs_article_id_seq'::regclass) NOT NULL,
"title" varchar COLLATE "default",
"content" varchar COLLATE "default",
"content_format" int4,
"title_format" int4 DEFAULT 1 NOT NULL,
"creator_id" int4,
"c_time" timetz(6),
"u_time" timetz(6),
"last_update_user_id" int4,
"node_id" int4,
"collection_id" int4,
"chapter" int4,
"dic_status" int4 DEFAULT 1 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."bbs_article"."collection_id" IS 'article can  have a collecetion,the collection belong the user of tha article';
COMMENT ON COLUMN "public"."bbs_article"."chapter" IS 'articel can have a chapter,in a collection the articel will sort by the chapter';

-- ----------------------------
-- Records of bbs_article
-- ----------------------------
INSERT INTO "public"."bbs_article" VALUES ('1', 'jia', 'kaiyang', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO "public"."bbs_article" VALUES ('2', 'john', 'in my life', null, '1', null, null, null, null, null, null, null, '1');

-- ----------------------------
-- Table structure for bbs_comment
-- ----------------------------
DROP TABLE IF EXISTS "public"."bbs_comment";
CREATE TABLE "public"."bbs_comment" (
"id" int4 DEFAULT nextval('bbs_comment_id_seq'::regclass) NOT NULL,
"content" varchar COLLATE "default",
"content_format" int4 DEFAULT 1 NOT NULL,
"creator_id" int4,
"c_time" timetz(6),
"u_time" timetz(6),
"parent_id" int4,
"topic_id" int4,
"dic_status" int4,
"article_id" int4
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."bbs_comment"."topic_id" IS 'the topic of the commit, maybe a aticle';
COMMENT ON COLUMN "public"."bbs_comment"."dic_status" IS 'the status of the comment, comply with CDD';
COMMENT ON COLUMN "public"."bbs_comment"."article_id" IS '文章的id，和topic_id中只能有一个';

-- ----------------------------
-- Records of bbs_comment
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_node
-- ----------------------------
DROP TABLE IF EXISTS "public"."bbs_node";
CREATE TABLE "public"."bbs_node" (
"id" int4 DEFAULT nextval('bbs_node_id_seq'::regclass) NOT NULL,
"parent_id" int4,
"name" varchar COLLATE "default",
"desc" varchar COLLATE "default",
"avatar" varchar COLLATE "default",
"c_time" timetz(6),
"u_time" timetz(6)
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."bbs_node"."name" IS 'the name of node';
COMMENT ON COLUMN "public"."bbs_node"."desc" IS 'description of the node';
COMMENT ON COLUMN "public"."bbs_node"."avatar" IS 'the url of the node avatar';

-- ----------------------------
-- Records of bbs_node
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_tag
-- ----------------------------
DROP TABLE IF EXISTS "public"."bbs_tag";
CREATE TABLE "public"."bbs_tag" (
"id" int4 DEFAULT nextval('bbs_tag_id_seq'::regclass) NOT NULL,
"name" varchar COLLATE "default",
"creator_id" int4
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."bbs_tag"."name" IS 'tag'' name, must be uniquo';

-- ----------------------------
-- Records of bbs_tag
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_topic
-- ----------------------------
DROP TABLE IF EXISTS "public"."bbs_topic";
CREATE TABLE "public"."bbs_topic" (
"title" varchar COLLATE "default",
"content" varchar COLLATE "default",
"content_format" int4,
"title_format" int4 DEFAULT 1 NOT NULL,
"creator_id" int4,
"c_time" timetz(6),
"u_time" timetz(6),
"last_update_user_id" int4,
"node_id" int4,
"id" int4 DEFAULT nextval('bbs_topic_id_seq'::regclass) NOT NULL,
"dic_status" int4 DEFAULT 1 NOT NULL
)
WITH (OIDS=FALSE)

;
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
-- Records of bbs_topic
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."bbs_user";
CREATE TABLE "public"."bbs_user" (
"id" int4 DEFAULT nextval('bbs_user_id_seq'::regclass) NOT NULL,
"username" varchar(15) COLLATE "default" NOT NULL,
"password" varchar(16) COLLATE "default",
"name" varchar(20) COLLATE "default",
"sex" int4,
"avatar" varchar COLLATE "default",
"role_id" int4 DEFAULT 1 NOT NULL,
"dic_status" int4 DEFAULT 2 NOT NULL,
"email" varchar COLLATE "default" NOT NULL,
"github_username" varchar COLLATE "default",
"github_email" varchar COLLATE "default",
"last_login_ip" varchar COLLATE "default",
"last_login_time" timetz(6),
"c_time" timetz(6),
"u_time" timetz(6),
"phone" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;
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
-- Records of bbs_user
-- ----------------------------

-- ----------------------------
-- Table structure for r_user_article
-- ----------------------------
DROP TABLE IF EXISTS "public"."r_user_article";
CREATE TABLE "public"."r_user_article" (
"id" int4 DEFAULT nextval('r_user_article_id_seq'::regclass) NOT NULL,
"user_id" int4,
"article_id" int4
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."r_user_article" IS 'user and articel associate table';

-- ----------------------------
-- Records of r_user_article
-- ----------------------------

-- ----------------------------
-- Table structure for r_user_comment
-- ----------------------------
DROP TABLE IF EXISTS "public"."r_user_comment";
CREATE TABLE "public"."r_user_comment" (
"id" int4 DEFAULT nextval('r_user_comment_id_seq'::regclass) NOT NULL,
"user_id" int4,
"comment_id" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of r_user_comment
-- ----------------------------

-- ----------------------------
-- Table structure for r_user_node
-- ----------------------------
DROP TABLE IF EXISTS "public"."r_user_node";
CREATE TABLE "public"."r_user_node" (
"id" int4 DEFAULT nextval('r_user_node_id_seq'::regclass) NOT NULL,
"user_id" int4,
"node_id" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of r_user_node
-- ----------------------------

-- ----------------------------
-- Table structure for r_user_tag
-- ----------------------------
DROP TABLE IF EXISTS "public"."r_user_tag";
CREATE TABLE "public"."r_user_tag" (
"id" int4 DEFAULT nextval('r_user_tag_id_seq'::regclass) NOT NULL,
"user_id" int4,
"tag_id" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of r_user_tag
-- ----------------------------

-- ----------------------------
-- Table structure for r_user_topic
-- ----------------------------
DROP TABLE IF EXISTS "public"."r_user_topic";
CREATE TABLE "public"."r_user_topic" (
"id" int4 DEFAULT nextval('r_user_topic_id_seq'::regclass) NOT NULL,
"user_id" int4,
"topic_id" int4
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."r_user_topic" IS 'user and topic associate table';

-- ----------------------------
-- Records of r_user_topic
-- ----------------------------

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------
ALTER SEQUENCE "public"."bbs_article_id_seq" OWNED BY "bbs_article"."id";
ALTER SEQUENCE "public"."bbs_comment_id_seq" OWNED BY "bbs_comment"."id";
ALTER SEQUENCE "public"."bbs_node_id_seq" OWNED BY "bbs_node"."id";
ALTER SEQUENCE "public"."bbs_tag_id_seq" OWNED BY "bbs_tag"."id";
ALTER SEQUENCE "public"."bbs_topic_id_seq" OWNED BY "bbs_topic"."id";
ALTER SEQUENCE "public"."bbs_user_id_seq" OWNED BY "bbs_user"."id";
ALTER SEQUENCE "public"."r_user_article_id_seq" OWNED BY "r_user_article"."id";
ALTER SEQUENCE "public"."r_user_comment_id_seq" OWNED BY "r_user_comment"."id";
ALTER SEQUENCE "public"."r_user_node_id_seq" OWNED BY "r_user_node"."id";
ALTER SEQUENCE "public"."r_user_tag_id_seq" OWNED BY "r_user_tag"."id";
ALTER SEQUENCE "public"."r_user_topic_id_seq" OWNED BY "r_user_topic"."id";

-- ----------------------------
-- Primary Key structure for table bbs_article
-- ----------------------------
ALTER TABLE "public"."bbs_article" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table bbs_comment
-- ----------------------------
ALTER TABLE "public"."bbs_comment" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table bbs_node
-- ----------------------------
ALTER TABLE "public"."bbs_node" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table bbs_tag
-- ----------------------------
ALTER TABLE "public"."bbs_tag" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table bbs_topic
-- ----------------------------
ALTER TABLE "public"."bbs_topic" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table bbs_user
-- ----------------------------
ALTER TABLE "public"."bbs_user" ADD PRIMARY KEY ("id", "username", "email");

-- ----------------------------
-- Primary Key structure for table r_user_article
-- ----------------------------
ALTER TABLE "public"."r_user_article" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table r_user_comment
-- ----------------------------
ALTER TABLE "public"."r_user_comment" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table r_user_node
-- ----------------------------
ALTER TABLE "public"."r_user_node" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table r_user_tag
-- ----------------------------
ALTER TABLE "public"."r_user_tag" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table r_user_topic
-- ----------------------------
ALTER TABLE "public"."r_user_topic" ADD PRIMARY KEY ("id");
