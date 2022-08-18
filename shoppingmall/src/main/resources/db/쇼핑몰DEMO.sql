CREATE USER SPRING IDENTIFIED BY SPRING;

GRANT CONNECT, RESOURCE, DBA TO SPRING;

/*
작성자 : 육심규
편집일 : 2022-07-05
프로젝트명 : 쇼핑몰DEMO
*/

/* 테이블 생성 */
--1. 회원가입 테이블
CREATE TABLE TBL_MEMBER(
	MEM_ID					VARCHAR2(15)					    CONSTRAINT PK_MEM_ID PRIMARY KEY,
	MEM_NAME             	VARCHAR2(30)						NOT NULL,
	MEM_PW                 	CHAR(60)    						NOT NULL,
	MEM_ZIPCODE         	CHAR(5) 							NOT NULL,
	MEM_ADDR              	VARCHAR2(100)						NOT NULL,
	MEM_ADDR_D			    VARCHAR2(100)						NOT NULL,
	MEM_PHONE          	    VARCHAR2(15)						NOT NULL,
	MEM_NICK             	VARCHAR2(20)						NOT NULL UNIQUE,
    MEM_EMAIL            	VARCHAR2(50)						NOT NULL UNIQUE,
	MEM_ACCEPT_E      	    CHAR(1)         DEFAULT 'Y'			NOT NULL,
	MEM_POINT				NUMBER          DEFAULT 0          	NOT NULL,
	MEM_DATE_SUB      	    DATE            DEFAULT SYSDATE   	NOT NULL,
	MEM_DATE_UP        	    DATE            DEFAULT SYSDATE		NOT NULL,
	MEM_DATE_LAST   	    DATE            DEFAULT SYSDATE    	NOT NULL,
	MEM_AUTHCODE		    CHAR(1)
	-- MEM_SESSION_KEY	        VARCHAR2(50),
	-- MEM_SESSION_LIMIT	    TIMESTAMP
);

--2. 카테고리 테이블
CREATE TABLE TBL_CATEGORY (
    CG_CODE_C       			NUMBER        				PRIMARY KEY,
    CG_CODE_P     		        NUMBER,                                          
    CG_NAME           		    VARCHAR2(50)         		NOT NULL
);

INSERT INTO TBL_CATEGORY VALUES(1, NULL, 'TOP');

INSERT INTO TBL_CATEGORY VALUES(1001, 1, '반팔티');
INSERT INTO TBL_CATEGORY VALUES(1002, 1, '나시');
INSERT INTO TBL_CATEGORY VALUES(1003, 1, '프린팅티');
INSERT INTO TBL_CATEGORY VALUES(1004, 1, '니트');
INSERT INTO TBL_CATEGORY VALUES(1005, 1, '맨투맨');
INSERT INTO TBL_CATEGORY VALUES(1006, 1, '긴팔티');

INSERT INTO TBL_CATEGORY VALUES(2, NULL, 'SHIRTS');

INSERT INTO TBL_CATEGORY VALUES(2001, 2, '베이직');
INSERT INTO TBL_CATEGORY VALUES(2002, 2, '청남방');
INSERT INTO TBL_CATEGORY VALUES(2003, 2, '체크');
INSERT INTO TBL_CATEGORY VALUES(2004, 2, '스트라이프');
INSERT INTO TBL_CATEGORY VALUES(2005, 2, '헨리넥');

INSERT INTO TBL_CATEGORY VALUES(3, NULL, 'PANTS');

INSERT INTO TBL_CATEGORY VALUES(3001, 3, '슬랙스');
INSERT INTO TBL_CATEGORY VALUES(3002, 3, '면바지');
INSERT INTO TBL_CATEGORY VALUES(3003, 3, '청바지');
INSERT INTO TBL_CATEGORY VALUES(3004, 3, '밴딩팬츠');
INSERT INTO TBL_CATEGORY VALUES(3005, 3, '반바지');

COMMIT;

--3. 상품 테이블
CREATE TABLE TBL_PRODUCT(
    PDT_NUM					NUMBER								CONSTRAINT PK_PDT_NUM PRIMARY KEY,
    CG_NUM_2                NUMBER,
    CG_NUM_1                NUMBER,
    PDT_NAME				VARCHAR2(50)						NOT NULL,
    PDT_PRICE				NUMBER								NOT NULL,
    PDT_DISCOUNT			NUMBER								NOT NULL,
    PDT_COMPANY			    VARCHAR2(30)						NOT NULL,
    PDT_DETAIL				VARCHAR2(4000)					    NOT NULL,
    PDT_IMG					VARCHAR2(200)						NOT NULL,
    PDT_IMG_FOLDER          VARCHAR2(50)						NOT NULL,
    PDT_AMOUNT			    NUMBER								NOT NULL,
    PDT_BUY					CHAR(1) DEFAULT 'Y'					NOT NULL,
    PDT_DATE_SUB			DATE 		DEFAULT SYSDATE			NOT NULL,
    PDT_DATE_UP			    DATE        DEFAULT SYSDATE			NOT NULL
);

INSERT INTO TBL_PRODUCT VALUES(3005, 3, '반바지');

DROP TABLE TBL_PRODUCT;
-- 상품코드 시퀀스
CREATE SEQUENCE SEQ_TBL_PRODUCT_NUM;

INSERT INTO TBL_PRODUCT
					( PDT_NUM, CG_NUM_2, CG_NUM_1, PDT_NAME, PDT_PRICE,
					  PDT_DISCOUNT, PDT_COMPANY, PDT_DETAIL, PDT_IMG, PDT_IMG_FOLDER, PDT_AMOUNT, PDT_BUY )
		VALUES
					( SEQ_TBL_PRODUCT_NUM.NEXTVAL, 1, 2, '1', 1, 1, '1', '1', '1', '1', 1, 'Y');

--4. 장바구니 테이블 
CREATE TABLE TBL_CART(
	CART_CODE				NUMBER								PRIMARY KEY,			
	PDT_NUM				    NUMBER								NOT NULL,
	MEM_ID					VARCHAR2(20)						NOT NULL,
	CART_AMOUNT			    NUMBER								NOT NULL,
);

--5. 주문 테이블
CREATE TABLE TBL_ORDER(
	ODR_CODE				NUMBER								CONSTRAINT PK_ODR_CODE PRIMARY KEY,
	MEM_ID					VARCHAR2(60)						NOT NULL,
	ODR_NAME				VARCHAR2(30)						NOT NULL,
	ODR_ZIPCODE			    CHAR(5)								NOT NULL,
	ODR_ADDR				VARCHAR2(50)						NOT NULL,
	ODR_ADDR_D			    VARCHAR2(50)						NOT NULL,
	ODR_PHONE				VARCHAR2(20)						NOT NULL,
	ODR_TOTAL_PRICE		    NUMBER								NOT NULL,
	ODR_DATE				DATE        DEFAULT SYSDATE			NOT NULL,
    ODR_MESSAGE             VARCHAR2(100),
    ODR_STATUS              VARCHAR2(20) DEFAULT '배송준비중'    NOT NULL,
    PAYMENT_STATUS          VARCHAR2(20) NOT NULL,
    CS_STATUS               VARCHAR2(20) NULL
);

CREATE SEQUENCE SEQ_ODR_CODE;

ODR_CODE, MEM_ID, ODR_NAME, ODR_ZIPCODE, ODR_ADDR, ODR_ADDR_D, ODR_PHONE, ODR_TOTAL_PRICE, ODR_DATE, ODR_MESSAGE, ODR_STATUS, PAYMENT_STATUS, CS_STATUS
--6. 주문 상세 테이블
CREATE TABLE TBL_ORDER_DETAIL(
	ODR_CODE				NUMBER							NOT NULL,
	PDT_NUM				    NUMBER							NOT NULL,
	ODR_AMOUNT			    NUMBER							NOT NULL,
	ODR_PRICE				NUMBER							NOT NULL,
	PRIMARY KEY (ODR_CODE, PDT_NUM)
);
ODR_CODE, PDT_NUM, ODR_AMOUNT, ODR_PRICE
--7. 게시판 테이블
CREATE TABLE TBL_BOARD(
	BRD_NUM				    NUMBER							CONSTRAINT PK_BRD_NUM PRIMARY KEY,
	MEM_ID					VARCHAR2(15)					NOT NULL,
	BRD_TITLE				VARCHAR2(100)					NOT NULL,
	BRD_CONTENT			    VARCHAR2(4000)					NOT NULL,
	BRD_DATE_REG			DATE        DEFAULT SYSDATE		NOT NULL,
);

--8. 상품후기 테이블 
CREATE TABLE TBL_REVIEW(
	RV_NUM					NUMBER								CONSTRAINT PK_RV_NUM PRIMARY KEY,
	MEM_ID					VARCHAR2(50)						NOT NULL,
	PDT_NUM				    NUMBER								NOT NULL,
	RV_CONTENT			    VARCHAR2(200)						NOT NULL,
	RV_SCORE				NUMBER								NOT NULL,
	RV_DATE_REG			    DATE        DEFAULT SYSDATE			NOT NULL
);
rv_num, mem_id, pdt_num, rv_content, rv_score, rv_date_reg
CREATE SEQUENCE SEQ_RV_NUM;

INSERT INTO TBL_REVIEW
SELECT SEQ_RV_NUM.NEXTVAL, MEM_ID, PDT_NUM, '별점테스트', 4, RV_DATE_REG FROM TBL_REVIEW;
COMMIT;

--9. 관리자 로그인 테이블
CREATE TABLE TBL_ADMIN(
	ADMIN_ID				VARCHAR2(15)						PRIMARY KEY,
	ADMIN_PW				CHAR(60)    						NOT NULL,
	ADMIN_NAME			    VARCHAR2(15)						NOT NULL,
	ADMIN_DATE_LATE	        DATE        		                NOT NULL
);


-- 주문테이블
-- 주문상태 컬럼 : 상품준비중 / 배송준비중 / 배송보류 / 배송대기 /배송중 / 배송완료
-- 결제상태 컬럼 : 입금전 / 추가입금대기 / 입금완료(수동) / 입금완료(자동) / 결제완료
-- CS상태 : 취소 / 교환 / 반품 / 환불


--10. 결제 테이블
CREATE TABLE TBL_PAYMENT
(
    PAY_CODE            NUMBER  CONSTRAINT PK_PAYMENT_CODE PRIMARY KEY,  -- 결제코드
    ODR_CODE            NUMBER  NOT NULL,  -- 주문코드(FK)
    PAY_METHOD          VARCHAR2(20)    NOT NULL,  -- 결제수단 -> 무통장 / 신용카드 / 페이코 / 휴대폰 / 카카오페이 등
    PAY_DATE            DATE    NOT NULL,  -- 결제(입금)일자
    PAY_TOT_PRICE       NUMBER NOT NULL,  -- 총 실 결제금액
    PAY_REST_PRICE      NUMBER NOT NULL,  -- 추가 입금금액
    PAY_NOBANK_PRICE    NUMBER NULL,  -- 무통장 입금액
    PAY_NOBANK_USER     VARCHAR2(20)    NULL, -- 무통장 입금자명
    PAY_NOBANK          VARCHAR2(20)    NULL   -- 무통장 입금은행
);

PAY_CODE, ODR_CODE, PAY_METHOD, PAY_DATE, PAY_TOT_PRICE, PAY_REST_PRICE, PAY_NOBANK_PRICE, PAY_NOBANK_USER, PAY_NOBANK


/* 테이블 조회 */
SELECT * FROM TBL_MEMBER;
SELECT * FROM TBL_CATEGORY;
SELECT * FROM TBL_PRODUCT;
SELECT * FROM TBL_CART;
SELECT * FROM TBL_ORDER;
SELECT * FROM TBL_ORDER_DETAIL;
SELECT * FROM TBL_BOARD;
SELECT * FROM TBL_REVIEW;




select mem_id from tbl_member where mem_id = dbrtlarb;

SELECT MEM_ID
FROM TBL_MEMBER
WHERE MEM_ID = 'dbrtlarb';




insert into TBL_ADMIN
values('admin', '$2a$10$rfHhMGtD4b.ar9AppvkbNON6vIcpmJPKtpD8WHh7TzL5jfXDlN/fe', '관리자', sysdate);

commit;

SELECT ADMIN_ID, ADMIN_PW, ADMIN_NAME, ADMIN_DATE_LATE
FROM TBL_ADMIN;


commit;

INSERT INTO TBL_PRODUCT
SELECT SEQ_TBL_PRODUCT_NUM.nextval, CG_NUM_2, CG_NUM_1, PDT_NAME, PDT_PRICE,
        PDT_DISCOUNT, PDT_COMPANY, PDT_DETAIL, PDT_IMG, PDT_IMG_FOLDER,
        PDT_AMOUNT, PDT_BUY, sysdate, sysdate
FROM TBL_PRODUCT;



CREATE SEQUENCE SEQ_TBL_PRODUCT_NUM;
CREATE SEQUENCE SEQ_CART_CODE;
CREATE SEQUENCE SEQ_ODR_CODE;
CREATE SEQUENCE SEQ_PAY_CODE;


-- 카트 리스트 불러오기 조인이용
SELECT C.CART_CODE, C.PDT_NUM, C.MEM_ID, C.CART_AMOUNT, P.PDT_IMG_FOLDER, P.PDT_IMG, P.PDT_NAME, P.PDT_PRICE, M.MEM_POINT
FROM TBL_CART C INNER JOIN TBL_PRODUCT P
ON C.PDT_NUM = P.PDT_NUM
INNER JOIN TBL_MEMBER M
ON C.MEM_ID = M.MEM_ID;

-- 장바구니 상품 존재시 업데이트, 존재 안하면 삽입
MERGE INTO TBL_CART
USING DUAL
ON (MEM_ID = 'USER01' AND PDT_NUM = 53)
WHEN MATCHED THEN
    UPDATE SET CART_AMOUNT = CART_AMOUNT + 10
WHEN NOT MATCHED THEN
    INSERT(CART_CODE, PDT_NUM, MEM_ID, CART_AMOUNT)
    VALUES(SEQ_CART_CODE.NEXTVAL, 상품코드, 아이디, 수량);

--회원정보 추가
INSERT INTO TBL_MEMBER
SELECT 'USER01', '홍길동', MEM_PW, MEM_ZIPCODE, MEM_ADDR, MEM_ADDR_D, MEM_PHONE, '냉무', 'DBRTLARB@NAVER.COM',
        MEM_ACCEPT_E, MEM_POINT, SYSDATE, SYSDATE, SYSDATE, MEM_AUTHCODE
FROM TBL_MEMBER;
COMMIT;


-- 장바구니 테이블, 상품테이블 조인
SELECT C.CART_CODE, C.PDT_NUM, C.MEM_ID, C.CART_AMOUNT,
       P.PDT_NAME, P.PDT_PRICE, P.PDT_DISCOUNT, P.PDT_COMPANY, P.PDT_DETAIL, P.PDT_IMG, P.PDT_IMG_FOLDER, P.PDT_AMOUNT, P.PDT_BUY
FROM TBL_CART C INNER JOIN TBL_PRODUCT P
ON C.PDT_NUM = P.PDT_NUM
WHERE C.MEM_ID = 'USER01';

DELETE TBL_CART
WHERE MEM_ID = #{mem_id};

SELECT *
FROM TBL_ORDER
WHERE ODR_DATE >= TO_DATE('2022-07-01', 'YYYY-MM-DD')
AND ODR_DATE < TO_DATE('2022-08-18', 'YYYY-MM-DD') + 1;

-- 주문정보 결제정보 주문상품정보
SELECT * FROM TBL_ORDER WHERE ODR_CODE = 22;

SELECT * FROM TBL_PAYMENT WHERE ODR_CODE = 22;

SELECT *
FROM TBL_ORDER O
INNER JOIN TBL_ORDER_DETAIL D
ON O.ODR_CODE = D.ODR_CODE
INNER JOIN TBL_PRODUCT P
ON P.PDT_NUM = D.PDT_NUM
WHERE O.ODR_CODE = 22;

SELECT D.ODR_CODE, D.PDT_NUM, D.ODR_AMOUNT, D.ODR_PRICE, P.CG_NUM_2, P.CG_NUM_1, P.PDT_NAME, P.PDT_PRICE, P.PDT_DISCOUNT, P.PDT_COMPANY, P.PDT_DETAIL, P.PDT_IMG, P.PDT_IMG_FOLDER, P.PDT_AMOUNT, P.PDT_BUY, P.PDT_DATE_SUB, P.PDT_DATE_UP
FROM TBL_ORDER_DETAIL D
INNER JOIN TBL_PRODUCT P
ON D.PDT_NUM = P.PDT_NUM
WHERE D.ODR_CODE = 22;
