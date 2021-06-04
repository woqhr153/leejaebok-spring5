--------------------------------------------------------
--  파일이 생성됨 - 금요일-6월-04-2021   
--------------------------------------------------------
DROP SEQUENCE "XE"."DEMO_CUST_SEQ";
DROP SEQUENCE "XE"."DEMO_ORDER_ITEMS_SEQ";
DROP SEQUENCE "XE"."DEMO_ORD_SEQ";
DROP SEQUENCE "XE"."DEMO_PROD_SEQ";
DROP SEQUENCE "XE"."DEMO_USERS_SEQ";
DROP TABLE "XE"."TBL_ATTACH" cascade constraints;
DROP TABLE "XE"."TBL_BOARD" cascade constraints;
DROP TABLE "XE"."TBL_BOARD_TYPE" cascade constraints;
DROP TABLE "XE"."TBL_MEMBER" cascade constraints;
DROP TABLE "XE"."TBL_REPLY" cascade constraints;
DROP FUNCTION "XE"."CUSTOM_AUTH";
DROP FUNCTION "XE"."CUSTOM_HASH";
--------------------------------------------------------
--  DDL for Sequence DEMO_CUST_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "XE"."DEMO_CUST_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence DEMO_ORDER_ITEMS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "XE"."DEMO_ORDER_ITEMS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence DEMO_ORD_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "XE"."DEMO_ORD_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 11 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence DEMO_PROD_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "XE"."DEMO_PROD_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence DEMO_USERS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "XE"."DEMO_USERS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table TBL_ATTACH
--------------------------------------------------------

  CREATE TABLE "XE"."TBL_ATTACH" 
   (	"SAVE_FILE_NAME" VARCHAR2(255 BYTE), 
	"REAL_FILE_NAME" VARCHAR2(255 BYTE), 
	"REG_DATE" DATE, 
	"BNO" NUMBER(11,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "XE"."TBL_ATTACH"."SAVE_FILE_NAME" IS '물리적으로저장되는파일명(해시데이터)';
   COMMENT ON COLUMN "XE"."TBL_ATTACH"."REAL_FILE_NAME" IS '한글파일명으로UI에서보이게';
   COMMENT ON COLUMN "XE"."TBL_ATTACH"."REG_DATE" IS '등록일자';
   COMMENT ON COLUMN "XE"."TBL_ATTACH"."BNO" IS '부모테이블의고유키';
   COMMENT ON TABLE "XE"."TBL_ATTACH"  IS '첨부파일관리테이블';
--------------------------------------------------------
--  DDL for Table TBL_BOARD
--------------------------------------------------------

  CREATE TABLE "XE"."TBL_BOARD" 
   (	"BNO" NUMBER(11,0), 
	"TITLE" VARCHAR2(255 BYTE), 
	"CONTENT" CLOB, 
	"WRITER" VARCHAR2(50 BYTE), 
	"VIEW_COUNT" NUMBER(11,0), 
	"REPLY_COUNT" NUMBER(11,0), 
	"REG_DATE" TIMESTAMP (6), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"BOARD_TYPE" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("CONTENT") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

   COMMENT ON COLUMN "XE"."TBL_BOARD"."BNO" IS '게시판고유번호(자동증가처리)';
   COMMENT ON COLUMN "XE"."TBL_BOARD"."TITLE" IS '게시물제목';
   COMMENT ON COLUMN "XE"."TBL_BOARD"."CONTENT" IS '글내용';
   COMMENT ON COLUMN "XE"."TBL_BOARD"."WRITER" IS '글작성자ID';
   COMMENT ON COLUMN "XE"."TBL_BOARD"."VIEW_COUNT" IS '글조회수카운터';
   COMMENT ON COLUMN "XE"."TBL_BOARD"."REPLY_COUNT" IS '댓글카운트';
   COMMENT ON COLUMN "XE"."TBL_BOARD"."REG_DATE" IS '등록일시';
   COMMENT ON COLUMN "XE"."TBL_BOARD"."UPDATE_DATE" IS '수정일시';
   COMMENT ON TABLE "XE"."TBL_BOARD"  IS '게시물관리테이블';
--------------------------------------------------------
--  DDL for Table TBL_BOARD_TYPE
--------------------------------------------------------

  CREATE TABLE "XE"."TBL_BOARD_TYPE" 
   (	"BOARD_TYPE" VARCHAR2(20 BYTE), 
	"BOARD_NAME" VARCHAR2(50 BYTE), 
	"BOARD_SUN" NUMBER(11,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "XE"."TBL_BOARD_TYPE"."BOARD_TYPE" IS '게시판타입(NOTICE,GALLERY등)';
   COMMENT ON COLUMN "XE"."TBL_BOARD_TYPE"."BOARD_NAME" IS '한글게시판이름';
   COMMENT ON COLUMN "XE"."TBL_BOARD_TYPE"."BOARD_SUN" IS '게시판출력순서';
   COMMENT ON TABLE "XE"."TBL_BOARD_TYPE"  IS '게시판생성관리(NOTICE,GALLERY등등)';
--------------------------------------------------------
--  DDL for Table TBL_MEMBER
--------------------------------------------------------

  CREATE TABLE "XE"."TBL_MEMBER" 
   (	"USER_ID" VARCHAR2(50 BYTE), 
	"USER_PW" VARCHAR2(255 BYTE), 
	"USER_NAME" VARCHAR2(255 BYTE), 
	"EMAIL" VARCHAR2(255 BYTE), 
	"POINT" NUMBER(11,0), 
	"ENABLED" NUMBER(1,0), 
	"LEVELS" VARCHAR2(50 BYTE), 
	"REG_DATE" TIMESTAMP (6), 
	"UPDATE_DATE" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "XE"."TBL_MEMBER"."USER_ID" IS '회원고유ID';
   COMMENT ON COLUMN "XE"."TBL_MEMBER"."USER_PW" IS '회원로그인암호(스프링시큐리티)';
   COMMENT ON COLUMN "XE"."TBL_MEMBER"."USER_NAME" IS '회원이름';
   COMMENT ON COLUMN "XE"."TBL_MEMBER"."EMAIL" IS '회원이메일';
   COMMENT ON COLUMN "XE"."TBL_MEMBER"."POINT" IS '회원포인트';
   COMMENT ON COLUMN "XE"."TBL_MEMBER"."ENABLED" IS '로그인승인여부';
   COMMENT ON COLUMN "XE"."TBL_MEMBER"."LEVELS" IS '회원권한(ROLE_ADMIN,ROLE_USER)';
   COMMENT ON COLUMN "XE"."TBL_MEMBER"."REG_DATE" IS '등록일시';
   COMMENT ON COLUMN "XE"."TBL_MEMBER"."UPDATE_DATE" IS '수정일시';
   COMMENT ON TABLE "XE"."TBL_MEMBER"  IS '회원관리테이블';
--------------------------------------------------------
--  DDL for Table TBL_REPLY
--------------------------------------------------------

  CREATE TABLE "XE"."TBL_REPLY" 
   (	"RNO" NUMBER(11,0), 
	"REPLY_TEXT" VARCHAR2(255 BYTE), 
	"REPLYER" VARCHAR2(50 BYTE), 
	"REG_DATE" DATE, 
	"UPDATE_DATE" DATE, 
	"BNO" NUMBER(11,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "XE"."TBL_REPLY"."RNO" IS '댓글고유번호(자동증가AI)';
   COMMENT ON COLUMN "XE"."TBL_REPLY"."REPLY_TEXT" IS '댓글내용';
   COMMENT ON COLUMN "XE"."TBL_REPLY"."REPLYER" IS '댓글작성자ID';
   COMMENT ON COLUMN "XE"."TBL_REPLY"."REG_DATE" IS '등록일';
   COMMENT ON COLUMN "XE"."TBL_REPLY"."UPDATE_DATE" IS '수정일';
   COMMENT ON COLUMN "XE"."TBL_REPLY"."BNO" IS '게시물관리고유값외래키';
   COMMENT ON TABLE "XE"."TBL_REPLY"  IS '댓글관리테이블';
REM INSERTING into XE.TBL_ATTACH
SET DEFINE OFF;
REM INSERTING into XE.TBL_BOARD
SET DEFINE OFF;
REM INSERTING into XE.TBL_BOARD_TYPE
SET DEFINE OFF;
Insert into XE.TBL_BOARD_TYPE (BOARD_TYPE,BOARD_NAME,BOARD_SUN) values ('notice','공지사항',1);
REM INSERTING into XE.TBL_MEMBER
SET DEFINE OFF;
REM INSERTING into XE.TBL_REPLY
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index TBL_ATTACH_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "XE"."TBL_ATTACH_PK" ON "XE"."TBL_ATTACH" ("SAVE_FILE_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TBL_BOARD_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "XE"."TBL_BOARD_PK" ON "XE"."TBL_BOARD" ("BNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TBL_BOARD_TYPE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "XE"."TBL_BOARD_TYPE_PK" ON "XE"."TBL_BOARD_TYPE" ("BOARD_TYPE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TBL_MEMBER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "XE"."TBL_MEMBER_PK" ON "XE"."TBL_MEMBER" ("USER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TBL_REPLY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "XE"."TBL_REPLY_PK" ON "XE"."TBL_REPLY" ("RNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Function CUSTOM_AUTH
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "XE"."CUSTOM_AUTH" (p_username in VARCHAR2, p_password in VARCHAR2)
return BOOLEAN
is
  l_password varchar2(4000);
  l_stored_password varchar2(4000);
  l_expires_on date;
  l_count number;
begin
-- First, check to see if the user is in the user table
select count(*) into l_count from demo_users where user_name = p_username;
if l_count > 0 then
  -- First, we fetch the stored hashed password & expire date
  select password, expires_on into l_stored_password, l_expires_on
   from demo_users where user_name = p_username;

  -- Next, we check to see if the user's account is expired
  -- If it is, return FALSE
  if l_expires_on > sysdate or l_expires_on is null then

    -- If the account is not expired, we have to apply the custom hash
    -- function to the password
    l_password := custom_hash(p_username, p_password);

    -- Finally, we compare them to see if they are the same and return
    -- either TRUE or FALSE
    if l_password = l_stored_password then
      return true;
    else
      return false;
    end if;
  else
    return false;
  end if;
else
  -- The username provided is not in the DEMO_USERS table
  return false;
end if;
end;

/
--------------------------------------------------------
--  DDL for Function CUSTOM_HASH
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "XE"."CUSTOM_HASH" (p_username in varchar2, p_password in varchar2)
return varchar2
is
  l_password varchar2(4000);
  l_salt varchar2(4000) := '6EXGC5OFF4N2J46A2GXN30DUU6OIX9';
begin

-- This function should be wrapped, as the hash algorhythm is exposed here.
-- You can change the value of l_salt or the method of which to call the
-- DBMS_OBFUSCATOIN toolkit, but you much reset all of your passwords
-- if you choose to do this.

l_password := utl_raw.cast_to_raw(dbms_obfuscation_toolkit.md5
  (input_string => p_password || substr(l_salt,10,13) || p_username ||
    substr(l_salt, 4,10)));
return l_password;
end;

/
--------------------------------------------------------
--  Constraints for Table TBL_ATTACH
--------------------------------------------------------

  ALTER TABLE "XE"."TBL_ATTACH" ADD CONSTRAINT "TBL_ATTACH_PK" PRIMARY KEY ("SAVE_FILE_NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "XE"."TBL_ATTACH" MODIFY ("SAVE_FILE_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TBL_BOARD
--------------------------------------------------------

  ALTER TABLE "XE"."TBL_BOARD" ADD CONSTRAINT "TBL_BOARD_PK" PRIMARY KEY ("BNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "XE"."TBL_BOARD" MODIFY ("BNO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TBL_BOARD_TYPE
--------------------------------------------------------

  ALTER TABLE "XE"."TBL_BOARD_TYPE" ADD CONSTRAINT "TBL_BOARD_TYPE_PK" PRIMARY KEY ("BOARD_TYPE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "XE"."TBL_BOARD_TYPE" MODIFY ("BOARD_TYPE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TBL_MEMBER
--------------------------------------------------------

  ALTER TABLE "XE"."TBL_MEMBER" ADD CONSTRAINT "TBL_MEMBER_PK" PRIMARY KEY ("USER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "XE"."TBL_MEMBER" MODIFY ("USER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TBL_REPLY
--------------------------------------------------------

  ALTER TABLE "XE"."TBL_REPLY" ADD CONSTRAINT "TBL_REPLY_PK" PRIMARY KEY ("RNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "XE"."TBL_REPLY" MODIFY ("RNO" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table TBL_ATTACH
--------------------------------------------------------

  ALTER TABLE "XE"."TBL_ATTACH" ADD CONSTRAINT "TBL_ATTACH_TBL_BOARD_FK" FOREIGN KEY ("BNO")
	  REFERENCES "XE"."TBL_BOARD" ("BNO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TBL_BOARD
--------------------------------------------------------

  ALTER TABLE "XE"."TBL_BOARD" ADD CONSTRAINT "TBL_BOARD_TBL_BOARD_TYPE_FK" FOREIGN KEY ("BOARD_TYPE")
	  REFERENCES "XE"."TBL_BOARD_TYPE" ("BOARD_TYPE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TBL_REPLY
--------------------------------------------------------

  ALTER TABLE "XE"."TBL_REPLY" ADD CONSTRAINT "TBL_REPLY_TBL_BOARD_FK" FOREIGN KEY ("BNO")
	  REFERENCES "XE"."TBL_BOARD" ("BNO") ENABLE;
