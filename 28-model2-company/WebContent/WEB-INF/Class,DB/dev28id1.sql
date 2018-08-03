--------------------------------------------------------
--  파일이 생성됨 - 목요일-8월-02-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence SEQ_ID
--------------------------------------------------------

   CREATE SEQUENCE  "DEV28ID"."SEQ_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table BOOK
--------------------------------------------------------

  CREATE TABLE "DEV28ID"."BOOK" 
   (	"BOOK_NO" VARCHAR2(20 BYTE), 
	"BOOK_NAME" VARCHAR2(20 BYTE), 
	"BOOK_AUTHOR" VARCHAR2(20 BYTE), 
	"BOOK_PRICE" VARCHAR2(20 BYTE), 
	"BOOK_AMOUNT" VARCHAR2(20 BYTE), 
	"BOOK_OUT" VARCHAR2(20 BYTE), 
	"BOOK_DATE" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table KSMART_BOARD
--------------------------------------------------------

  CREATE TABLE "DEV28ID"."KSMART_BOARD" 
   (	"BOARD_NUM" NUMBER, 
	"BOARD_NAME" VARCHAR2(20 BYTE), 
	"BOARD_PASS" VARCHAR2(15 BYTE), 
	"BOARD_SUBJECT" VARCHAR2(50 BYTE), 
	"BOARD_CONTENT" VARCHAR2(2000 BYTE), 
	"BOARD_FILE" VARCHAR2(50 BYTE), 
	"BOARD_RE_REF" NUMBER, 
	"BOARD_RE_LEV" NUMBER, 
	"BOARD_RE_SEQ" NUMBER, 
	"BOARD_READCOUNT" NUMBER, 
	"BOARD_DATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "DEV28ID"."MEMBER" 
   (	"MEMBER_NO" NUMBER(*,0), 
	"MEMBER_ID" VARCHAR2(50 BYTE), 
	"MEMBER_PW" VARCHAR2(50 BYTE), 
	"MEMBER_NAME" VARCHAR2(50 BYTE), 
	"MEMBER_ADDR" VARCHAR2(50 BYTE), 
	"MEMBER_LEVEL" VARCHAR2(50 BYTE), 
	"MEMBER_DATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table ORACLE_MEMBER
--------------------------------------------------------

  CREATE TABLE "DEV28ID"."ORACLE_MEMBER" 
   (	"ORA_ID" VARCHAR2(10 BYTE), 
	"ORA_PW" VARCHAR2(10 BYTE), 
	"ORA_LEVEL" VARCHAR2(10 BYTE), 
	"ORA_NAME" VARCHAR2(20 BYTE), 
	"ORA_EMAIL" VARCHAR2(80 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into DEV28ID.BOOK
SET DEFINE OFF;
Insert into DEV28ID.BOOK (BOOK_NO,BOOK_NAME,BOOK_AUTHOR,BOOK_PRICE,BOOK_AMOUNT,BOOK_OUT,BOOK_DATE) values ('2','홍길동전','작자미상','5000','20','판매중','18/08/02');
REM INSERTING into DEV28ID.KSMART_BOARD
SET DEFINE OFF;
Insert into DEV28ID.KSMART_BOARD (BOARD_NUM,BOARD_NAME,BOARD_PASS,BOARD_SUBJECT,BOARD_CONTENT,BOARD_FILE,BOARD_RE_REF,BOARD_RE_LEV,BOARD_RE_SEQ,BOARD_READCOUNT,BOARD_DATE) values (1,'글쓴이1','1','제목1','내용1','test.txt',1,0,0,3,to_date('18/07/19','RR/MM/DD'));
Insert into DEV28ID.KSMART_BOARD (BOARD_NUM,BOARD_NAME,BOARD_PASS,BOARD_SUBJECT,BOARD_CONTENT,BOARD_FILE,BOARD_RE_REF,BOARD_RE_LEV,BOARD_RE_SEQ,BOARD_READCOUNT,BOARD_DATE) values (2,'글쓴이2','2','제목2','내용2','test2.txt',2,0,0,0,to_date('18/07/20','RR/MM/DD'));
Insert into DEV28ID.KSMART_BOARD (BOARD_NUM,BOARD_NAME,BOARD_PASS,BOARD_SUBJECT,BOARD_CONTENT,BOARD_FILE,BOARD_RE_REF,BOARD_RE_LEV,BOARD_RE_SEQ,BOARD_READCOUNT,BOARD_DATE) values (3,'글쓴이3','3','제목3','내용3','test3.txt',3,0,0,0,to_date('18/07/20','RR/MM/DD'));
Insert into DEV28ID.KSMART_BOARD (BOARD_NUM,BOARD_NAME,BOARD_PASS,BOARD_SUBJECT,BOARD_CONTENT,BOARD_FILE,BOARD_RE_REF,BOARD_RE_LEV,BOARD_RE_SEQ,BOARD_READCOUNT,BOARD_DATE) values (6,'글쓴이6','6','제목6','내용6','test7.txt',6,0,0,0,to_date('18/07/20','RR/MM/DD'));
Insert into DEV28ID.KSMART_BOARD (BOARD_NUM,BOARD_NAME,BOARD_PASS,BOARD_SUBJECT,BOARD_CONTENT,BOARD_FILE,BOARD_RE_REF,BOARD_RE_LEV,BOARD_RE_SEQ,BOARD_READCOUNT,BOARD_DATE) values (4,'글쓴이4','4','제목4','내용4','test5.txt',4,0,0,0,to_date('18/07/20','RR/MM/DD'));
Insert into DEV28ID.KSMART_BOARD (BOARD_NUM,BOARD_NAME,BOARD_PASS,BOARD_SUBJECT,BOARD_CONTENT,BOARD_FILE,BOARD_RE_REF,BOARD_RE_LEV,BOARD_RE_SEQ,BOARD_READCOUNT,BOARD_DATE) values (5,'글쓴이5','5','제목5','내용5','test6.txt',5,0,0,0,to_date('18/07/20','RR/MM/DD'));
Insert into DEV28ID.KSMART_BOARD (BOARD_NUM,BOARD_NAME,BOARD_PASS,BOARD_SUBJECT,BOARD_CONTENT,BOARD_FILE,BOARD_RE_REF,BOARD_RE_LEV,BOARD_RE_SEQ,BOARD_READCOUNT,BOARD_DATE) values (7,'글쓴이7','7','제목7','내용7','test8.txt',7,0,0,0,to_date('18/07/20','RR/MM/DD'));
Insert into DEV28ID.KSMART_BOARD (BOARD_NUM,BOARD_NAME,BOARD_PASS,BOARD_SUBJECT,BOARD_CONTENT,BOARD_FILE,BOARD_RE_REF,BOARD_RE_LEV,BOARD_RE_SEQ,BOARD_READCOUNT,BOARD_DATE) values (8,'글쓴이8','8','제목8','내용8','test9.txt',8,0,0,0,to_date('18/07/20','RR/MM/DD'));
Insert into DEV28ID.KSMART_BOARD (BOARD_NUM,BOARD_NAME,BOARD_PASS,BOARD_SUBJECT,BOARD_CONTENT,BOARD_FILE,BOARD_RE_REF,BOARD_RE_LEV,BOARD_RE_SEQ,BOARD_READCOUNT,BOARD_DATE) values (9,'글쓴이9','9','제목9','내용9','test10.txt',9,0,0,0,to_date('18/07/20','RR/MM/DD'));
Insert into DEV28ID.KSMART_BOARD (BOARD_NUM,BOARD_NAME,BOARD_PASS,BOARD_SUBJECT,BOARD_CONTENT,BOARD_FILE,BOARD_RE_REF,BOARD_RE_LEV,BOARD_RE_SEQ,BOARD_READCOUNT,BOARD_DATE) values (10,'글쓴이10','10','제목10','내용10','test11.txt',10,0,0,0,to_date('18/07/20','RR/MM/DD'));
Insert into DEV28ID.KSMART_BOARD (BOARD_NUM,BOARD_NAME,BOARD_PASS,BOARD_SUBJECT,BOARD_CONTENT,BOARD_FILE,BOARD_RE_REF,BOARD_RE_LEV,BOARD_RE_SEQ,BOARD_READCOUNT,BOARD_DATE) values (11,'글쓴이11','11','제목11','내용11','test12.txt',11,0,0,1,to_date('18/07/20','RR/MM/DD'));
Insert into DEV28ID.KSMART_BOARD (BOARD_NUM,BOARD_NAME,BOARD_PASS,BOARD_SUBJECT,BOARD_CONTENT,BOARD_FILE,BOARD_RE_REF,BOARD_RE_LEV,BOARD_RE_SEQ,BOARD_READCOUNT,BOARD_DATE) values (12,'답변1','1','Re: 제목11','1',null,11,1,1,1,to_date('18/07/20','RR/MM/DD'));
REM INSERTING into DEV28ID.MEMBER
SET DEFINE OFF;
REM INSERTING into DEV28ID.ORACLE_MEMBER
SET DEFINE OFF;
Insert into DEV28ID.ORACLE_MEMBER (ORA_ID,ORA_PW,ORA_LEVEL,ORA_NAME,ORA_EMAIL) values ('id001','pw001','관리자','홍01','001@ksmart.or.kr');
Insert into DEV28ID.ORACLE_MEMBER (ORA_ID,ORA_PW,ORA_LEVEL,ORA_NAME,ORA_EMAIL) values ('id002','pw002','판매자','홍02','002@ksmart.or.kr');
Insert into DEV28ID.ORACLE_MEMBER (ORA_ID,ORA_PW,ORA_LEVEL,ORA_NAME,ORA_EMAIL) values ('id003','pw003','구매자','홍03','003@ksmart.or.kr');
Insert into DEV28ID.ORACLE_MEMBER (ORA_ID,ORA_PW,ORA_LEVEL,ORA_NAME,ORA_EMAIL) values ('id004','pw004','구매자','홍04','004@ksmart.or.kr');
Insert into DEV28ID.ORACLE_MEMBER (ORA_ID,ORA_PW,ORA_LEVEL,ORA_NAME,ORA_EMAIL) values ('id005','pw005','구매자','홍05','005@ksmart.or.kr');
--------------------------------------------------------
--  DDL for Index BOOK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "DEV28ID"."BOOK_PK" ON "DEV28ID"."BOOK" ("BOOK_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MEMBER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "DEV28ID"."MEMBER_PK" ON "DEV28ID"."MEMBER" ("MEMBER_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table BOOK
--------------------------------------------------------

  ALTER TABLE "DEV28ID"."BOOK" ADD CONSTRAINT "BOOK_PK" PRIMARY KEY ("BOOK_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "DEV28ID"."BOOK" MODIFY ("BOOK_DATE" NOT NULL ENABLE);
  ALTER TABLE "DEV28ID"."BOOK" MODIFY ("BOOK_OUT" NOT NULL ENABLE);
  ALTER TABLE "DEV28ID"."BOOK" MODIFY ("BOOK_AMOUNT" NOT NULL ENABLE);
  ALTER TABLE "DEV28ID"."BOOK" MODIFY ("BOOK_PRICE" NOT NULL ENABLE);
  ALTER TABLE "DEV28ID"."BOOK" MODIFY ("BOOK_AUTHOR" NOT NULL ENABLE);
  ALTER TABLE "DEV28ID"."BOOK" MODIFY ("BOOK_NAME" NOT NULL ENABLE);
  ALTER TABLE "DEV28ID"."BOOK" MODIFY ("BOOK_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ORACLE_MEMBER
--------------------------------------------------------

  ALTER TABLE "DEV28ID"."ORACLE_MEMBER" ADD PRIMARY KEY ("ORA_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "DEV28ID"."ORACLE_MEMBER" MODIFY ("ORA_NAME" NOT NULL ENABLE);
  ALTER TABLE "DEV28ID"."ORACLE_MEMBER" MODIFY ("ORA_LEVEL" NOT NULL ENABLE);
  ALTER TABLE "DEV28ID"."ORACLE_MEMBER" MODIFY ("ORA_PW" NOT NULL ENABLE);
  ALTER TABLE "DEV28ID"."ORACLE_MEMBER" MODIFY ("ORA_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "DEV28ID"."MEMBER" ADD CONSTRAINT "MEMBER_PK" PRIMARY KEY ("MEMBER_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "DEV28ID"."MEMBER" MODIFY ("MEMBER_DATE" NOT NULL ENABLE);
  ALTER TABLE "DEV28ID"."MEMBER" MODIFY ("MEMBER_LEVEL" NOT NULL ENABLE);
  ALTER TABLE "DEV28ID"."MEMBER" MODIFY ("MEMBER_ADDR" NOT NULL ENABLE);
  ALTER TABLE "DEV28ID"."MEMBER" MODIFY ("MEMBER_NAME" NOT NULL ENABLE);
  ALTER TABLE "DEV28ID"."MEMBER" MODIFY ("MEMBER_PW" NOT NULL ENABLE);
  ALTER TABLE "DEV28ID"."MEMBER" MODIFY ("MEMBER_ID" NOT NULL ENABLE);
  ALTER TABLE "DEV28ID"."MEMBER" MODIFY ("MEMBER_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table KSMART_BOARD
--------------------------------------------------------

  ALTER TABLE "DEV28ID"."KSMART_BOARD" ADD PRIMARY KEY ("BOARD_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;