/*
�ۼ��� : ���ɱ�
������ : 2022-07-05
������Ʈ�� : ���θ�DEMO
*/

/* ���̺� ���� */
--1. ȸ������ ���̺�
CREATE TABLE TBL_MEMBER(
	MEM_ID					VARCHAR2(15)					    CONSTRAINT PK_MEM_ID PRIMARY KEY,
	MEM_NAME             	VARCHAR2(30)						NOT NULL,
	MEM_PW                 	VARCHAR2(60)						NOT NULL,
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
	MEM_AUTHCODE		    CHAR(1)         DEFAULT 'N'			NOT NULL
	-- MEM_SESSION_KEY	        VARCHAR2(50),
	-- MEM_SESSION_LIMIT	    TIMESTAMP
);

--2. ī�װ� ���̺�
CREATE TABLE TBL_CATEGORY (
    CG_CODE_C       			NUMBER        				PRIMARY KEY,
    CG_CODE_P     		        NUMBER,                                          
    CG_NAME           		    VARCHAR2(50)         		NOT NULL
);

--3. ��ǰ ���̺�
CREATE TABLE TBL_PRODUCT(
    PDT_NUM					NUMBER								CONSTRAINT PK_PDT_NUM PRIMARY KEY,
    CG_NUM_1                NUMBER,
    CG_NUM_2                NUMBER,
    PDT_NAME				VARCHAR2(50)						NOT NULL,
    PDT_PRICE				NUMBER								NOT NULL,
    PDT_DISCOUNT			NUMBER								NOT NULL,
    PDT_COMPANY			    VARCHAR2(30)						NOT NULL,
    PDT_DETAIL				VARCHAR2(4000)					    NOT NULL,
    PDT_IMG					VARCHAR2(50)						NOT NULL,
    PDT_AMOUNT			    NUMBER								NOT NULL,
    PDT_BUY					CHAR(1)								NOT NULL,
    PDT_DATE_SUB			DATE 								NOT NULL,
    PDT_DATE_UP			    DATE        DEFAULT SYSDATE			NOT NULL
);

--4. ��ٱ��� ���̺� 
CREATE TABLE TBL_CART(
	CART_CODE				NUMBER								PRIMARY KEY,			
	PDT_NUM				    NUMBER								NOT NULL,
	MEM_ID					VARCHAR2(20)						NOT NULL,
	CART_AMOUNT			    NUMBER								NOT NULL,
    FOREIGN KEY(PDT_NUM) REFERENCES TBL_PRODUCT(PDT_NUM),
    FOREIGN KEY(MEM_ID) REFERENCES TBL_MEMBER(MEM_ID)
);

--5. �ֹ� ���̺�
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
    FOREIGN KEY(MEM_ID) REFERENCES TBL_MEMBER(MEM_ID)
);

--6. �ֹ� �� ���̺�
CREATE TABLE TBL_ORDER_DETAIL(
	ODR_CODE				NUMBER							NOT NULL,
	PDT_NUM				    NUMBER							NOT NULL,
	ODR_AMOUNT			    NUMBER							NOT NULL,
	ODR_PRICE				NUMBER							NOT NULL,
	PRIMARY KEY (ODR_CODE, PDT_NUM),
    FOREIGN KEY(ODR_CODE) REFERENCES TBL_ORDER(ODR_CODE),
    FOREIGN KEY(PDT_NUM) REFERENCES TBL_PRODUCT(PDT_NUM)
);

--7. �Խ��� ���̺�
CREATE TABLE TBL_BOARD(
	BRD_NUM				    NUMBER							CONSTRAINT PK_BRD_NUM PRIMARY KEY,
	MEM_ID					VARCHAR2(15)					NOT NULL,
	BRD_TITLE				VARCHAR2(100)					NOT NULL,
	BRD_CONTENT			    VARCHAR2(4000)					NOT NULL,
	BRD_DATE_REG			DATE        DEFAULT SYSDATE		NOT NULL,
    FOREIGN KEY(MEM_ID) REFERENCES TBL_MEMBER(MEM_ID)
);

--8. ��ǰ�ı� ���̺� 
CREATE TABLE TBL_REVIEW(
	RV_NUM					NUMBER								CONSTRAINT PK_RV_NUM PRIMARY KEY,
	MEM_ID					VARCHAR2(50)						NOT NULL,
	PDT_NUM				    NUMBER								NOT NULL,
	RV_CONTENT			    VARCHAR2(200)						NOT NULL,
	RV_SCORE				NUMBER								NOT NULL,
	RV_DATE_REG			    DATE        DEFAULT SYSDATE			NOT NULL,
    FOREIGN KEY(MEM_ID) REFERENCES TBL_MEMBER(MEM_ID),
    FOREIGN KEY(PDT_NUM) REFERENCES TBL_PRODUCT(PDT_NUM)
);

--9. ������ �α��� ���̺�
CREATE TABLE TBL_ADMIN(
	ADMIN_ID				VARCHAR2(15)						PRIMARY KEY,
	ADMIN_PW				VARCHAR2(30)						NOT NULL,
	ADMIN_NAME			    VARCHAR2(15)						NOT NULL,
	ADMIN_DATE_LATE	        DATE        		                NOT NULL
);


/* ���̺� ��ȸ */
SELECT * FROM TBL_MEMBER;
SELECT * FROM TBL_CATEGORY;
SELECT * FROM TBL_PRODUCT;
SELECT * FROM TBL_CART;
SELECT * FROM TBL_ORDER;
SELECT * FROM TBL_ORDER_DETAIL;
SELECT * FROM TBL_BOARD;
SELECT * FROM TBL_REVIEW;


/* ���� ������ �Է� */
--1. ��� ���̺� 
INSERT INTO MEMBER_TBL(MEM_ID, MEM_NAME, MEM_PW, MEM_EMAIL, MEM_ZIPCODE, MEM_ADDR, MEM_ADDR_D, MEM_PHONE, MEM_NICK, MEM_ACCEPT_E ) 
	VALUES('user01', 'ȫ�浿', '1111', 'user01@example.com','13555', '����� ���α� â�ŵ�', '00����Ʈ 101��', '010-1111-1111', '����01', 'Y');
INSERT INTO MEMBER_TBL(MEM_ID, MEM_NAME, MEM_PW, MEM_EMAIL, MEM_ZIPCODE, MEM_ADDR, MEM_ADDR_D, MEM_PHONE, MEM_NICK, MEM_ACCEPT_E ) 
	VALUES('user02', '�̽¿�', '2222', 'user02@example.com','13555', '����� ���α� â�ŵ�', '00����Ʈ 102��', '010-2222-2222', '����02', 'Y');
INSERT INTO MEMBER_TBL(MEM_ID, MEM_NAME, MEM_PW, MEM_EMAIL, MEM_ZIPCODE, MEM_ADDR, MEM_ADDR_D, MEM_PHONE, MEM_NICK, MEM_ACCEPT_E ) 
	VALUES('user03', '�����', '3333', 'user03@example.com','13555', '����� ���α� â�ŵ�', '00����Ʈ 103��', '010-3333-3333', '����03', 'Y');
INSERT INTO MEMBER_TBL(MEM_ID, MEM_NAME, MEM_PW, MEM_EMAIL, MEM_ZIPCODE, MEM_ADDR, MEM_ADDR_D, MEM_PHONE, MEM_NICK, MEM_ACCEPT_E ) 
	VALUES('user04', '������', '4444', 'user04@example.com','13555', '����� ���α� â�ŵ�', '00����Ʈ 104��', '010-4444-4444', '����04', 'N');
INSERT INTO MEMBER_TBL(MEM_ID, MEM_NAME, MEM_PW, MEM_EMAIL, MEM_ZIPCODE, MEM_ADDR, MEM_ADDR_D, MEM_PHONE, MEM_NICK, MEM_ACCEPT_E ) 
	VALUES('user05', '����ȣ', '5555', 'user05@example.com','13555', '����� ���α� â�ŵ�', '00����Ʈ 105��', '010-5555-5555', '����05', 'N');

--2. ī�װ� ���̺�
INSERT INTO CATEGORY_TBL
	VALUES('1000', NULL, '����');
INSERT INTO CATEGORY_TBL
	VALUES('2000', NULL, '����');
INSERT INTO CATEGORY_TBL
	VALUES('3000', NULL, '�ƿ���');
INSERT INTO CATEGORY_TBL
	VALUES('7000', NULL, 'ACC');
INSERT INTO CATEGORY_TBL
	VALUES('1100', '1000', '����/���콺');
INSERT INTO CATEGORY_TBL
	VALUES('1200', '1000', '��Ʈ');
INSERT INTO CATEGORY_TBL
	VALUES('2100', '2000', 'û����');

--3. ��ǰ ���̺�
INSERT INTO PRODUCT_TBL(PDT_NUM, CG_CODE, PDT_NAME, PDT_PRICE, PDT_DISCOUNT, PDT_COMPANY, PDT_DETAIL, PDT_IMG, PDT_AMOUNT, PDT_BUY)
	VALUES(0001, '1100', '�⺻���콺', 30000, 10, 'A��', '��ǰ�Ұ�', '�̹���', 10000, 'Y'); 
INSERT INTO PRODUCT_TBL(PDT_NUM, CG_CODE, PDT_NAME, PDT_PRICE, PDT_DISCOUNT, PDT_COMPANY, PDT_DETAIL, PDT_IMG, PDT_AMOUNT, PDT_BUY)
	VALUES(0002, '1100', '�⺻����', 30000, 20, 'B��', '��ǰ�Ұ�', '�̹���', 10000, 'Y'); 
INSERT INTO PRODUCT_TBL(PDT_NUM, CG_CODE, PDT_NAME, PDT_PRICE, PDT_DISCOUNT, PDT_COMPANY, PDT_DETAIL, PDT_IMG, PDT_AMOUNT, PDT_BUY)
	VALUES(0003, '2100', '�⺻��û����', 50000, 30, 'B��', '��ǰ�Ұ�', '�̹���', 10000, 'Y'); 
INSERT INTO PRODUCT_TBL(PDT_NUM, CG_CODE, PDT_NAME, PDT_PRICE, PDT_DISCOUNT, PDT_COMPANY, PDT_DETAIL, PDT_IMG, PDT_AMOUNT, PDT_BUY)
	VALUES(0004, '2100', '�⺻��û����', 50000, 40, 'C��', '��ǰ�Ұ�', '�̹���', 10000, 'Y'); 
INSERT INTO PRODUCT_TBL(PDT_NUM, CG_CODE, PDT_NAME, PDT_PRICE, PDT_DISCOUNT, PDT_COMPANY, PDT_DETAIL, PDT_IMG, PDT_AMOUNT, PDT_BUY)
	VALUES(0005, '2100', '�⺻��û����', 70000, 50, 'C��', '��ǰ�Ұ�', '�̹���', 00000, 'N'); 
	
--4. ������ ���� �߰�
INSERT INTO ADMIN_TBL(admin_id, ADMIN_PW, ADMIN_NAME)
VALUES('admin', '1111', 'admin');


/* ������ ���� �� ���� */
-- 1-1. ��ǰ���̺�_��ǰ�ڵ� ������ ����
create sequence seq_pdt_num
start with 1
increment by 1;

-- 1-2. ������ ����
drop SEQUENCE seq_pdt_num;

-- 2-1. ��ٱ������̺�_��ٱ����ڵ� ������ ����
create sequence seq_cart_code
start with 1
increment by 1;

-- 2-2. ������ ����
drop SEQUENCE seq_cart_code;

-- 3-1. �ֹ����̺�_�ֹ��ڵ� ������ ����
create sequence seq_odr_code
start with 1
increment by 1;

--3-2. ������ ����
drop SEQUENCE seq_odr_code;

--4-1. �ֹ����̺�_�ֹ��ڵ� ������ ����
create sequence seq_rv_num
start with 1
increment by 1;

--4-2. ������ ����
drop SEQUENCE seq_rv_num;




-- ��ǰ�׽�Ʈ��loop(���� ������ ����)
declare
	v_cnt number := 0;
begin
	dbms_output.enable;
	
	loop
		insert into product_tbl(pdt_num, cg_code, pdt_name, pdt_price, pdt_discount, pdt_company,
			pdt_detail, pdt_img, 
			pdt_amount, pdt_buy, pdt_date_sub)
		values(seq_pdt_num.nextval, 9, '�׽�Ʈ��ǰ'||to_char(v_cnt), 10000, 10000, 'flower', 
			'ƫ��', '/2020/03/24/s_58c0d28f-c6d9-4bbe-8fd6-1b323328988d_Tulips.jpg',
			1000, 'Y', sysdate);
			
		v_cnt := v_cnt +1;
		
		exit when v_cnt>100;
	end loop;
	
	dbms_output.put_line('������ �Է� �Ϸ�!');
end;

-- ��ǰ���̺� ����
delete from product_tbl;


--  �ֹ����̺� ������ ��ǰ ���̺��� ���� ���ҽ�Ű�� Ʈ����
CREATE OR REPLACE TRIGGER trg_order 
   AFTER INSERT 
   ON order_detail_tbl
   FOR EACH ROW 
DECLARE
   v_odr_amount NUMBER;
   v_pdt_num NVARCHAR2(50);
BEGIN
   DBMS_OUTPUT.PUT_LINE('trg_order�� �����մϴ�.');
   -- ����ڰ� �Է��� ���� ������ v_orderAmount�� ����
   SELECT :NEW.odr_amount INTO v_odr_amount FROM DUAL;
   -- ����ڰ� ������ ��ǰ���� v_prodName�� ����
   SELECT :NEW.pdt_num INTO v_pdt_num FROM DUAL;
   -- �ֹ� ������ŭ ���� ����
   UPDATE product_tbl SET pdt_amount = pdt_amount - v_odr_amount 
       WHERE pdt_num = v_pdt_num ;
END;

-- Ŀ��
commit;
	
