DROP TABLE ORDERS;
DROP TABLE NOTICES;
DROP TABLE SEATS;
DROP TABLE SEAT_PRICE;
DROP TABLE CONCERTS;
DROP TABLE COMMENTS;
DROP TABLE ARTISTS;
DROP TABLE MEMBERS;
DROP SEQUENCE MEMBERS_NO_SEQ;
DROP SEQUENCE ARTISTS_NO_SEQ;
DROP SEQUENCE COMMENTS_NO_SEQ;
DROP SEQUENCE CONCERTS_NO_SEQ;
DROP SEQUENCE NOTICES_NO_SEQ;
DROP SEQUENCE ORDERS_NO_SEQ;

CREATE TABLE MEMBERS
(
    NO NUMBER(10) CONSTRAINT PK_MEMBERS_NO NOT NULL UNIQUE,
    ID VARCHAR2(10) CONSTRAINT PK_MEMBERS_ID PRIMARY KEY,
    PW VARCHAR2(20) CONSTRAINT NN_MEMBERS_PW NOT NULL,
    NICKNAME VARCHAR2(10) CONSTRAINT NN_MEMBERS_NICKNAME NOT NULL,
    NAME VARCHAR2(30) CONSTRAINT NN_MEMBERS_NAME NOT NULL,
    BIRTHDATE DATE CONSTRAINT NN_MEMBERS_BIRTHDATE NOT NULL,
    SEX VARCHAR(5) CONSTRAINT NN_MEMBERS_SEX NOT NULL,
    ADDRESS VARCHAR2(100),
    PHONE VARCHAR2(30),
    AUTHORITY VARCHAR2(10) DEFAULT 'USER',
    WITHDRAWAL NUMBER(1),
    EMAIL VARCHAR2(100) CONSTRAINT NN_MEMBERS_EMAIL NOT NULL
);

CREATE TABLE ARTISTS(
    NO NUMBER(10) CONSTRAINT  NNU_ARTISTS_NO NOT NULL UNIQUE,
    NAME VARCHAR2(30) CONSTRAINT PK_ARTISTS_NAME PRIMARY KEY,
    CONTENT VARCHAR2(1000) CONSTRAINT NN_ARTISTS_CONTENT NOT NULL
);

CREATE TABLE COMMENTS(
    NO NUMBER(10) CONSTRAINT PK_COMMENTS_NO PRIMARY KEY,
    ARTIST VARCHAR2(30) CONSTRAINT NN_COMMENTS_ARTIST NOT NULL,
    ID VARCHAR2(10) CONSTRAINT NN_COMMENTS_ID NOT NULL,
    CONTENT VARCHAR2(1000) CONSTRAINT NN_COMMENTS_CONTENT NOT NULL,
    WDATE DATE CONSTRAINT NN_COMMENTS_DATE NOT NULL,
    CONSTRAINT FK_COMMENTS_ARTISTS FOREIGN KEY (ARTIST) REFERENCES ARTISTS(NAME),
    CONSTRAINT FK_COMMENTS_MEMBERS FOREIGN KEY (CONTENT) REFERENCES MEMBERS(ID)
);

CREATE TABLE CONCERTS(
    NO NUMBER(10) CONSTRAINT PK_CONCERTS_NO PRIMARY KEY,
    ARTIST VARCHAR2(30) CONSTRAINT NN_CONCERTS_ARTIST NOT NULL,
    CONTENT VARCHAR2(1000) CONSTRAINT NN_CONCERTS_CONTENT NOT NULL,
    CDATE DATE CONSTRAINT NN_CONCERTS_CDATE NOT NULL,
    CONSTRAINT FK_CONCERTS_ARTISTS FOREIGN KEY (ARTIST) REFERENCES ARTISTS(NAME)
);

CREATE TABLE SEAT_PRICE(
    CONCERT_NO NUMBER(10) CONSTRAINT NN_SEAT_PRICE_CONCERT_NO NOT NULL,
    CLASS VARCHAR(1) CONSTRAINT NN_SEAT_PRICE_CLASS NOT NULL,
    PRICE NUMBER(10) CONSTRAINT NN_SEAT_PRICE_PRICE NOT NULL,
    CONSTRAINT FK_SEAT_PRICE_CONCERTS FOREIGN KEY (CONCERT_NO) REFERENCES CONCERTS(NO)
);

CREATE TABLE SEATS(
    CONCERT_NO NUMBER(10) CONSTRAINT NN_SEATSCONCERT_NO NOT NULL,
    ID VARCHAR2(10) CONSTRAINT NN_SEATS_ID NOT NULL,
    CLASS VARCHAR2(1) CONSTRAINT NN_SEATS_CLASS NOT NULL,
    PRICE VARCHAR2(10) CONSTRAINT NN_SEATS_PRICE NOT NULL,
    NO VARCHAR2(5) CONSTRAINT NN_SEATS_NO NOT NULL,
    CONSTRAINT FK_SEATS_CONCERTS FOREIGN KEY (CONCERT_NO) REFERENCES CONCERTS(NO)
);

CREATE TABLE NOTICES(
    NO NUMBER(10) CONSTRAINT PK_NOTICES_NO PRIMARY KEY,
    TITLE VARCHAR2(30) CONSTRAINT NN_NOTICES_TITLE NOT NULL,
    CONTENT VARCHAR2(1000) CONSTRAINT NN_NOTICES_CONTENT NOT NULL,
    WDATE DATE CONSTRAINT NN_NOTICES_WDATE NOT NULL,
    WRITER VARCHAR2(10) CONSTRAINT NN_NOTICES_WRITER NOT NULL,
    VIEWS NUMBER(10) CONSTRAINT NN_NOTICES_VIEWS NOT NULL,
    CONSTRAINT FK_NOTICES_WRITER FOREIGN KEY (WRITER) REFERENCES MEMBERS(ID)
);

CREATE TABLE ORDERS(
    NO NUMBER(10) CONSTRAINT PK_ORDERS_NO PRIMARY KEY,
    ID VARCHAR2(10) CONSTRAINT NN_ORDERS_ID NOT NULL,
    CONCERTS_NO NUMBER(10) CONSTRAINT NN_ORDERS_CONCERTS_NO NOT NULL,
    SEATS_NO VARCHAR2(5) CONSTRAINT NN_ORDERS_SEATS_NO NOT NULL,
    CONSTRAINTS FK_ORDERS_MEMBERS FOREIGN KEY (ID) REFERENCES MEMBERS(ID),
    CONSTRAINTS FK_ORDERS_CONCERTS FOREIGN KEY (CONCERTS_NO) REFERENCES CONCERTS(NO)
);

-- 회원 번호 시퀀스 생성
CREATE SEQUENCE MEMBERS_NO_SEQ
START WITH 1 -- 1부터 시작
INCREMENT BY 1 -- 1씩 증가
CACHE 2; -- 메모리에 미리 올려 놓을 인덱스 개수. 비정상 종료되면 LAST_NUMBER가 2씩 증가

-- 아티스트 번호 시퀀스 생성
CREATE SEQUENCE ARTISTS_NO_SEQ
START WITH 1 -- 1부터 시작
INCREMENT BY 1 -- 1씩 증가
CACHE 2; -- 메모리에 미리 올려 놓을 인덱스 개수. 비정상 종료되면 LAST_NUMBER가 2씩 증가

-- 댓글 번호 시퀀스 생성
CREATE SEQUENCE COMMENTS_NO_SEQ
START WITH 1 -- 1부터 시작
INCREMENT BY 1 -- 1씩 증가
CACHE 2; -- 메모리에 미리 올려 놓을 인덱스 개수. 비정상 종료되면 LAST_NUMBER가 2씩 증가

-- 콘서트 번호 시퀀스 생성
CREATE SEQUENCE CONCERTS_NO_SEQ
START WITH 1 -- 1부터 시작
INCREMENT BY 1 -- 1씩 증가
CACHE 2; -- 메모리에 미리 올려 놓을 인덱스 개수. 비정상 종료되면 LAST_NUMBER가 2씩 증가

-- 공지사항 번호 시퀀스 생성
CREATE SEQUENCE NOTICES_NO_SEQ
START WITH 1 -- 1부터 시작
INCREMENT BY 1 -- 1씩 증가
CACHE 2; -- 메모리에 미리 올려 놓을 인덱스 개수. 비정상 종료되면 LAST_NUMBER가 2씩 증가

-- 주문 번호 시퀀스 생성
CREATE SEQUENCE ORDERS_NO_SEQ
START WITH 1 -- 1부터 시작
INCREMENT BY 1 -- 1씩 증가
CACHE 2; -- 메모리에 미리 올려 놓을 인덱스 개수. 비정상 종료되면 LAST_NUMBER가 2씩 증가

-- 시퀀스 확인
SELECT * FROM USER_SEQUENCES;

-- 계정 조회
SELECT * FROM MEMBERS;

-- 계정 생성
INSERT INTO MEMBERS VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'test', '1234', '테스트', '홍길동', SYSDATE, 'M', '서울시', '010-1234-5678', 'tester', 0, 'test@test.com');
INSERT INTO MEMBERS VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'hwisaek', '1234', 'hwisaek', '이창민', SYSDATE, 'M', '서울시', '010-0000-0000', 'tester', 0, 'hwisaek@hwisaek.com');

-- 로그인 기능
SELECT PW FROM MEMBERS WHERE ID='test';

-- 아이디 찾기
SELECT ID FROM MEMBERS WHERE NAME='홍길동' AND EMAIL=LOWER('test@test.com');

-- 비밀번호 찾기
SELECT PW FROM MEMBERS WHERE ID='test' AND NAME='홍길동' AND TO_CHAR(BIRTHDATE, 'YYYY-MM-DD')='2021-05-25' AND PHONE='010-1234-5678';

-- 공지사항 조회
SELECT * FROM NOTICES;

-- 공지사항 데이터 생성
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '안녕하세요', 'ㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇ', SYSDATE, 'test', 55);
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '공지사항1', '공지사항입니다~', SYSDATE, 'test', 59);
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '안녕하세요', 'ㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇ', SYSDATE, 'test', 55);
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '공지사항1', '공지사항입니다~', SYSDATE, 'test', 59);
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '안녕하세요', 'ㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇ', SYSDATE, 'test', 55);
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '공지사항1', '공지사항입니다~', SYSDATE, 'test', 59);
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '안녕하세요', 'ㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇ', SYSDATE, 'test', 55);
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '공지사항1', '공지사항입니다~', SYSDATE, 'test', 59);
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '안녕하세요', 'ㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇ', SYSDATE, 'test', 55);
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '공지사항1', '공지사항입니다~', SYSDATE, 'test', 59);
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '안녕하세요', 'ㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇ', SYSDATE, 'test', 55);
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '공지사항1', '공지사항입니다~', SYSDATE, 'test', 59);
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '안녕하세요', 'ㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇ', SYSDATE, 'test', 55);
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '공지사항1', '공지사항입니다~', SYSDATE, 'test', 59);
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '안녕하세요', 'ㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇ', SYSDATE, 'test', 55);
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '공지사항1', '공지사항입니다~', SYSDATE, 'test', 59);
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '안녕하세요', 'ㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇ', SYSDATE, 'test', 55);
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '공지사항1', '공지사항입니다~', SYSDATE, 'test', 59);
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '안녕하세요', 'ㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇ', SYSDATE, 'test', 55);
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '공지사항1', '공지사항입니다~', SYSDATE, 'test', 59);

-- 공지사항 상세정보 불러오기
SELECT NO, TITLE, CONTENT, WDATE, VIEWS FROM NOTICES WHERE NO = 1;
SELECT NO, TITLE, CONTENT, WDATE, VIEWS FROM NOTICES WHERE NO = 2;

-- 공지사항 리스트 페이징
SELECT NO, TITLE, WDATE, VIEWS
FROM ( SELECT ROWNUM AS RNO, NO, TITLE, WDATE, VIEWS
            FROM NOTICES
            WHERE ROWNUM <= 10 * 1
            ORDER BY NO DESC)
WHERE RNO > 10 * (1 - 1);

-- 공지사항 리스트 검색
SELECT NO, TITLE, WDATE, WRITER, VIEWS FROM NOTICES WHERE REGEXP_LIKE(TITLE, 'ㅎㅇ') OR REGEXP_LIKE(CONTENT, 'ㅎㅇ');
SELECT NO, TITLE, WDATE, WRITER, VIEWS FROM NOTICES WHERE REGEXP_LIKE(TITLE, '공지') OR REGEXP_LIKE(CONTENT, '공지');

COMMIT;