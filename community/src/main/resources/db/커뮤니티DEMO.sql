CREATE USER COMMUNITY IDENTIFIED BY COMMUNITY;

GRANT CONNECT, RESOURCE, DBA TO COMMUNITY;


/*
작성자 : 육심규
편집일 : 2022-07-05
프로젝트명 : 커뮤니티DEMO(개인)
*/

/* 테이블 생성 */
--1. 회원정보 테이블
CREATE TABLE MEMBER(
	MEM_ID					VARCHAR2(30)					    CONSTRAINT PK_MEM_ID PRIMARY KEY,
	MEM_PW                 	CHAR(60)						    NOT NULL,
	MEM_PHONE          	    VARCHAR2(15)						NOT NULL,
	MEM_NAME             	VARCHAR2(20)						NOT NULL,
    MEM_EMAIL            	VARCHAR2(50)						NOT NULL UNIQUE,
	MEM_DATE_JOIN      	    DATE            DEFAULT SYSDATE   	NOT NULL,
	MEM_DATE_UP        	    DATE            DEFAULT SYSDATE		NOT NULL,
	MEM_DATE_LOGIN   	    DATE            DEFAULT SYSDATE    	NOT NULL
	-- MEM_SESSION_KEY	        VARCHAR2(50),
	-- MEM_SESSION_LIMIT	    TIMESTAMP
);


--2. 카테고리 테이블
CREATE TABLE CATEGORY(
	CAT_C				    NUMBER				PRIMARY KEY,
	CAT_NAME				VARCHAR2(30)		NOT NULL,
    CAT_P                   NUMBER,
	CAT_BOA_NUM			    NUMBER,
	BOA_UP                  NUMBER,
    BOA_DOWN                NUMBER
);


INSERT INTO CATEGORY (CAT_C, CAT_NAME, CAT_P) VALUES(1, 'SMF', NULL);
INSERT INTO CATEGORY (CAT_C, CAT_NAME, CAT_P) VALUES(1001, '공지사항', 1);
INSERT INTO CATEGORY (CAT_C, CAT_NAME, CAT_P) VALUES(1002, '잡담', 1);
INSERT INTO CATEGORY (CAT_C, CAT_NAME, CAT_P) VALUES(1003, '정보', 1);
INSERT INTO CATEGORY (CAT_C, CAT_NAME, CAT_P) VALUES(1004, '유머/사진', 1);

INSERT INTO CATEGORY (CAT_C, CAT_NAME, CAT_P) VALUES(2, '38대', NULL);
INSERT INTO CATEGORY (CAT_C, CAT_NAME, CAT_P) VALUES(2001, '공지사항', 2);
INSERT INTO CATEGORY (CAT_C, CAT_NAME, CAT_P) VALUES(2002, '잡담', 2);
INSERT INTO CATEGORY (CAT_C, CAT_NAME, CAT_P) VALUES(2003, '정보', 2);
INSERT INTO CATEGORY (CAT_C, CAT_NAME, CAT_P) VALUES(2004, '유머/사진', 2);

INSERT INTO CATEGORY (CAT_C, CAT_NAME, CAT_P) VALUES(3, '이젠아카데미(노원)', NULL);
INSERT INTO CATEGORY (CAT_C, CAT_NAME, CAT_P) VALUES(3001, '공지사항', 3);
INSERT INTO CATEGORY (CAT_C, CAT_NAME, CAT_P) VALUES(3002, '잡담', 3);
INSERT INTO CATEGORY (CAT_C, CAT_NAME, CAT_P) VALUES(3003, '정보', 3);
INSERT INTO CATEGORY (CAT_C, CAT_NAME, CAT_P) VALUES(3004, '유머/사진', 3);

INSERT INTO CATEGORY (CAT_C, CAT_NAME, CAT_P) VALUES(4, 'YASANTA', NULL);
INSERT INTO CATEGORY (CAT_C, CAT_NAME, CAT_P) VALUES(4001, '공지사항', 4);
INSERT INTO CATEGORY (CAT_C, CAT_NAME, CAT_P) VALUES(4002, '잡담', 4);
INSERT INTO CATEGORY (CAT_C, CAT_NAME, CAT_P) VALUES(4003, '정보', 4);
INSERT INTO CATEGORY (CAT_C, CAT_NAME, CAT_P) VALUES(4004, '유머/사진', 4);

INSERT INTO CATEGORY (CAT_C, CAT_NAME, CAT_P) VALUES(5, 'WBM', NULL);
INSERT INTO CATEGORY (CAT_C, CAT_NAME, CAT_P) VALUES(5001, '공지사항', 5);
INSERT INTO CATEGORY (CAT_C, CAT_NAME, CAT_P) VALUES(5002, '잡담', 5);
INSERT INTO CATEGORY (CAT_C, CAT_NAME, CAT_P) VALUES(5003, '정보', 5);
INSERT INTO CATEGORY (CAT_C, CAT_NAME, CAT_P) VALUES(5004, '유머/사진', 5);

--3. 관리자 게시판 테이블
CREATE TABLE AD_BOARD(
	AD_BOA_NUM				NUMBER						    CONSTRAINT PK_BOA_NUM PRIMARY KEY,
    AD_BOA_C                NUMBER,
    AD_BOA_P                NUMBER,
	AD_BOA_TITLE			VARCHAR2(100)					NOT NULL,
	AD_BOA_CONTENT			VARCHAR2(4000)					NOT NULL,
	AD_BOA_DATE_REG			DATE        DEFAULT SYSDATE		NOT NULL,
    AD_BOA_DATE_UP 		    DATE        DEFAULT SYSDATE		NOT NULL
);



--3. 게시판 테이블
CREATE TABLE BOARD(
	BOA_NUM				    NUMBER							CONSTRAINT PK_BOA_NUM PRIMARY KEY,
	MEM_ID					VARCHAR2(30)					NOT NULL,
	BOA_TITLE				VARCHAR2(100)					NOT NULL,
	BOA_CONTENT			    VARCHAR2(4000)					NOT NULL,
	BOA_DATE_REG			DATE        DEFAULT SYSDATE		NOT NULL,
    EVE_NAME                VARCHAR2(30)                    NOT NULL,
    CAT_NUM                 NUMBER                          NOT NULL,
    BOA_HIT                 NUMBER,
    BOA_REP_NUM             NUMBER,
    REP_UP                  NUMBER,
    REP_DOWN                NUMBER
);


--4. 게시글 이벤트 테이블
CREATE TABLE EVENT(
    EVE_NAME      VARCHAR2(30)     CONSTRAINT PK_EVE_NAME PRIMARY KEY,
    EVE_NUM       NUMBER           NOT NULL
);


--5. 댓글 테이블
CREATE TABLE REPLY(
    REP_NUM                 NUMBER                          CONSTRAINT PK_REP_NUM PRIMARY KEY,
	MEM_ID					VARCHAR2(30)					NOT NULL,
    BOA_NUM				    NUMBER							NOT NULL,
	REP_CONTENT			    VARCHAR2(500)					NOT NULL,
	REP_DATE_REG			DATE        DEFAULT SYSDATE		NOT NULL,
    FOREIGN KEY(MEM_ID)     REFERENCES MEMBER(MEM_ID),
    FOREIGN KEY(BOA_NUM)    REFERENCES BOARD(BOA_NUM)
);

--6. 관리자 로그인 테이블
CREATE TABLE ADMIN(
	ADM_ID				VARCHAR2(30)						PRIMARY KEY,
	ADM_PW				VARCHAR2(60)						NOT NULL,
	ADM_NAME			VARCHAR2(30)						NOT NULL,
	ADM_DATE_LOGIN	    DATE        		                NOT NULL
);


--7. 파입업로드 테이블
CREATE TABLE UPLOAD(
    UPL_UUID            VARCHAR2(100)           CONSTRAINT PK_UPL_UUID PRIMARY KEY,
    UPL_PATH            VARCHAR2(200)           NOT NULL,
    UPL_NAME            VARCHAR2(100)           NOT NULL,
    UPL_TYPE            CHAR(1)                 DEFAULT '1',
    MEM_ID			    VARCHAR2(30)			NOT NULL,
    BOA_NUM             NUMBER,
    FOREIGN KEY(MEM_ID) REFERENCES MEMBER(MEM_ID),
    FOREIGN KEY (BOA_NUM) REFERENCES BOARD(BOA_NUM)
);


-- 테이블 조회
SELECT * FROM MEMBER;
SELECT * FROM CATEGORY;
SELECT * FROM BOARD;
SELECT * FROM EVENT;
SELECT * FROM REPLY;
SELECT * FROM ADMIN;
SELECT * FROM UPLOAD;

-- 테이블 삭제
DROP TABLE MEMBER;
DROP TABLE CATEGORY;
DROP TABLE AD_BOARD;
DROP TABLE BOARD;
DROP TABLE EVENT;
DROP TABLE REPLY;
DROP TABLE ADMIN;
DROP TABLE UPLOAD;


-- 2-1. 카테고리 번호 시퀀스
CREATE SEQUENCE SEQ_CAT_NUM;

-- 3-1. 관리자 게시글 번호 시퀀스
CREATE SEQUENCE SEQ_AD_BOA_NUM;

-- 3-1. 게시글 번호 시퀀스
CREATE SEQUENCE SEQ_BOA_NUM
START WITH 1
INCREMENT BY 1;

-- 4-1. 게시글 이벤트 번호 시퀀스
CREATE SEQUENCE SEQ_EVE_NUM
START WITH 1
INCREMENT BY 1;

-- 5-1. 댓글 번호 시퀀스
CREATE SEQUENCE SEQ_REP_NUM
START WITH 1
INCREMENT BY 1;

-- 시퀀스 삭제
DROP SEQUENCE SEQ_CAT_NUM;
DROP SEQUENCE SEQ_BOA_NUM;
DROP SEQUENCE SEQ_EVE_NUM;
DROP SEQUENCE SEQ_REP_NUM;

insert into ADMIN
values('admin', '$2a$10$rfHhMGtD4b.ar9AppvkbNON6vIcpmJPKtpD8WHh7TzL5jfXDlN/fe', '관리자', sysdate);

commit;




INSERT INTO CATEGORY (CAT_NUM, CAT_NAME)
		VALUES (SEQ_CAT_NUM.NEXTVAL, '1');

INSERT INTO CATEGORY (CAT_NUM, CAT_NAME)
		VALUES (SEQ_CAT_NUM.NEXTVAL, '늘');
