DROP TABLE NOTICES CASCADE CONSTRAINTS;
DROP TABLE SEATS CASCADE CONSTRAINTS;
DROP TABLE ORDERS CASCADE CONSTRAINTS;
DROP TABLE CONCERTS CASCADE CONSTRAINTS;
DROP TABLE COMMENTS CASCADE CONSTRAINTS;
DROP TABLE ARTISTS CASCADE CONSTRAINTS;
DROP TABLE MEMBERS CASCADE CONSTRAINTS;
DROP SEQUENCE MEMBERS_NO_SEQ;
DROP SEQUENCE ARTISTS_NO_SEQ;
DROP SEQUENCE COMMENTS_NO_SEQ;
DROP SEQUENCE CONCERTS_NO_SEQ;
DROP SEQUENCE NOTICES_NO_SEQ;
DROP SEQUENCE ORDERS_NO_SEQ;


CREATE TABLE MEMBERS
( 제약조건 타입_테이블명_속성
    NO NUMBER(30) CONSTRAINT NN_MEMBERS_NO NOT NULL CONSTRAINT U_MEMBERS_NO UNIQUE, -- 회원 번호
    ID VARCHAR2(30) CONSTRAINT PK_MEMBERS_ID PRIMARY KEY, -- 아이디
    PW VARCHAR2(100) CONSTRAINT NN_MEMBERS_PW NOT NULL, -- 패스워드. 최소 32 바이트
    NICKNAME VARCHAR2(30) CONSTRAINT NN_MEMBERS_NICKNAME NOT NULL CONSTRAINT U_MEMBERS_NICKNAME UNIQUE, -- 닉네임
    FIRST_NAME VARCHAR2(30) CONSTRAINT NN_MEMBERS_FIRST_NAME NOT NULL, -- 이름
    LAST_NAME VARCHAR2(30) CONSTRAINT NN_MEMBERS_LAST_NAME NOT NULL, -- 성
    BIRTHDATE DATE CONSTRAINT NN_MEMBERS_BIRTHDATE NOT NULL, -- 생년월일
    SEX VARCHAR(30) CONSTRAINT NN_MEMBERS_SEX NOT NULL, -- 성별
    ADDRESS VARCHAR2(100), -- 주소
    PHONE VARCHAR2(30), -- 핸드폰 번호
    AUTHORITY VARCHAR2(30) DEFAULT 'USER', -- 권한. 관리자인지 아닌지 구분
    WITHDRAWAL NUMBER(30) DEFAULT 0, -- 탈퇴요청 여부
    EMAIL VARCHAR2(100) CONSTRAINT NN_MEMBERS_EMAIL NOT NULL, -- 이메일 주소
    EMAILHASH VARCHAR2(64), --이메일 인증 데이터
    EMAILCHECKED NUMBER(30) DEFAULT 0, -- 이메일 인증 여부
    SALT VARCHAR2(100) CONSTRAINT NN_MEMBERS_SALT NOT NULL, -- 암호화용 소금. 최소 32바이트
    IMG VARCHAR2(100), -- 사용자가 저장한 프로필 사진 이름
    SIMG VARCHAR2(100) -- 실제로 저장된 프로필 사진 이름
);

CREATE TABLE ARTISTS(
    NO NUMBER(10) CONSTRAINT  NNU_ARTISTS_NO NOT NULL UNIQUE, -- 아티스트 번호
    NAME VARCHAR2(30) CONSTRAINT PK_ARTISTS_NAME PRIMARY KEY, -- 아티스트 이름
    CONTENT VARCHAR2(2000) CONSTRAINT NN_ARTISTS_CONTENT NOT NULL, -- 아티스트 설명
    IMG VARCHAR2(100), -- 사용자가 보게될 파일 명
    SIMG  VARCHAR2(100)  -- 실제로 저장될 파일 명
);

CREATE TABLE COMMENTS(
    NO NUMBER(10) CONSTRAINT PK_COMMENTS_NO PRIMARY KEY, -- 댓글 번호
    ARTIST VARCHAR2(30) CONSTRAINT NN_COMMENTS_ARTIST NOT NULL, -- 작성된 아티스트 이름  
    ID VARCHAR2(10) CONSTRAINT NN_COMMENTS_ID NOT NULL, -- 작성자 ID
    CONTENT VARCHAR2(1000) CONSTRAINT NN_COMMENTS_CONTENT NOT NULL, -- 작성 내용
    WDATE DATE CONSTRAINT NN_COMMENTS_DATE NOT NULL, -- 작성일자
	REPORT NUMBER(4), -- 신고 수
	RECOMMEND NUMBER(4), -- 추천 수
    CONSTRAINT FK_COMMENTS_ARTISTS FOREIGN KEY (ARTIST) REFERENCES ARTISTS(NAME) ON DELETE CASCADE,
    CONSTRAINT FK_COMMENTS_MEMBERS FOREIGN KEY (ID) REFERENCES MEMBERS(ID) ON DELETE CASCADE
);

CREATE TABLE CONCERTS(
    NO NUMBER(10) CONSTRAINT PK_CONCERTS_NO PRIMARY KEY, -- 콘서트 번호
    ARTIST VARCHAR2(30) CONSTRAINT NN_CONCERTS_ARTIST NOT NULL, -- 공연 아티스트
    TITLE VARCHAR2(100) CONSTRAINT NN_CONCERTS_TITLE NOT NULL, -- 공연 제목
    CONTENT VARCHAR2(1000) CONSTRAINT NN_CONCERTS_CONTENT NOT NULL, -- 공연 내용
    CDATE DATE CONSTRAINT NN_CONCERTS_CDATE NOT NULL, -- 공연 일자
    LOCATION VARCHAR2(100) CONSTRAINT NN_CONCERTS_LOCATION NOT NULL, -- 공연 장소
    PRICE NUMBER(10) CONSTRAINT NN_CONCERTS_PRICE NOT NULL, -- 좌석 가격
    IMG VARCHAR2(100), -- 사용자가 보게될 파일 명
    SIMG  VARCHAR2(100),  -- 실제로 저장될 파일 명
    CONSTRAINT FK_CONCERTS_ARTISTS FOREIGN KEY (ARTIST) REFERENCES ARTISTS(NAME) ON DELETE CASCADE
);

CREATE TABLE NOTICES(
    NO NUMBER(10) CONSTRAINT PK_NOTICES_NO PRIMARY KEY, -- 공지사항 번호
    TITLE VARCHAR2(100) CONSTRAINT NN_NOTICES_TITLE NOT NULL, -- 공지사항 제목
    CONTENT VARCHAR2(1000) CONSTRAINT NN_NOTICES_CONTENT NOT NULL, -- 공지사항 내용
    WDATE DATE CONSTRAINT NN_NOTICES_WDATE NOT NULL, -- 작성 일자
    WRITER VARCHAR2(10) CONSTRAINT NN_NOTICES_WRITER NOT NULL, -- 작성자 ID
    VIEWS NUMBER(10) CONSTRAINT NN_NOTICES_VIEWS NOT NULL, -- 조회수
    TAG VARCHAR2(50), -- 관련 태그
    IMG VARCHAR2(100), -- 사용자가 보게될 파일 명
    SIMG  VARCHAR2(100),  -- 실제로 저장될 파일 명
    CONSTRAINT FK_NOTICES_WRITER FOREIGN KEY (WRITER) REFERENCES MEMBERS(ID) ON DELETE CASCADE
);

CREATE TABLE ORDERS(
    NO NUMBER(10) CONSTRAINT PK_ORDERS_NO PRIMARY KEY, -- 주문번호
    ID VARCHAR2(10) CONSTRAINT NN_ORDERS_ID NOT NULL, -- 주문한 ID
    CONCERTS_NO NUMBER(10) CONSTRAINT NN_ORDERS_CONCERTS_NO NOT NULL, -- 예매한 콘서트 번호 
    CONSTRAINTS FK_ORDERS_MEMBERS FOREIGN KEY (ID) REFERENCES MEMBERS(ID) ON DELETE CASCADE,
    CONSTRAINTS FK_ORDERS_CONCERTS FOREIGN KEY (CONCERTS_NO) REFERENCES CONCERTS(NO) ON DELETE CASCADE
);

CREATE TABLE SEATS(
    CONCERT_NO NUMBER(10) CONSTRAINT NN_SEATSCONCERT_NO NOT NULL, -- 공연 번호
    SEAT_NO VARCHAR2(5) CONSTRAINT NN_SEATS_NO NOT NULL, -- 좌석 번호
    ID VARCHAR2(10) CONSTRAINT NN_SEATS_ID NOT NULL, -- 예매한 유저 ID
	ORDER_NO NUMBER(10) CONSTRAINT NN_SEATS_ORDER_NO NOT NULL, -- 예매한 주문 번호
    CONSTRAINT PK_SEATS_CNO_SNO PRIMARY KEY (CONCERT_NO, SEAT_NO),
    CONSTRAINT FK_SEATS_CONCERTS FOREIGN KEY (CONCERT_NO) REFERENCES CONCERTS(NO) ON DELETE CASCADE,
	CONSTRAINT FK_SEATS_ORDERS FOREIGN KEY (ORDER_NO) REFERENCES ORDERS(NO) ON DELETE CASCADE,
    CONSTRAINT FK_SEATS_MEMBERS FOREIGN KEY (ID) REFERENCES MEMBERS(ID) ON DELETE CASCADE
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

-- 계정 생성. 비밀번호는 전부 '1234'
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, AUTHORITY, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'admin', 'nqiMHz8o0DrAyEjRTgwPyYG12qYVI1RouVaB6wWVfC8=', '관리자', '창민', '이', '1999-01-01', 'M', '경기도 파주시 장단면 노상리 577-3', '010-7434-3843', 'admin', 'admin@sist.com', 'yxccdaAqrh+dv+yg/t2VWH23vz0Rww1RCnnx7E09y/E=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'test', 'WzPAa8lrvYwTcwdTIQKVUg3g0F9oj9mIey0gajbrS+k=', '테스트계정', '창민', '이', '1998-02-18', 'M', '경기도 구리시 구리광산 1번갱도', '010-1234-5678', 'test@sist.com',  'bcy3ehzp6a/R9KGdApnU9HSqQ+/0npPZkyVxBbwr2Rg=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'hwisaek', 'DDEh0SixNG+nMDo3F1vWouqhTCpgcj4dF4xKR0bz2hg=', '휘색', '창민', '이', '1997-03-18', 'M', '경기도 의정부시 의정부부대찌개거리 2길 32', '010-1234-5678', 'test@sist.com',  'g35VZHww8TBXkJVU9UXtMwPdiP73B7OHmAejCJ7B7C4=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'TEST1', 'rfiMAptX8sOQPS/tRaqbeCWBCXWLsPHSRR5gcOV8vho=', 'TESTNICK', '창민', '이', '1996-04-28', 'F', '서울시 강동구 천호동 현대백화점 12층 빕스', '010-6422-5329', 'hwisaek@sist.com', 'Z+2PytZTnbjPCBD9uDFjfBzkYoEXNZm7/ZaoxydJ0uQ=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'TEST2', 's2kd/PliEGMG5iU0FdPy4851N8QGFmLzL8o17JtWxD8=', 'test2', '창민', '이', '1995-05-28', 'F', '서울시 강서구 방화동 534-43', '010-4522-1093', 'hwisaek@sist.com', 'iexqy4YcUd3uvKHV/TyNMKVMfWPmeuEYrkMcBmQzqVk=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'TEST3', 'm1hzjU2jxojvziyYE8mlmojY/FkF3adXV+sLWOq1JZc=', 'test3', '창민', '이', '1994-06-28', 'F', '서울시 서초구 반포본동 자이아파트', '010-1245-3542', 'hwisaek@sist.com', 'QR51BCAxvBKmY1xlltYlJWL7ED3ZZw+tpJ1A+0NRBho=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'TEST4', 'vV1zaZ+Z57B0i2ZIzlPSCs6PIQX+r+lJBVarQeTY18Y=', 'test4', '창민', '이', '1993-07-28', 'F', '서울시 송파구 롯데 시그니엘 레지던스 98층', '010-5363-2389', 'hwisaek@sist.com', 'GKaL6qIfnwWLkFhGs+4WA4N49F+yxgNCMugAZujTLi4=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'TEST5', 'S5a/BZAykkuYd0rSsbZKZkmHc6AS1Xhi97shW2Vd5UE=', 'test5', '창민', '이', '1992-08-28', 'F', '서울시 동작구 상도동', '010-4353-1235', 'hwisaek@sist.com', '1CFO/N7HEuGtRUWiixreJ17+tGF8UIBNya/goO9lBCc=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'qqqqq', 'xYRBf3GRcyM5Pwb0ZjdbdGLfCQwAu6nX9pKPZEteNMc=', 'qqq', '흥식', '김', '1998-09-28', 'F', '서울시 저기 어딘가 괜찮은 동네', '010-5463-9243', 'qqqq@sist.com', 'r3BYNv2IrKj+37d/aoNqwJTA8HzLlKNgYZasADReG9E=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'asdasd', 'A+dDolPUj0jq0IPCSsO1kn/FwC97ozflckao6GZYYRE=', 'asd', '아아', '김', '1997-11-28', 'M', '강원도 횡성군 둔내면 자포곡리 산523', '010-2435-3563', 'qqqq@sist.com', '/7CBTadjSiEGDHnDTTHETpTzrVRt4gVC+h4pOwmdALU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'zxc', 'y65N833stcoUJz3VV+QD9Yyo3RuCOMiNEK/H8Byp/gs=', 'zxc', '흥수', '박', '1987-12-28', 'F', '충청북도 제천시 한수면 송계리 산115-2', '010-6452-6422', 'qqqq@sist.com', 'ugJHb2x5Os91GoyjJ4+o8pPyvZRZ4bEVJPJLaVZoCsk=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'aaa', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', 'aaa', '민숙', '이', '1983-02-28', 'F', '전라북도 완주군 구이면 덕천리 148-8', '010-4672-8734', 'qqqq@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'abc123', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', 'abc123', '홍', '길동', '1970-03-20', 'M', '서울시 강남구 테헤란로 한독약품빌딩', '010-1234-5678', 'abc123@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'dlckdals', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '최강창민', '이', '창민', '1987-09-11', 'M', '경기도 고양시 벽제동 벽제아파트', '010-1123-1234', 'dlckdals@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'rkdwlstmf', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '믹키진슬', '강', '진슬', '1994-05-03', 'F', '제주도 제주시 제주동 제주로 12길 43', '010-5234-8934', 'rkdwlstmf@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'ghdwnstn', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '시아준수', '홍', '준수', '2001-01-09', 'M', '경상남도 거창군 가북면 용산리 산90', '010-4589-1298', 'ghdwnstn@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'wnehdtjd', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '영웅동성', '주', '동성', '1999-10-30', 'M', '전라남도 구례군 토지면 내동리 산30-1', '010-2377-3592', 'wnehdtjd@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'rnwldnjs', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '유노지원', '구', '지원', '1984-08-28', 'F', '부산시 해운대구 마린시티 1001동 2003호', '010-3452-4289', 'rnwldnjs@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'wkawkfl32', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '닉네임', '홍', '중학', '1950-02-15', 'M', '경상남도 하동군 하동읍 신기리 74-4', '010-5334-5252', 'abc124@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'rkddnjsehcorh', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '마라탕', '홍', '길동', '1950-03-14', 'F', '제주특별자치도 제주시 조천읍 선흘리 1834-18', '010-5292-3524', 'google@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'nic', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '마린', '김', '다현', '1950-04-13', 'M', '경상북도 봉화군 춘양면 우구치리 산1-19', '010-5292-3462', 'navsd@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'fuzsefin', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '저글링', '이', '쯔위', '1950-05-12', 'F', '전라북도 장수군 장계면 월강리 486', '010-1429-6547', 'naver@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'maboro', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '메딕', '박', '모모', '1950-06-11', 'M', '충청북도 단양군 가곡면 사평리 산1-1', '010-1249-8252', 'daum@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'kazix', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '배틀크루저', '최', '사나', '1950-07-10', 'F', '충청북도 단양군 가곡면 대대리 375', '010-7465-9283', 'kakao@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'zed', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '캐리어', '홍', '채연', '1950-08-09', 'M', '경상북도 봉화군 명호면 관창리 산60-1', '010-5246-9529', 'coupang@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'sona', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '골리앗', '진', '다미', '1950-09-08', 'F', '경상북도 김천시 농소면 연명리 315', '010-2456-3462', 'sist@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'catlen', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '시즈탱크', '김', '정석', '1950-10-07', 'M', '전라북도 김제시 황산면 남산리 산62-1', '010-5234-9353', 'koreait@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'Kotlin', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '울트라리스크', '이', '승헌', '1950-11-06', 'F', '경상북도 상주시 화동면 양지리 산45-1', '010-1514-5299', 'kinggod@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'swift', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '디아블로', '박', '원빈', '1950-12-05', 'M', '충청북도 제천시 봉양읍 구학리 산87', '010-8255-5356', 'showmethemoney@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'golang', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '바알', '김', '인성', '1950-01-11', 'F', '강원도 춘천시 동면 상걸리 산53', '010-1485-3569', 'protoss@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'clang', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '메피스토', '이', '보검', '1950-02-23', 'M', '강원도 정선군 신동읍 운치리 산259-1', '010-3241-1999', 'zerg@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'python', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '가렌', '이', '은둥', '1950-03-11', 'F', '경상북도 영양군 일월면 가천리 산15-3', '010-2994-1941', 'teran@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'java', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '갱플랭크', '박', '과인', '1950-04-21', 'M', '경상북도 경산시 남천면 협석리 산71-2', '010-8488-1485', 'starcraft@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'book', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '갈리오', '강', '오늘', '1950-06-18', 'F', '부산광역시 동구 좌천동 860-5', '010-3523-9343', 'blizzard@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'elderscroll', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '럭스', '조', '까치', '1950-07-07', 'M', '경상남도 김해시 상동면 여차리 산157', '010-4253-9145', 'battle@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'skyrim', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '이즈리얼', '주', '은이', '1950-08-06', 'F', '경상남도 합천군 삼가면 외토리 627-2', '010-5664-1245', 'diablo1@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'fusroda', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '룰루', '윤', '약돌', '1950-09-05', 'M', '경상남도 함양군 수동면 화산리 산68', '010-2912-5293', 'diablo2@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'nicebeef', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '소나임', '장', '누미', '1950-10-04', 'F', '경상북도 성주군 선남면 신부리 642-1', '010-1313-1045', 'diablo3@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'goodrice', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '제드', '한', '재롱', '1950-11-03', 'M', '경상북도 안동시 임동면 위리 산27-2', '010-2324-2592', 'diabloimmotal@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'register', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '카사딘', '임', '태기', '1950-12-02', 'F', '전라북도 진안군 상전면 수동리 산1', '010-5536-3952', 'darksoul1@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'authentic', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '카직스', '오', '튼튼', '1950-01-01', 'M', '전라북도 진안군 상전면 용평리 782', '010-9495-9349', 'darksoul2@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'wkrurwmd', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '질리언', '신', '진가', '1950-02-15', 'F', '충청북도 옥천군 이원면 건진리 산2', '010-2941-9634', 'darksoul3@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'sprhksrl', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '루난', '서', '일아', '1950-03-28', 'M', '충청북도 충주시 동량면 조동리 산10', '010-1345-1491', 'demonssoul@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'wjdqhrl', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '발헤임', '권', '해자', '1950-04-27', 'F', '서울특별시 동대문구 휘경동 319-42', '010-1339-9141', 'lux@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'wjdcjrl', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '레오나', '황', '타미', '1950-05-26', 'M', '서울특별시 관악구 신림동 1694', '010-1303-2349', 'garen@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'mysql', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '다이애나', '안', '지게', '1950-06-25', 'F', '인천광역시 남동구 운연동 106-7', '010-2239-2233', 'gangplank@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'plsql', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '타곤', '송', '달려', '1950-07-24', 'M', '인천광역시 남동구 논현동 661-3', '010-4556-5285', 'malzaha@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'oracle', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '신성', '류', '일나', '1950-08-23', 'F', '인천광역시 계양구 다남동 산65-1', '010-5664-1492', 'kasadin@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'myname', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '바드', '전', '매일', '1950-09-22', 'M', '경기도 파주시 조리읍 능안리 1657', '010-4634-9142', 'dffsf231@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'adminis', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '주드로', '고', '그만', '1950-10-21', 'F', '경기도 양주시 백석읍 홍죽리 산95', '010-9694-5143', 'zergling@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'jangchen', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '고문', '문', '리공', '1950-11-20', 'M', '경기도 동두천시 생연동 555-12', '010-9938-1646', 'zealot@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'eocpdjswpdi', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '앨리스', '양', '육칠', '1950-12-19', 'F', '경상북도 예천군 유천면 화지리 산17', '010-8375-8546', 'marin@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'dPqlrns', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '썬콜법사', '손', '드름', '1950-01-01', 'M', '전라북도 익산시 망성면 무형리 1724-3', '010-7734-6745', 'firebat@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'k2a1', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '강남미인', '배', '소리', '1950-02-18', 'F', '충청남도 부여군 장암면 정암리 561', '010-4565-2415', 'medic@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'm16', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '야나두', '조', '여운', '1950-03-17', 'M', '경상남도 산청군 생초면 노은리 산32-1', '010-4366-2144', 'mutal@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'army', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '야너두', '백', '브이', '1950-04-16', 'F', '경기도 평택시 팽성읍 대사리 232-6', '010-3425-7445', 'ultrarisk@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'roka', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '야우리두', '허', '레미', '1950-05-15', 'M', '서울특별시 마포구 도화동 357', '010-5666-9184', 'cursair@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'rok', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '야너희두', '우', '길해', '1950-06-14', 'F', '서울특별시 서대문구 북아현동 1016', '010-5234-4693', 'gigabyte@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'ofkorea', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '스커지', '남', '길학', '1950-07-13', 'M', '서울특별시 마포구 아현동 662-1', '010-4253-9534', 'megabox@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'republic', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '가디언', '심', '길순', '1950-08-12', 'F', '서울특별시 중구 장충동2가 산14-21', '010-2341-7368', 'samsung@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'seoul', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '디바우러', '노', '고다', '1950-09-11', 'M', '서울특별시 중구 신당동 254-16', '010-9395-5643', 'jang@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'bomb', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '발키리', '정', '최고', '1950-10-10', 'F', '서울특별시 성북구 안암동5가 126-28', '010-9523-1245', 'kim@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'threecusion', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '아이언맨', '하', '신중', '1950-11-09', 'M', '서울특별시 동대문구 이문동 225', '010-4423-9464', 'lee@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'mutal', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '토르', '곽', '방울', '1950-12-08', 'F', '서울특별시 중랑구 묵동 122-12', '010-4235-2590', 'park@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'yamatocanon', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '닥터스트랭지', '성', '김치', '1950-01-07', 'M', '경기도 가평군 북면 화악리 산282', '010-5664-2389', 'jun@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'battlecrusier', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '타노스', '차', '호등', '1950-02-06', 'F', '경기도 이천시 모가면 두미리 421-24', '010-5043-3452', 'goliat@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'marincontrol', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '타타타', '주', '귀녀', '1950-03-05', 'M', '강원도 평창군 대화면 하안미리 산681-2', '010-9439-6354', 'tank@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'tmzjwlEp', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '차타자', '우', '귀남', '1950-04-04', 'F', '충청북도 단양군 매포읍 안동리 150', '010-8842-2535', 'valkiry@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'qjdzj', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '책걸상', '구', '추양', '1950-05-03', 'M', '전라북도 남원시 광치동 683', '010-7324-2413', 'covid19@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'drpajswkru', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '금수저', '신', '유령', '1950-06-02', 'F', '전라북도 남원시 금지면 귀석리 75-111', '010-8582-2314', 'china@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');
INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'rlarPfksdlek', 'QFdA7WJ0TbjkbECahAtTiGaVkc0ApRfX/77uWbsHr30=', '은수저', '임', '태산', '1950-07-01', 'M', '전라남도 곡성군 죽곡면 유봉리 산75', '010-9142-2144', 'korea@sist.com', 'mD0l8KV+237pWZuoUlC0q5peabes7ByYs4DEUfd7egU=');

--관리자 계정 콘서트 예매 사용 가능하도록 이메일체크 1로 변경
UPDATE MEMBERS SET EMAILCHECKED=1 WHERE ID='admin';

-- 로그인 기능
SELECT PW FROM MEMBERS WHERE ID='test';

-- 아이디 찾기
SELECT ID FROM MEMBERS WHERE LOWER(FIRST_NAME) = LOWER('길동') AND LOWER(LAST_NAME) = LOWER('홍') AND LOWER(EMAIL) = LOWER('test@sist.com');

-- 비밀번호 찾기
SELECT PW FROM MEMBERS WHERE ID='test' AND FIRST_NAME='길동' AND LAST_NAME='홍' AND TO_CHAR(BIRTHDATE, 'YYYY-MM-DD')='2021-02-02' AND PHONE='010-9999-9999';

-- 비밀번호 초기화
UPDATE MEMBERS SET PW = '1234', SALT = '22' WHERE ID = 'test' AND LOWER(FIRST_NAME) = LOWER('창민') AND LOWER(LAST_NAME) = LOWER('이') AND TO_CHAR(BIRTHDATE, 'YYYY-MM-DD') = '2020-02-02' AND PHONE = '010-9999-9999';

-- SALT 가져오기
SELECT SALT FROM MEMBERS WHERE ID = 'test';

-- 프로필 보기
SELECT NO,ID,NICKNAME,FIRST_NAME, LAST_NAME,TO_CHAR(BIRTHDATE, 'YYYY-MM-DD') AS BIRTHDATE,SEX,ADDRESS,PHONE,EMAIL FROM MEMBERS WHERE ID='test';

-- 프로필 보기 - 최근 예매날짜 포함
SELECT NO, ID, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, CDATE, IMG, SIMG
FROM (SELECT NO,ID,NICKNAME,FIRST_NAME, LAST_NAME,TO_CHAR(BIRTHDATE, 'YYYY-MM-DD') AS BIRTHDATE,SEX,ADDRESS,PHONE,EMAIL, IMG, SIMG
          FROM MEMBERS 
          WHERE ID='admin') A
          LEFT OUTER JOIN
          (SELECT ID, TO_CHAR(MAX(CDATE), 'YYYY-MM-DD') CDATE
          FROM ORDERS O JOIN CONCERTS C ON O.CONCERTS_NO = C.NO
          WHERE O.ID = 'admin'
          GROUP BY O.ID) B
          USING(ID);


-- 프로필 변경하기
UPDATE MEMBERS SET NICKNAME='아이디수정', ADDRESS='경기도', BIRTHDATE=TO_DATE('2020-02-02', 'YYYY-MM-DD'), PHONE='010-9999-9999' WHERE ID='test';

-- 닉네임 중복 확인
SELECT COUNT(NICKNAME) FROM MEMBERS WHERE LOWER(NICKNAME)=LOWER('test');

-- 회원탈퇴 신청
UPDATE MEMBERS SET WITHDRAWAL=1 WHERE ID='test';
UPDATE MEMBERS SET WITHDRAWAL=1 WHERE ID='hwisaek';

-- 회원탈퇴 요청을 했는지 확인
SELECT WITHDRAWAL FROM MEMBERS WHERE ID = 'test';

-- 회원탈퇴 취소
UPDATE MEMBERS SET WITHDRAWAL = 0 WHERE ID = 'hwisaek';

-- 공지사항 조회
SELECT * FROM NOTICES;

-- 공지사항 데이터 생성
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '10cm 대전 콘서트 예매 일정 안내', '안녕하세요, 10cm 콘서트 담당팀입니다.<div><br></div><div>2021년 4월 3일 토요일 19:30 ~ 22:00, 2021년 4월 4일 일요일 19:30 ~ 22:00에 진행될 10cm 대전 콘서트 예매가 오는 2021년 3월 3일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>감사합니다.</div>', to_date('2021-03-01 11:0', 'yyyy-mm-dd hh24:mi'), 'admin', 304, '10cm');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '사이트 정기 점검 안내', '안녕하세요, 콘서트 사이트 운영팀입니다.<div><br></div><div>오는 2021년 3월 4일 수요일 19:00 02:00 ~ 05:00에 사이트 점검이 있을 예정입니다.</div><div><br></div><div>사이트 이용에 불편을 드려 죄송합니다.</div>', to_date('2021-03-02 11:2', 'yyyy-mm-dd hh24:mi'), 'admin', 221, '점검');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '10cm 대전 콘서트 추가 예매 일정 안내', '안녕하세요, 10cm 콘서트 담당팀입니다.<div><br></div><div>2021년 4월 10일 토요일 19:30 ~ 22:00, 2021년 4월 11일 일요일 19:30 ~ 22:00에 진행될 10cm 대전 콘서트 추가 예매가 오는 2021년 3월 10일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>일정에 착오가 없으시기를 바랍니다. 감사합니다.</div>', to_date('2021-03-08 11:7', 'yyyy-mm-dd hh24:mi'), 'admin', 461, '10cm');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, 'IU 대구 콘서트 예매 일정 안내', '안녕하세요, IU 콘서트 담당팀입니다.<div><br></div><div>2021년 4월 10일 토요일 19:30 ~ 22:00, 2021년 4월 11일 일요일 19:30 ~ 22:00에 진행될 IU 대구 콘서트 예매가 오는 2021년 3월 10일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>감사합니다.</div>', to_date('2021-03-08 11:11', 'yyyy-mm-dd hh24:mi'), 'admin', 492, 'IU');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '사이트 정기 점검 안내', '안녕하세요, 콘서트 사이트 운영팀입니다.<div><br></div><div>오는 2021년 3월 11일 수요일 19:00 02:00 ~ 05:00에 사이트 점검이 있을 예정입니다.</div><div><br></div><div>사이트 이용에 불편을 드려 죄송합니다.</div>', to_date('2021-03-09 11:11', 'yyyy-mm-dd hh24:mi'), 'admin', 289, '점검');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, 'IU 대구 콘서트 추가 예매 일정 안내', '안녕하세요, IU 콘서트 담당팀입니다.<div><br></div><div>2021년 4월 17일 토요일 19:30 ~ 22:00, 2021년 4월 18일 일요일 19:30 ~ 22:00에 진행될 IU 대구 콘서트 추가 예매가 오는 2021년 3월 17일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>일정에 착오가 없으시기를 바랍니다. 감사합니다.</div>', to_date('2021-03-15 11:0', 'yyyy-mm-dd hh24:mi'), 'admin', 594, 'IU');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '잔나비 울산 콘서트 예매 일정 안내', '안녕하세요, 잔나비 콘서트 담당팀입니다.<div><br></div><div>2021년 4월 17일 토요일 19:30 ~ 22:00, 2021년 4월 18일 일요일 19:30 ~ 22:00에 진행될 잔나비 울산 콘서트 예매가 오는 2021년 3월 17일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>감사합니다.</div>', to_date('2021-03-15 11:1', 'yyyy-mm-dd hh24:mi'), 'admin', 248, '잔나비');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '사이트 정기 점검 안내', '안녕하세요, 콘서트 사이트 운영팀입니다.<div><br></div><div>오는 2021년 3월 18일 수요일 19:00 02:00 ~ 05:00에 사이트 점검이 있을 예정입니다.</div><div><br></div><div>사이트 이용에 불편을 드려 죄송합니다.</div>', to_date('2021-03-16 11:2', 'yyyy-mm-dd hh24:mi'), 'admin', 416, '점검');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '잔나비 울산 콘서트 추가 예매 일정 안내', '안녕하세요, 잔나비 콘서트 담당팀입니다.<div><br></div><div>2021년 4월 24일 토요일 19:30 ~ 22:00, 2021년 4월 25일 일요일 19:30 ~ 22:00에 진행될 잔나비 울산 콘서트 추가 예매가 오는 2021년 3월 24일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>일정에 착오가 없으시기를 바랍니다. 감사합니다.</div>', to_date('2021-03-22 11:12', 'yyyy-mm-dd hh24:mi'), 'admin', 336, '잔나비');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '잔나비 대전 콘서트 예매 일정 안내', '안녕하세요, 잔나비 콘서트 담당팀입니다.<div><br></div><div>2021년 4월 24일 토요일 19:30 ~ 22:00, 2021년 4월 25일 일요일 19:30 ~ 22:00에 진행될 잔나비 대전 콘서트 예매가 오는 2021년 3월 24일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>감사합니다.</div>', to_date('2021-03-22 11:3', 'yyyy-mm-dd hh24:mi'), 'admin', 330, '잔나비');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '사이트 정기 점검 안내', '안녕하세요, 콘서트 사이트 운영팀입니다.<div><br></div><div>오는 2021년 3월 25일 수요일 19:00 02:00 ~ 05:00에 사이트 점검이 있을 예정입니다.</div><div><br></div><div>사이트 이용에 불편을 드려 죄송합니다.</div>', to_date('2021-03-23 11:8', 'yyyy-mm-dd hh24:mi'), 'admin', 393, '점검');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '잔나비 대전 콘서트 추가 예매 일정 안내', '안녕하세요, 잔나비 콘서트 담당팀입니다.<div><br></div><div>2021년 5월 1일 토요일 19:30 ~ 22:00, 2021년 5월 2일 일요일 19:30 ~ 22:00에 진행될 잔나비 대전 콘서트 추가 예매가 오는 2021년 3월 31일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>일정에 착오가 없으시기를 바랍니다. 감사합니다.</div>', to_date('2021-03-29 11:10', 'yyyy-mm-dd hh24:mi'), 'admin', 536, '잔나비');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '현아 대구 콘서트 예매 일정 안내', '안녕하세요, 현아 콘서트 담당팀입니다.<div><br></div><div>2021년 5월 1일 토요일 19:30 ~ 22:00, 2021년 5월 2일 일요일 19:30 ~ 22:00에 진행될 현아 대구 콘서트 예매가 오는 2021년 3월 31일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>감사합니다.</div>', to_date('2021-03-29 11:4', 'yyyy-mm-dd hh24:mi'), 'admin', 649, '현아');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '사이트 정기 점검 안내', '안녕하세요, 콘서트 사이트 운영팀입니다.<div><br></div><div>오는 2021년 4월 1일 수요일 19:00 02:00 ~ 05:00에 사이트 점검이 있을 예정입니다.</div><div><br></div><div>사이트 이용에 불편을 드려 죄송합니다.</div>', to_date('2021-03-30 11:11', 'yyyy-mm-dd hh24:mi'), 'admin', 268, '점검');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '현아 대구 콘서트 추가 예매 일정 안내', '안녕하세요, 현아 콘서트 담당팀입니다.<div><br></div><div>2021년 5월 8일 토요일 19:30 ~ 22:00, 2021년 5월 9일 일요일 19:30 ~ 22:00에 진행될 현아 대구 콘서트 추가 예매가 오는 2021년 4월 7일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>일정에 착오가 없으시기를 바랍니다. 감사합니다.</div>', to_date('2021-04-05 11:6', 'yyyy-mm-dd hh24:mi'), 'admin', 345, '현아');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '10cm 대구 콘서트 예매 일정 안내', '안녕하세요, 10cm 콘서트 담당팀입니다.<div><br></div><div>2021년 5월 8일 토요일 19:30 ~ 22:00, 2021년 5월 9일 일요일 19:30 ~ 22:00에 진행될 10cm 대구 콘서트 예매가 오는 2021년 4월 7일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>감사합니다.</div>', to_date('2021-04-05 11:5', 'yyyy-mm-dd hh24:mi'), 'admin', 462, '10cm');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '사이트 정기 점검 안내', '안녕하세요, 콘서트 사이트 운영팀입니다.<div><br></div><div>오는 2021년 4월 8일 수요일 19:00 02:00 ~ 05:00에 사이트 점검이 있을 예정입니다.</div><div><br></div><div>사이트 이용에 불편을 드려 죄송합니다.</div>', to_date('2021-04-06 11:10', 'yyyy-mm-dd hh24:mi'), 'admin', 698, '점검');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '10cm 대구 콘서트 추가 예매 일정 안내', '안녕하세요, 10cm 콘서트 담당팀입니다.<div><br></div><div>2021년 5월 15일 토요일 19:30 ~ 22:00, 2021년 5월 16일 일요일 19:30 ~ 22:00에 진행될 10cm 대구 콘서트 추가 예매가 오는 2021년 4월 14일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>일정에 착오가 없으시기를 바랍니다. 감사합니다.</div>', to_date('2021-04-12 11:4', 'yyyy-mm-dd hh24:mi'), 'admin', 695, '10cm');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '장범준 대전 콘서트 예매 일정 안내', '안녕하세요, 장범준 콘서트 담당팀입니다.<div><br></div><div>2021년 5월 15일 토요일 19:30 ~ 22:00, 2021년 5월 16일 일요일 19:30 ~ 22:00에 진행될 장범준 대전 콘서트 예매가 오는 2021년 4월 14일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>감사합니다.</div>', to_date('2021-04-12 11:2', 'yyyy-mm-dd hh24:mi'), 'admin', 608, '장범준');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '사이트 정기 점검 안내', '안녕하세요, 콘서트 사이트 운영팀입니다.<div><br></div><div>오는 2021년 4월 15일 수요일 19:00 02:00 ~ 05:00에 사이트 점검이 있을 예정입니다.</div><div><br></div><div>사이트 이용에 불편을 드려 죄송합니다.</div>', to_date('2021-04-13 11:2', 'yyyy-mm-dd hh24:mi'), 'admin', 563, '점검');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '장범준 대전 콘서트 추가 예매 일정 안내', '안녕하세요, 장범준 콘서트 담당팀입니다.<div><br></div><div>2021년 5월 22일 토요일 19:30 ~ 22:00, 2021년 5월 23일 일요일 19:30 ~ 22:00에 진행될 장범준 대전 콘서트 추가 예매가 오는 2021년 4월 21일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>일정에 착오가 없으시기를 바랍니다. 감사합니다.</div>', to_date('2021-04-19 11:13', 'yyyy-mm-dd hh24:mi'), 'admin', 618, '장범준');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '장범준 대구 콘서트 예매 일정 안내', '안녕하세요, 장범준 콘서트 담당팀입니다.<div><br></div><div>2021년 5월 22일 토요일 19:30 ~ 22:00, 2021년 5월 23일 일요일 19:30 ~ 22:00에 진행될 장범준 대구 콘서트 예매가 오는 2021년 4월 21일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>감사합니다.</div>', to_date('2021-04-19 11:5', 'yyyy-mm-dd hh24:mi'), 'admin', 564, '장범준');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '사이트 정기 점검 안내', '안녕하세요, 콘서트 사이트 운영팀입니다.<div><br></div><div>오는 2021년 4월 22일 수요일 19:00 02:00 ~ 05:00에 사이트 점검이 있을 예정입니다.</div><div><br></div><div>사이트 이용에 불편을 드려 죄송합니다.</div>', to_date('2021-04-20 11:9', 'yyyy-mm-dd hh24:mi'), 'admin', 476, '점검');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '장범준 대구 콘서트 추가 예매 일정 안내', '안녕하세요, 장범준 콘서트 담당팀입니다.<div><br></div><div>2021년 5월 29일 토요일 19:30 ~ 22:00, 2021년 5월 30일 일요일 19:30 ~ 22:00에 진행될 장범준 대구 콘서트 추가 예매가 오는 2021년 4월 28일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>일정에 착오가 없으시기를 바랍니다. 감사합니다.</div>', to_date('2021-04-26 11:1', 'yyyy-mm-dd hh24:mi'), 'admin', 594, '장범준');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '잔나비 광주 콘서트 예매 일정 안내', '안녕하세요, 잔나비 콘서트 담당팀입니다.<div><br></div><div>2021년 5월 29일 토요일 19:30 ~ 22:00, 2021년 5월 30일 일요일 19:30 ~ 22:00에 진행될 잔나비 광주 콘서트 예매가 오는 2021년 4월 28일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>감사합니다.</div>', to_date('2021-04-26 11:5', 'yyyy-mm-dd hh24:mi'), 'admin', 317, '잔나비');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '사이트 정기 점검 안내', '안녕하세요, 콘서트 사이트 운영팀입니다.<div><br></div><div>오는 2021년 4월 29일 수요일 19:00 02:00 ~ 05:00에 사이트 점검이 있을 예정입니다.</div><div><br></div><div>사이트 이용에 불편을 드려 죄송합니다.</div>', to_date('2021-04-27 11:13', 'yyyy-mm-dd hh24:mi'), 'admin', 574, '점검');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '잔나비 광주 콘서트 추가 예매 일정 안내', '안녕하세요, 잔나비 콘서트 담당팀입니다.<div><br></div><div>2021년 6월 5일 토요일 19:30 ~ 22:00, 2021년 6월 6일 일요일 19:30 ~ 22:00에 진행될 잔나비 광주 콘서트 추가 예매가 오는 2021년 5월 5일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>일정에 착오가 없으시기를 바랍니다. 감사합니다.</div>', to_date('2021-05-03 11:4', 'yyyy-mm-dd hh24:mi'), 'admin', 458, '잔나비');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '현아 대전 콘서트 예매 일정 안내', '안녕하세요, 현아 콘서트 담당팀입니다.<div><br></div><div>2021년 6월 5일 토요일 19:30 ~ 22:00, 2021년 6월 6일 일요일 19:30 ~ 22:00에 진행될 현아 대전 콘서트 예매가 오는 2021년 5월 5일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>감사합니다.</div>', to_date('2021-05-03 11:8', 'yyyy-mm-dd hh24:mi'), 'admin', 695, '현아');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '사이트 정기 점검 안내', '안녕하세요, 콘서트 사이트 운영팀입니다.<div><br></div><div>오는 2021년 5월 6일 수요일 19:00 02:00 ~ 05:00에 사이트 점검이 있을 예정입니다.</div><div><br></div><div>사이트 이용에 불편을 드려 죄송합니다.</div>', to_date('2021-05-04 11:2', 'yyyy-mm-dd hh24:mi'), 'admin', 251, '점검');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '현아 대전 콘서트 추가 예매 일정 안내', '안녕하세요, 현아 콘서트 담당팀입니다.<div><br></div><div>2021년 6월 12일 토요일 19:30 ~ 22:00, 2021년 6월 13일 일요일 19:30 ~ 22:00에 진행될 현아 대전 콘서트 추가 예매가 오는 2021년 5월 12일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>일정에 착오가 없으시기를 바랍니다. 감사합니다.</div>', to_date('2021-05-10 11:2', 'yyyy-mm-dd hh24:mi'), 'admin', 692, '현아');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, 'IU 서울 콘서트 예매 일정 안내', '안녕하세요, IU 콘서트 담당팀입니다.<div><br></div><div>2021년 6월 12일 토요일 19:30 ~ 22:00, 2021년 6월 13일 일요일 19:30 ~ 22:00에 진행될 IU 서울 콘서트 예매가 오는 2021년 5월 12일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>감사합니다.</div>', to_date('2021-05-10 11:12', 'yyyy-mm-dd hh24:mi'), 'admin', 606, 'IU');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '사이트 정기 점검 안내', '안녕하세요, 콘서트 사이트 운영팀입니다.<div><br></div><div>오는 2021년 5월 13일 수요일 19:00 02:00 ~ 05:00에 사이트 점검이 있을 예정입니다.</div><div><br></div><div>사이트 이용에 불편을 드려 죄송합니다.</div>', to_date('2021-05-11 11:1', 'yyyy-mm-dd hh24:mi'), 'admin', 558, '점검');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, 'IU 서울 콘서트 추가 예매 일정 안내', '안녕하세요, IU 콘서트 담당팀입니다.<div><br></div><div>2021년 6월 19일 토요일 19:30 ~ 22:00, 2021년 6월 20일 일요일 19:30 ~ 22:00에 진행될 IU 서울 콘서트 추가 예매가 오는 2021년 5월 19일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>일정에 착오가 없으시기를 바랍니다. 감사합니다.</div>', to_date('2021-05-17 11:1', 'yyyy-mm-dd hh24:mi'), 'admin', 216, 'IU');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '장범준 광주 콘서트 예매 일정 안내', '안녕하세요, 장범준 콘서트 담당팀입니다.<div><br></div><div>2021년 6월 19일 토요일 19:30 ~ 22:00, 2021년 6월 20일 일요일 19:30 ~ 22:00에 진행될 장범준 광주 콘서트 예매가 오는 2021년 5월 19일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>감사합니다.</div>', to_date('2021-05-17 11:10', 'yyyy-mm-dd hh24:mi'), 'admin', 699, '장범준');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '사이트 정기 점검 안내', '안녕하세요, 콘서트 사이트 운영팀입니다.<div><br></div><div>오는 2021년 5월 20일 수요일 19:00 02:00 ~ 05:00에 사이트 점검이 있을 예정입니다.</div><div><br></div><div>사이트 이용에 불편을 드려 죄송합니다.</div>', to_date('2021-05-18 11:12', 'yyyy-mm-dd hh24:mi'), 'admin', 346, '점검');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '장범준 광주 콘서트 추가 예매 일정 안내', '안녕하세요, 장범준 콘서트 담당팀입니다.<div><br></div><div>2021년 6월 26일 토요일 19:30 ~ 22:00, 2021년 6월 27일 일요일 19:30 ~ 22:00에 진행될 장범준 광주 콘서트 추가 예매가 오는 2021년 5월 26일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>일정에 착오가 없으시기를 바랍니다. 감사합니다.</div>', to_date('2021-05-24 11:13', 'yyyy-mm-dd hh24:mi'), 'admin', 323, '장범준');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, 'IU 인천 콘서트 예매 일정 안내', '안녕하세요, IU 콘서트 담당팀입니다.<div><br></div><div>2021년 6월 26일 토요일 19:30 ~ 22:00, 2021년 6월 27일 일요일 19:30 ~ 22:00에 진행될 IU 인천 콘서트 예매가 오는 2021년 5월 26일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>감사합니다.</div>', to_date('2021-05-24 11:14', 'yyyy-mm-dd hh24:mi'), 'admin', 542, 'IU');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '사이트 정기 점검 안내', '안녕하세요, 콘서트 사이트 운영팀입니다.<div><br></div><div>오는 2021년 5월 27일 수요일 19:00 02:00 ~ 05:00에 사이트 점검이 있을 예정입니다.</div><div><br></div><div>사이트 이용에 불편을 드려 죄송합니다.</div>', to_date('2021-05-25 11:12', 'yyyy-mm-dd hh24:mi'), 'admin', 529, '점검');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, 'IU 인천 콘서트 추가 예매 일정 안내', '안녕하세요, IU 콘서트 담당팀입니다.<div><br></div><div>2021년 7월 3일 토요일 19:30 ~ 22:00, 2021년 7월 4일 일요일 19:30 ~ 22:00에 진행될 IU 인천 콘서트 추가 예매가 오는 2021년 6월 2일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>일정에 착오가 없으시기를 바랍니다. 감사합니다.</div>', to_date('2021-05-31 11:12', 'yyyy-mm-dd hh24:mi'), 'admin', 689, 'IU');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '장범준 인천 콘서트 예매 일정 안내', '안녕하세요, 장범준 콘서트 담당팀입니다.<div><br></div><div>2021년 7월 3일 토요일 19:30 ~ 22:00, 2021년 7월 4일 일요일 19:30 ~ 22:00에 진행될 장범준 인천 콘서트 예매가 오는 2021년 6월 2일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>감사합니다.</div>', to_date('2021-05-31 11:1', 'yyyy-mm-dd hh24:mi'), 'admin', 494, '장범준');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '사이트 정기 점검 안내', '안녕하세요, 콘서트 사이트 운영팀입니다.<div><br></div><div>오는 2021년 6월 3일 수요일 19:00 02:00 ~ 05:00에 사이트 점검이 있을 예정입니다.</div><div><br></div><div>사이트 이용에 불편을 드려 죄송합니다.</div>', to_date('2021-06-01 11:11', 'yyyy-mm-dd hh24:mi'), 'admin', 592, '점검');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '장범준 인천 콘서트 추가 예매 일정 안내', '안녕하세요, 장범준 콘서트 담당팀입니다.<div><br></div><div>2021년 7월 10일 토요일 19:30 ~ 22:00, 2021년 7월 11일 일요일 19:30 ~ 22:00에 진행될 장범준 인천 콘서트 추가 예매가 오는 2021년 6월 9일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>일정에 착오가 없으시기를 바랍니다. 감사합니다.</div>', to_date('2021-06-07 11:2', 'yyyy-mm-dd hh24:mi'), 'admin', 380, '장범준');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '10cm 울산 콘서트 예매 일정 안내', '안녕하세요, 10cm 콘서트 담당팀입니다.<div><br></div><div>2021년 7월 10일 토요일 19:30 ~ 22:00, 2021년 7월 11일 일요일 19:30 ~ 22:00에 진행될 10cm 울산 콘서트 예매가 오는 2021년 6월 9일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>감사합니다.</div>', to_date('2021-06-07 11:3', 'yyyy-mm-dd hh24:mi'), 'admin', 325, '10cm');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '사이트 정기 점검 안내', '안녕하세요, 콘서트 사이트 운영팀입니다.<div><br></div><div>오는 2021년 6월 10일 수요일 19:00 02:00 ~ 05:00에 사이트 점검이 있을 예정입니다.</div><div><br></div><div>사이트 이용에 불편을 드려 죄송합니다.</div>', to_date('2021-06-08 11:13', 'yyyy-mm-dd hh24:mi'), 'admin', 273, '점검');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '10cm 울산 콘서트 추가 예매 일정 안내', '안녕하세요, 10cm 콘서트 담당팀입니다.<div><br></div><div>2021년 7월 17일 토요일 19:30 ~ 22:00, 2021년 7월 18일 일요일 19:30 ~ 22:00에 진행될 10cm 울산 콘서트 추가 예매가 오는 2021년 6월 16일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>일정에 착오가 없으시기를 바랍니다. 감사합니다.</div>', to_date('2021-06-14 11:10', 'yyyy-mm-dd hh24:mi'), 'admin', 428, '10cm');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '현아 광주 콘서트 예매 일정 안내', '안녕하세요, 현아 콘서트 담당팀입니다.<div><br></div><div>2021년 7월 17일 토요일 19:30 ~ 22:00, 2021년 7월 18일 일요일 19:30 ~ 22:00에 진행될 현아 광주 콘서트 예매가 오는 2021년 6월 16일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>감사합니다.</div>', to_date('2021-06-14 11:12', 'yyyy-mm-dd hh24:mi'), 'admin', 225, '현아');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '사이트 정기 점검 안내', '안녕하세요, 콘서트 사이트 운영팀입니다.<div><br></div><div>오는 2021년 6월 17일 수요일 19:00 02:00 ~ 05:00에 사이트 점검이 있을 예정입니다.</div><div><br></div><div>사이트 이용에 불편을 드려 죄송합니다.</div>', to_date('2021-06-15 11:8', 'yyyy-mm-dd hh24:mi'), 'admin', 398, '점검');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '현아 광주 콘서트 추가 예매 일정 안내', '안녕하세요, 현아 콘서트 담당팀입니다.<div><br></div><div>2021년 7월 24일 토요일 19:30 ~ 22:00, 2021년 7월 25일 일요일 19:30 ~ 22:00에 진행될 현아 광주 콘서트 추가 예매가 오는 2021년 6월 23일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>일정에 착오가 없으시기를 바랍니다. 감사합니다.</div>', to_date('2021-06-21 11:10', 'yyyy-mm-dd hh24:mi'), 'admin', 551, '현아');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '장범준 울산 콘서트 예매 일정 안내', '안녕하세요, 장범준 콘서트 담당팀입니다.<div><br></div><div>2021년 7월 24일 토요일 19:30 ~ 22:00, 2021년 7월 25일 일요일 19:30 ~ 22:00에 진행될 장범준 울산 콘서트 예매가 오는 2021년 6월 23일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>감사합니다.</div>', to_date('2021-06-21 11:14', 'yyyy-mm-dd hh24:mi'), 'admin', 340, '장범준');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '사이트 정기 점검 안내', '안녕하세요, 콘서트 사이트 운영팀입니다.<div><br></div><div>오는 2021년 6월 24일 수요일 19:00 02:00 ~ 05:00에 사이트 점검이 있을 예정입니다.</div><div><br></div><div>사이트 이용에 불편을 드려 죄송합니다.</div>', to_date('2021-06-22 11:14', 'yyyy-mm-dd hh24:mi'), 'admin', 354, '점검');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '장범준 울산 콘서트 추가 예매 일정 안내', '안녕하세요, 장범준 콘서트 담당팀입니다.<div><br></div><div>2021년 7월 31일 토요일 19:30 ~ 22:00, 2021년 8월 1일 일요일 19:30 ~ 22:00에 진행될 장범준 울산 콘서트 추가 예매가 오는 2021년 6월 30일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>일정에 착오가 없으시기를 바랍니다. 감사합니다.</div>', to_date('2021-06-28 11:4', 'yyyy-mm-dd hh24:mi'), 'admin', 611, '장범준');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '10cm 인천 콘서트 예매 일정 안내', '안녕하세요, 10cm 콘서트 담당팀입니다.<div><br></div><div>2021년 7월 31일 토요일 19:30 ~ 22:00, 2021년 8월 1일 일요일 19:30 ~ 22:00에 진행될 10cm 인천 콘서트 예매가 오는 2021년 6월 30일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>감사합니다.</div>', to_date('2021-06-28 11:14', 'yyyy-mm-dd hh24:mi'), 'admin', 401, '10cm');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '10cm 인천 콘서트 추가 예매 일정 안내', '안녕하세요, 10cm 콘서트 담당팀입니다.<div><br></div><div>2021년 8월 7일 토요일 19:30 ~ 22:00, 2021년 8월 8일 일요일 19:30 ~ 22:00에 진행될 10cm 인천 콘서트 추가 예매가 오는 2021년 7월 7일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>일정에 착오가 없으시기를 바랍니다. 감사합니다.</div>', to_date('2021-07-05 11:1', 'yyyy-mm-dd hh24:mi'), 'admin', 263, '10cm');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, 'IU 광주 콘서트 예매 일정 안내', '안녕하세요, IU 콘서트 담당팀입니다.<div><br></div><div>2021년 8월 7일 토요일 19:30 ~ 22:00, 2021년 8월 8일 일요일 19:30 ~ 22:00에 진행될 IU 광주 콘서트 예매가 오는 2021년 7월 7일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>감사합니다.</div>', to_date('2021-07-05 11:12', 'yyyy-mm-dd hh24:mi'), 'admin', 585, 'IU');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, 'IU 광주 콘서트 추가 예매 일정 안내', '안녕하세요, IU 콘서트 담당팀입니다.<div><br></div><div>2021년 8월 14일 토요일 19:30 ~ 22:00, 2021년 8월 15일 일요일 19:30 ~ 22:00에 진행될 IU 광주 콘서트 추가 예매가 오는 2021년 7월 14일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>일정에 착오가 없으시기를 바랍니다. 감사합니다.</div>', to_date('2021-07-12 11:11', 'yyyy-mm-dd hh24:mi'), 'admin', 574, 'IU');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '현아 울산 콘서트 예매 일정 안내', '안녕하세요, 현아 콘서트 담당팀입니다.<div><br></div><div>2021년 8월 14일 토요일 19:30 ~ 22:00, 2021년 8월 15일 일요일 19:30 ~ 22:00에 진행될 현아 울산 콘서트 예매가 오는 2021년 7월 14일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>감사합니다.</div>', to_date('2021-07-12 11:4', 'yyyy-mm-dd hh24:mi'), 'admin', 521, '현아');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '현아 울산 콘서트 추가 예매 일정 안내', '안녕하세요, 현아 콘서트 담당팀입니다.<div><br></div><div>2021년 8월 21일 토요일 19:30 ~ 22:00, 2021년 8월 22일 일요일 19:30 ~ 22:00에 진행될 현아 울산 콘서트 추가 예매가 오는 2021년 7월 21일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>일정에 착오가 없으시기를 바랍니다. 감사합니다.</div>', to_date('2021-07-19 11:13', 'yyyy-mm-dd hh24:mi'), 'admin', 307, '현아');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '장범준 서울 콘서트 예매 일정 안내', '안녕하세요, 장범준 콘서트 담당팀입니다.<div><br></div><div>2021년 8월 21일 토요일 19:30 ~ 22:00, 2021년 8월 22일 일요일 19:30 ~ 22:00에 진행될 장범준 서울 콘서트 예매가 오는 2021년 7월 21일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>감사합니다.</div>', to_date('2021-07-19 11:13', 'yyyy-mm-dd hh24:mi'), 'admin', 459, '장범준');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '장범준 서울 콘서트 추가 예매 일정 안내', '안녕하세요, 장범준 콘서트 담당팀입니다.<div><br></div><div>2021년 8월 28일 토요일 19:30 ~ 22:00, 2021년 8월 29일 일요일 19:30 ~ 22:00에 진행될 장범준 서울 콘서트 추가 예매가 오는 2021년 7월 28일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>일정에 착오가 없으시기를 바랍니다. 감사합니다.</div>', to_date('2021-07-26 11:6', 'yyyy-mm-dd hh24:mi'), 'admin', 399, '장범준');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '10cm 부산 콘서트 예매 일정 안내', '안녕하세요, 10cm 콘서트 담당팀입니다.<div><br></div><div>2021년 8월 28일 토요일 19:30 ~ 22:00, 2021년 8월 29일 일요일 19:30 ~ 22:00에 진행될 10cm 부산 콘서트 예매가 오는 2021년 7월 28일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>감사합니다.</div>', to_date('2021-07-26 11:8', 'yyyy-mm-dd hh24:mi'), 'admin', 610, '10cm');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '10cm 부산 콘서트 추가 예매 일정 안내', '안녕하세요, 10cm 콘서트 담당팀입니다.<div><br></div><div>2021년 9월 4일 토요일 19:30 ~ 22:00, 2021년 9월 5일 일요일 19:30 ~ 22:00에 진행될 10cm 부산 콘서트 추가 예매가 오는 2021년 8월 4일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>일정에 착오가 없으시기를 바랍니다. 감사합니다.</div>', to_date('2021-08-02 11:13', 'yyyy-mm-dd hh24:mi'), 'admin', 426, '10cm');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '잔나비 부산 콘서트 예매 일정 안내', '안녕하세요, 잔나비 콘서트 담당팀입니다.<div><br></div><div>2021년 9월 4일 토요일 19:30 ~ 22:00, 2021년 9월 5일 일요일 19:30 ~ 22:00에 진행될 잔나비 부산 콘서트 예매가 오는 2021년 8월 4일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>감사합니다.</div>', to_date('2021-08-02 11:7', 'yyyy-mm-dd hh24:mi'), 'admin', 275, '잔나비');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '잔나비 부산 콘서트 추가 예매 일정 안내', '안녕하세요, 잔나비 콘서트 담당팀입니다.<div><br></div><div>2021년 9월 11일 토요일 19:30 ~ 22:00, 2021년 9월 12일 일요일 19:30 ~ 22:00에 진행될 잔나비 부산 콘서트 추가 예매가 오는 2021년 8월 11일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>일정에 착오가 없으시기를 바랍니다. 감사합니다.</div>', to_date('2021-08-09 11:2', 'yyyy-mm-dd hh24:mi'), 'admin', 264, '잔나비');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '10cm 서울 콘서트 예매 일정 안내', '안녕하세요, 10cm 콘서트 담당팀입니다.<div><br></div><div>2021년 9월 11일 토요일 19:30 ~ 22:00, 2021년 9월 12일 일요일 19:30 ~ 22:00에 진행될 10cm 서울 콘서트 예매가 오는 2021년 8월 11일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>감사합니다.</div>', to_date('2021-08-09 11:3', 'yyyy-mm-dd hh24:mi'), 'admin', 477, '10cm');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '10cm 서울 콘서트 추가 예매 일정 안내', '안녕하세요, 10cm 콘서트 담당팀입니다.<div><br></div><div>2021년 9월 18일 토요일 19:30 ~ 22:00, 2021년 9월 19일 일요일 19:30 ~ 22:00에 진행될 10cm 서울 콘서트 추가 예매가 오는 2021년 8월 18일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>일정에 착오가 없으시기를 바랍니다. 감사합니다.</div>', to_date('2021-08-16 11:7', 'yyyy-mm-dd hh24:mi'), 'admin', 204, '10cm');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '잔나비 대구 콘서트 예매 일정 안내', '안녕하세요, 잔나비 콘서트 담당팀입니다.<div><br></div><div>2021년 9월 18일 토요일 19:30 ~ 22:00, 2021년 9월 19일 일요일 19:30 ~ 22:00에 진행될 잔나비 대구 콘서트 예매가 오는 2021년 8월 18일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>감사합니다.</div>', to_date('2021-08-16 11:0', 'yyyy-mm-dd hh24:mi'), 'admin', 261, '잔나비');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '잔나비 대구 콘서트 추가 예매 일정 안내', '안녕하세요, 잔나비 콘서트 담당팀입니다.<div><br></div><div>2021년 9월 25일 토요일 19:30 ~ 22:00, 2021년 9월 26일 일요일 19:30 ~ 22:00에 진행될 잔나비 대구 콘서트 추가 예매가 오는 2021년 8월 25일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>일정에 착오가 없으시기를 바랍니다. 감사합니다.</div>', to_date('2021-08-23 11:10', 'yyyy-mm-dd hh24:mi'), 'admin', 346, '잔나비');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, 'IU 부산 콘서트 예매 일정 안내', '안녕하세요, IU 콘서트 담당팀입니다.<div><br></div><div>2021년 9월 25일 토요일 19:30 ~ 22:00, 2021년 9월 26일 일요일 19:30 ~ 22:00에 진행될 IU 부산 콘서트 예매가 오는 2021년 8월 25일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>감사합니다.</div>', to_date('2021-08-23 11:14', 'yyyy-mm-dd hh24:mi'), 'admin', 413, 'IU');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, 'IU 부산 콘서트 추가 예매 일정 안내', '안녕하세요, IU 콘서트 담당팀입니다.<div><br></div><div>2021년 10월 2일 토요일 19:30 ~ 22:00, 2021년 10월 3일 일요일 19:30 ~ 22:00에 진행될 IU 부산 콘서트 추가 예매가 오는 2021년 9월 1일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>일정에 착오가 없으시기를 바랍니다. 감사합니다.</div>', to_date('2021-08-30 11:3', 'yyyy-mm-dd hh24:mi'), 'admin', 466, 'IU');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '잔나비 서울 콘서트 예매 일정 안내', '안녕하세요, 잔나비 콘서트 담당팀입니다.<div><br></div><div>2021년 10월 2일 토요일 19:30 ~ 22:00, 2021년 10월 3일 일요일 19:30 ~ 22:00에 진행될 잔나비 서울 콘서트 예매가 오는 2021년 9월 1일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>감사합니다.</div>', to_date('2021-08-30 11:3', 'yyyy-mm-dd hh24:mi'), 'admin', 668, '잔나비');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '잔나비 서울 콘서트 추가 예매 일정 안내', '안녕하세요, 잔나비 콘서트 담당팀입니다.<div><br></div><div>2021년 10월 9일 토요일 19:30 ~ 22:00, 2021년 10월 10일 일요일 19:30 ~ 22:00에 진행될 잔나비 서울 콘서트 추가 예매가 오는 2021년 9월 8일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>일정에 착오가 없으시기를 바랍니다. 감사합니다.</div>', to_date('2021-09-06 11:5', 'yyyy-mm-dd hh24:mi'), 'admin', 574, '잔나비');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '현아 인천 콘서트 예매 일정 안내', '안녕하세요, 현아 콘서트 담당팀입니다.<div><br></div><div>2021년 10월 9일 토요일 19:30 ~ 22:00, 2021년 10월 10일 일요일 19:30 ~ 22:00에 진행될 현아 인천 콘서트 예매가 오는 2021년 9월 8일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>감사합니다.</div>', to_date('2021-09-06 11:3', 'yyyy-mm-dd hh24:mi'), 'admin', 283, '현아');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '현아 인천 콘서트 추가 예매 일정 안내', '안녕하세요, 현아 콘서트 담당팀입니다.<div><br></div><div>2021년 10월 16일 토요일 19:30 ~ 22:00, 2021년 10월 17일 일요일 19:30 ~ 22:00에 진행될 현아 인천 콘서트 추가 예매가 오는 2021년 9월 15일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>일정에 착오가 없으시기를 바랍니다. 감사합니다.</div>', to_date('2021-09-13 11:13', 'yyyy-mm-dd hh24:mi'), 'admin', 397, '현아');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '10cm 광주 콘서트 예매 일정 안내', '안녕하세요, 10cm 콘서트 담당팀입니다.<div><br></div><div>2021년 10월 16일 토요일 19:30 ~ 22:00, 2021년 10월 17일 일요일 19:30 ~ 22:00에 진행될 10cm 광주 콘서트 예매가 오는 2021년 9월 15일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>감사합니다.</div>', to_date('2021-09-13 11:9', 'yyyy-mm-dd hh24:mi'), 'admin', 662, '10cm');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '10cm 광주 콘서트 추가 예매 일정 안내', '안녕하세요, 10cm 콘서트 담당팀입니다.<div><br></div><div>2021년 10월 23일 토요일 19:30 ~ 22:00, 2021년 10월 24일 일요일 19:30 ~ 22:00에 진행될 10cm 광주 콘서트 추가 예매가 오는 2021년 9월 22일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>일정에 착오가 없으시기를 바랍니다. 감사합니다.</div>', to_date('2021-09-20 11:14', 'yyyy-mm-dd hh24:mi'), 'admin', 326, '10cm');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '잔나비 인천 콘서트 예매 일정 안내', '안녕하세요, 잔나비 콘서트 담당팀입니다.<div><br></div><div>2021년 10월 23일 토요일 19:30 ~ 22:00, 2021년 10월 24일 일요일 19:30 ~ 22:00에 진행될 잔나비 인천 콘서트 예매가 오는 2021년 9월 22일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>감사합니다.</div>', to_date('2021-09-20 11:2', 'yyyy-mm-dd hh24:mi'), 'admin', 217, '잔나비');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '잔나비 인천 콘서트 추가 예매 일정 안내', '안녕하세요, 잔나비 콘서트 담당팀입니다.<div><br></div><div>2021년 10월 30일 토요일 19:30 ~ 22:00, 2021년 10월 31일 일요일 19:30 ~ 22:00에 진행될 잔나비 인천 콘서트 추가 예매가 오는 2021년 9월 29일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>일정에 착오가 없으시기를 바랍니다. 감사합니다.</div>', to_date('2021-09-27 11:7', 'yyyy-mm-dd hh24:mi'), 'admin', 583, '잔나비');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, 'IU 대전 콘서트 예매 일정 안내', '안녕하세요, IU 콘서트 담당팀입니다.<div><br></div><div>2021년 10월 30일 토요일 19:30 ~ 22:00, 2021년 10월 31일 일요일 19:30 ~ 22:00에 진행될 IU 대전 콘서트 예매가 오는 2021년 9월 29일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>감사합니다.</div>', to_date('2021-09-27 11:9', 'yyyy-mm-dd hh24:mi'), 'admin', 602, 'IU');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, 'IU 대전 콘서트 추가 예매 일정 안내', '안녕하세요, IU 콘서트 담당팀입니다.<div><br></div><div>2021년 11월 6일 토요일 19:30 ~ 22:00, 2021년 11월 7일 일요일 19:30 ~ 22:00에 진행될 IU 대전 콘서트 추가 예매가 오는 2021년 10월 6일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>일정에 착오가 없으시기를 바랍니다. 감사합니다.</div>', to_date('2021-10-04 11:3', 'yyyy-mm-dd hh24:mi'), 'admin', 324, 'IU');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '장범준 부산 콘서트 예매 일정 안내', '안녕하세요, 장범준 콘서트 담당팀입니다.<div><br></div><div>2021년 11월 6일 토요일 19:30 ~ 22:00, 2021년 11월 7일 일요일 19:30 ~ 22:00에 진행될 장범준 부산 콘서트 예매가 오는 2021년 10월 6일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>감사합니다.</div>', to_date('2021-10-04 11:6', 'yyyy-mm-dd hh24:mi'), 'admin', 630, '장범준');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '장범준 부산 콘서트 추가 예매 일정 안내', '안녕하세요, 장범준 콘서트 담당팀입니다.<div><br></div><div>2021년 11월 13일 토요일 19:30 ~ 22:00, 2021년 11월 14일 일요일 19:30 ~ 22:00에 진행될 장범준 부산 콘서트 추가 예매가 오는 2021년 10월 13일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>일정에 착오가 없으시기를 바랍니다. 감사합니다.</div>', to_date('2021-10-11 11:4', 'yyyy-mm-dd hh24:mi'), 'admin', 462, '장범준');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '현아 서울 콘서트 예매 일정 안내', '안녕하세요, 현아 콘서트 담당팀입니다.<div><br></div><div>2021년 11월 13일 토요일 19:30 ~ 22:00, 2021년 11월 14일 일요일 19:30 ~ 22:00에 진행될 현아 서울 콘서트 예매가 오는 2021년 10월 13일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>감사합니다.</div>', to_date('2021-10-11 11:12', 'yyyy-mm-dd hh24:mi'), 'admin', 350, '현아');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '현아 서울 콘서트 추가 예매 일정 안내', '안녕하세요, 현아 콘서트 담당팀입니다.<div><br></div><div>2021년 11월 20일 토요일 19:30 ~ 22:00, 2021년 11월 21일 일요일 19:30 ~ 22:00에 진행될 현아 서울 콘서트 추가 예매가 오는 2021년 10월 20일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>일정에 착오가 없으시기를 바랍니다. 감사합니다.</div>', to_date('2021-10-18 11:5', 'yyyy-mm-dd hh24:mi'), 'admin', 500, '현아');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '현아 부산 콘서트 예매 일정 안내', '안녕하세요, 현아 콘서트 담당팀입니다.<div><br></div><div>2021년 11월 20일 토요일 19:30 ~ 22:00, 2021년 11월 21일 일요일 19:30 ~ 22:00에 진행될 현아 부산 콘서트 예매가 오는 2021년 10월 20일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>감사합니다.</div>', to_date('2021-10-18 11:6', 'yyyy-mm-dd hh24:mi'), 'admin', 458, '현아');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, '현아 부산 콘서트 추가 예매 일정 안내', '안녕하세요, 현아 콘서트 담당팀입니다.<div><br></div><div>2021년 11월 27일 토요일 19:30 ~ 22:00, 2021년 11월 28일 일요일 19:30 ~ 22:00에 진행될 현아 부산 콘서트 추가 예매가 오는 2021년 10월 27일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>일정에 착오가 없으시기를 바랍니다. 감사합니다.</div>', to_date('2021-10-25 11:7', 'yyyy-mm-dd hh24:mi'), 'admin', 477, '현아');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, 'IU 울산 콘서트 예매 일정 안내', '안녕하세요, IU 콘서트 담당팀입니다.<div><br></div><div>2021년 11월 27일 토요일 19:30 ~ 22:00, 2021년 11월 28일 일요일 19:30 ~ 22:00에 진행될 IU 울산 콘서트 예매가 오는 2021년 10월 27일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>감사합니다.</div>', to_date('2021-10-25 11:11', 'yyyy-mm-dd hh24:mi'), 'admin', 438, 'IU');
insert into notices(no, title, content, wdate, writer, views, tag) values(notices_no_seq.nextval, 'IU 울산 콘서트 추가 예매 일정 안내', '안녕하세요, IU 콘서트 담당팀입니다.<div><br></div><div>2021년 12월 4일 토요일 19:30 ~ 22:00, 2021년 12월 5일 일요일 19:30 ~ 22:00에 진행될 IU 울산 콘서트 추가 예매가 오는 2021년 11월 3일 수요일 19:00에 열릴 예정입니다.</div><div><br></div><div>일정에 착오가 없으시기를 바랍니다. 감사합니다.</div>', to_date('2021-11-01 11:8', 'yyyy-mm-dd hh24:mi'), 'admin', 518, 'IU');

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

-- 아티스트 조회하기
SELECT * FROM ARTISTS;

-- 아티스트 등록하기
INSERT INTO ARTISTS(NO, NAME, CONTENT, IMG, SIMG) VALUES(ARTISTS_NO_SEQ.NEXTVAL, '장범준', '장범준은 밴드 ''버스커버스커''의 보컬이자 리더이다. 2011년 Mnet 오디션 프로그램 ''슈퍼스타K3''에서 준우승을 하며 화제에 올랐다. 이후 2012년 발표한 버스커버스커 1집 앨범의 타이틀곡인 ''벚꽃 엔딩''은 봄을 상징하는 ''봄캐롤'' 노래로 인정 받으며 매년 봄마다 음원 차트를 역주행하며 꾸준한 사랑을 받고 있다. 2016년 3월 25일, 장범준은 두번째 정규앨범 [장범준 2집]으로 컴백했으며, 박수봉 작가와 ''금세 사랑에 빠지는'' 이라는 브랜드 웹툰을 연재하기도 했다. 2019년 3월 21일, 3년 만의 정규앨범 [장범준 3집]이 발매되었고, 타이틀곡 ''당신과는 천천히'' 음원 차트 상위권을 차지하며 봄의 음원 강자로서의 면모를 보여주며,다시 한 번 입지를 굳혔다', '장범준.jpg', '장범준.jpg');
INSERT INTO ARTISTS(NO, NAME, CONTENT, IMG, SIMG) VALUES(ARTISTS_NO_SEQ.NEXTVAL, '잔나비', '각종 커버곡과 [슈퍼스타K]를 통해 주목 받았던 독특한 청년들, 인디 밴드 ''잔나비'' <br>멤버: 최정훈 (보컬), 김도형 (기타), 장경준 (베이스), 윤결 (드럼)<br>밴드 ''잔나비''. 1992년 생으로 갓 20대에 들어선 청년 셋이 지은 신선하면서도 유쾌한 이름, 그게 딱 밴드 ''잔나비''였다. 잔나비, 원숭이가 가지고 있는 그 느낌처럼 분당 동네 친구 정훈(보컬), 도형(기타) 이들은 신나고 즐거우며 솔직한 청춘들이다. 잔나비밴드를 이야기할 때 빼놓을 수 없는 것은 [슈퍼스타K5]다. 잔나비밴드는 자신들이 어떤 밴드인지 많은 사람들에게 알리기 위해 오디션 프로그램을 택했다. 하지만 세 사람 중 정훈만 플랜비에 속해 본선에 진출했고 TOP7에 올랐다. 다른 두 멤버들의 응원이 있었기에 가능했다.<br>밴드 잔나비는 이미 다수의 버스킹 공연과 홍대 클럽 공연을 펼쳐오며 실력을 검증받았으며 2014 펜타슈퍼루키에 선정되는 등 이미 두드러진 활약을 펼치며 존재감을 과시하고 있다. 밴드 잔나비는 지난 4월 28일 첫 싱글 [로켓트]를 발매해 인디 음악계의 새로운 돌풍을 일으켰다.', '잔나비.jpg', '잔나비.jpg');
INSERT INTO ARTISTS(NO, NAME, CONTENT, IMG, SIMG) VALUES(ARTISTS_NO_SEQ.NEXTVAL, 'IU', '섬세하고 아련한 감성을 노래하는 아티스트 ''아이유''<br><br>''노래를 위한 가수''보다 ''연예인이 되기 위한 가수''로 득실거리는 가요계의 쓸쓸한 현주소에서 음악이 아닌 것에 대한 생각은 한번도 가져보지 않은 소녀의 출현은 세상의 마음을 움직이기에 충분했다.<br><br>''스타가 되는 것이 꿈이 아니라, 제 노래를 통해 사람들이 잃어버린 꿈을 찾게 해주는 것이에요..'' 오디션 통과의 순간부터 기획과 제작을 병행할 만큼 음악적인 재능과 끼를 보여주었으며, 힘든 녹음 기간 내내 완벽에 가까운 진행으로 모든 스탭들의 인정을 받은 신인 가수 ''아이유(IU)''. 데뷔 전부터 고유진, 원티드 등 여러 아티스트들의 Featuring과 chorus 등의 활동은 물론 거미, 휘성 등 대한민국 최고의 보컬리스트들로부터 극찬을 받으며 이미 아티스트로서의 자질을 인정받았다.<br><br>어느덧 데뷔 10년 차 아티스트가 된 아이유. 10년이라는 시간의 무게처럼 깊이 있는 싱어송라이터 겸 프로듀서로도 점차 진화하고 있다. 여전히 보여줄 것이 무궁무진하다는 것을 알기에, 대중들로 하여금 아이유의 또 다른 10년을 기대케 한다.<br><br>소속사 : EDAM엔터테인먼트', '아이유.jpg', '아이유.jpg');
INSERT INTO ARTISTS(NO, NAME, CONTENT, IMG, SIMG) VALUES(ARTISTS_NO_SEQ.NEXTVAL, '10cm', '소규모 사운드로 거대한 감동을 추구하며 로맨스의 모든 면을 다루는 가사로 무장한 ''10cm''<br><br>- 2009년 홍대 클럽을 중심으로 활동 시작.<br>- 제이슨 므라즈의 영향을 받은 부분이 많으나 그와는 또다른 독자적인 세계를 가지고 있음.<br>- 뉴욕 맨하탄 스타일의 스마트하고 도도하며 섹시함이 깃든 음악을 구현하고 있음.<br>- 소규모 사운드로 거대한 감동을 추구하며 로맨스의 모든 면을 다루는 가사로 무장.<br><br>분명히 10cm는 한국 음악계의 하나의 아이콘이다. 질펀한 가사와 달콤한 멜로디로 대중들을 사로잡은 10cm.<br>인디 신에서 시작한 이 엉큼한 뮤지션은 한국 음악계의 인디와 메이저의 경계를 허문 장본인이기도 하다.<br>‘오늘밤은 어둠이 무서워요’, ‘아메리카노’로 이름을 알린 2010년에는 한국 버스킹 1세대로써 홍대 씬의 ‘통기타와 젬베’ 열풍을 설명하는 척도였고, 연이어 꾸준히 발매된 앨범들을 통해 대체 불가의 존재로 거듭나게 되었다.<br>탑 아이돌들과의 콜라버레이션, 각종 드라마 ost, 대형 페스티벌 등 섭외 1순위가 되었고, 식을 줄 모르는 열광 속에서 전 회 매진을 기록하는 단독 공연들로 명실상부 대한민국의 대표 인디밴드로 자리 잡았다.<br><br>2017년, 멤버 윤철중의 탈퇴로 10cm는 권정열 1인체제로 변경하여 네 번째 정규앨범 [4.0]으로 활동을 이어나갔으며 2018년 발표한 싱글 [매트리스]로 다시 한번 음악차트 1위를 거머쥐며 음원 강자 10cm의 저력을 보여주었다.<br><br>[AWARD]<br>2016  제8회 멜론뮤직어워드 뮤직스타일상 포크블루스 부문<br>2015  제7회 멜론뮤직어워드 포크부문<br>2011  제8회 한국대중음악상 최우수 팝 노래 부문<br>2010  M.NET 아시안 뮤직 어워드 올해의 발견상', '십센치.png', '십센치.png');
INSERT INTO ARTISTS(NO, NAME, CONTENT, IMG, SIMG) VALUES(ARTISTS_NO_SEQ.NEXTVAL, '현아', '항상 새로운 장르의 음악과 퍼포먼스로 트렌드를 리드해나가는 진정한 퀸 ''''현아''!<br><br>현아는 약 4년의 연습생 생활을 거쳐 2007년 원더걸스의 싱글 [The Wonder Begins]로 데뷔. 이후 2009년 큐브 엔터테인먼트로 소속을 옮겨 포미닛의 멤버로서 활발히 활동하기 시작했다. 이후 2010년 1월에는 첫 솔로 싱글 [Change], [Bubble Pop!], [A Talk] 등 발매하고 활발히 활동하여, 각 종 음반 차트에서 상위권을 유지하며 이 시대 트렌드 아이콘으로서 성공적인 행보를 보인다. 이후 장현승과 유닛 그룹 트러블 메이커를 결성해 2014년까지 활동하였고, 2016년 그룹 포미닛 해체 후 8월 1일 다섯 번째 EP 음반 [A''wesome]을 발매했다. 2017년 5월 펜타곤 멤버 후이, 이던과 함께 트리플 H로 활동하며 다양한 무대를 보여왔다.<br><br>2017년 8월, 올해 데뷔 10주년을 맞은 현아는 새로운 미니앨범을 통해 기존에 보여주었던 그녀의 섹시함은 물론 색다른 모습을 보여 줄 예정이다. 언제나 다채로운 음악적인 색깔을 보여주는 현아는, 더욱 더 깊어진 음악적인 색깔과 새로운 모습을 보여줄 준비가 되었다.<br><br>출생: 1992년 6월 6일<br>신체: 164cm, 44kg<br>소속그룹: 포미닛, 트러블 메이커, 트리플 H<br>수상: 2015년 제24회 하이원 서울가요대상 댄스 퍼포먼스상', '현아.jpg', '현아.jpg');

-- 모든 아티스트의 댓글 조회하기
SELECT * FROM COMMENTS;

-- 아티스트별 댓글 등록
INSERT INTO COMMENTS VALUES(COMMENTS_NO_SEQ.NEXTVAL, '장범준', 'test', '안녕안녕안녕', SYSDATE, 3, 10);
INSERT INTO COMMENTS VALUES(COMMENTS_NO_SEQ.NEXTVAL, '장범준', 'hwisaek', '안녕안녕안녕', SYSDATE, 2, 10);
INSERT INTO COMMENTS VALUES(COMMENTS_NO_SEQ.NEXTVAL, '장범준', 'test', '안녕안녕안녕', SYSDATE, 6, 10);
INSERT INTO COMMENTS VALUES(COMMENTS_NO_SEQ.NEXTVAL, '장범준', 'hwisaek', '안녕안녕안녕', SYSDATE, 2, 10);
INSERT INTO COMMENTS VALUES(COMMENTS_NO_SEQ.NEXTVAL, '현아', 'test', '안녕안녕안녕', SYSDATE, 7, 10);
INSERT INTO COMMENTS VALUES(COMMENTS_NO_SEQ.NEXTVAL, '현아', 'hwisaek', '안녕안녕안녕', SYSDATE, 3, 10);
INSERT INTO COMMENTS VALUES(COMMENTS_NO_SEQ.NEXTVAL, '장범준', 'test', '안녕안녕안녕', SYSDATE, 1, 10);
INSERT INTO COMMENTS VALUES(COMMENTS_NO_SEQ.NEXTVAL, '장범준', 'hwisaek', '안녕안녕안녕', SYSDATE, 0, 10);
INSERT INTO COMMENTS VALUES(COMMENTS_NO_SEQ.NEXTVAL, '장범준', 'test', '안녕안녕안녕', SYSDATE, 0, 10);
INSERT INTO COMMENTS VALUES(COMMENTS_NO_SEQ.NEXTVAL, '장범준', 'hwisaek', '안녕안녕안녕', SYSDATE, 5, 10);
INSERT INTO COMMENTS VALUES(COMMENTS_NO_SEQ.NEXTVAL, '장범준', 'test', '안녕안녕안녕', SYSDATE, 1, 10);
INSERT INTO COMMENTS VALUES(COMMENTS_NO_SEQ.NEXTVAL, '장범준', 'hwisaek', '안녕안녕안녕', SYSDATE, 5, 10);

-- 콘서트 등록하기
INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '장범준', '제목', '장범준의 월드에 오신걸 환영합니다', '2021-06-01', '서울', 100000);
INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '잔나비', '제목', '잔나비의 월드에 오신걸 환영합니다', '2021-07-02', '부산', 100000);
INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, 'IU', '제목', 'IU의 월드에 오신걸 환영합니다', '2021-06-03', '인천', 100000);
INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '현아', '제목', '현아의 월드에 오신걸 환영합니다', '2021-06-04', '대전', 100000);
INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '10cm', '제목', '10cm의 월드에 오신걸 환영합니다', '2021-08-05', '대구', 100000);
INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '장범준', '제목', '장범준의 월드에 오신걸 환영합니다', '2021-08-02', '서울', 100000);
INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '잔나비', '제목', '잔나비의 월드에 오신걸 환영합니다', '2021-07-03', '부산', 100000);
INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, 'IU', '제목', 'IU의 월드에 오신걸 환영합니다', '2021-06-03', '인천', 100000);
INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '현아', '제목', '현아의 월드에 오신걸 환영합니다', '2021-08-05', '대구', 100000);
INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '10cm', '제목', '10cm의 월드에 오신걸 환영합니다', '2012-05-06', '대전', 100000);
INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '장범준', '제목', '장범준의 월드에 오신걸 환영합니다', '2013-01-03', '서울', 100000);
INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '잔나비', '제목', '잔나비의 월드에 오신걸 환영합니다', '2013-02-04', '부산', 100000);
INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, 'IU', '제목', 'IU의 월드에 오신걸 환영합니다', '2013-03-05', '인천', 100000);
INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '현아', '제목', '현아의 월드에 오신걸 환영합니다', '2013-04-06', '대구', 100000);
INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '10cm', '제목', '10cm의 월드에 오신걸 환영합니다', '2013-05-07', '대전', 100000);
INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '장범준','제목',  '장범준의 월드에 오신걸 환영합니다', '2014-01-04', '부산', 100000);
INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '잔나비', '제목', '잔나비의 월드에 오신걸 환영합니다', '2014-02-05', '서울', 100000);
INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, 'IU', '제목', 'IU의 월드에 오신걸 환영합니다', '2014-03-06', '대구', 100000);
INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '현아', '제목', '현아의 월드에 오신걸 환영합니다', '2014-04-07', '인천', 100000);
INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '10cm', '제목', '10cm의 월드에 오신걸 환영합니다', '2014-05-08', '대전', 100000);
INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '장범준', '제목', '장범준의 월드에 오신걸 환영합니다', '2015-01-04', '서울', 100000);
INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '잔나비', '제목', '잔나비의 월드에 오신걸 환영합니다', '2015-02-05', '부산', 100000);
INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, 'IU', '제목', 'IU의 월드에 오신걸 환영합니다', '2015-03-06', '인천', 100000);
INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '현아', '제목', '현아의 월드에 오신걸 환영합니다', '2015-04-07', '대전', 100000);
INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '10cm', '제목', '10cm의 월드에 오신걸 환영합니다', '2015-05-08', '대구', 100000);
INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '장범준', '제목', '장범준의 월드에 오신걸 환영합니다', '2016-01-05', '서울', 100000);
INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '잔나비', '제목', '잔나비의 월드에 오신걸 환영합니다', '2016-02-06', '부산', 100000);
INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, 'IU', '제목', 'IU의 월드에 오신걸 환영합니다', '2016-03-07', '대전', 100000);
INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '현아', '제목', '현아의 월드에 오신걸 환영합니다', '2016-04-08', '대구', 100000);
INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '10cm', '제목', '10cm의 월드에 오신걸 환영합니다', '2016-05-09', '인천', 100000);
INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '장범준', '제목', '장범준의 월드에 오신걸 환영합니다', '2017-01-01', '서울', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '잔나비', '제목', '잔나비의 월드에 오신걸 환영합니다', '2017-02-02', '부산', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, 'IU', '제목', 'IU의 월드에 오신걸 환영합니다', '2017-03-03', '인천', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '현아', '제목', '현아의 월드에 오신걸 환영합니다', '2017-04-04', '대전', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '10cm', '제목', '10cm의 월드에 오신걸 환영합니다', '2017-05-05', '대구', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '장범준', '제목', '장범준의 월드에 오신걸 환영합니다', '2018-01-02', '서울', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '잔나비', '제목', '잔나비의 월드에 오신걸 환영합니다', '2018-02-03', '부산', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, 'IU', '제목', 'IU의 월드에 오신걸 환영합니다', '2018-03-04', '인천', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '현아', '제목', '현아의 월드에 오신걸 환영합니다', '2018-04-05', '대구', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '10cm', '제목', '10cm의 월드에 오신걸 환영합니다', '2018-05-06', '대전', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '장범준', '제목', '장범준의 월드에 오신걸 환영합니다', '2019-01-03', '서울', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '잔나비', '제목', '잔나비의 월드에 오신걸 환영합니다', '2019-02-04', '부산', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, 'IU', '제목', 'IU의 월드에 오신걸 환영합니다', '2019-03-05', '인천', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '현아', '제목', '현아의 월드에 오신걸 환영합니다', '2019-04-06', '대구', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '10cm', '제목', '10cm의 월드에 오신걸 환영합니다', '2019-05-07', '대전', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '장범준','제목',  '장범준의 월드에 오신걸 환영합니다', '2020-01-04', '부산', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '잔나비', '제목', '잔나비의 월드에 오신걸 환영합니다', '2020-02-05', '서울', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, 'IU', '제목', 'IU의 월드에 오신걸 환영합니다', '2020-03-06', '대구', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '현아', '제목', '현아의 월드에 오신걸 환영합니다', '2020-04-07', '인천', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '10cm', '제목', '10cm의 월드에 오신걸 환영합니다', '2020-05-08', '대전', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '장범준', '제목', '장범준의 월드에 오신걸 환영합니다', '2021-01-04', '서울', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '잔나비', '제목', '잔나비의 월드에 오신걸 환영합니다', '2021-02-05', '부산', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, 'IU', '제목', 'IU의 월드에 오신걸 환영합니다', '2021-03-06', '인천', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '현아', '제목', '현아의 월드에 오신걸 환영합니다', '2021-04-07', '대전', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '10cm', '제목', '10cm의 월드에 오신걸 환영합니다', '2021-05-08', '대구', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '장범준', '제목', '장범준의 월드에 오신걸 환영합니다', '2022-01-05', '서울', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '잔나비', '제목', '잔나비의 월드에 오신걸 환영합니다', '2022-02-06', '부산', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, 'IU', '제목', 'IU의 월드에 오신걸 환영합니다', '2022-03-07', '대전', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '현아', '제목', '현아의 월드에 오신걸 환영합니다', '2022-04-08', '대구', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '10cm', '제목', '10cm의 월드에 오신걸 환영합니다', '2022-05-09', '인천', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '장범준', '제목', '장범준의 월드에 오신걸 환영합니다', '2023-01-01', '서울', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '잔나비', '제목', '잔나비의 월드에 오신걸 환영합니다', '2023-02-02', '부산', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, 'IU', '제목', 'IU의 월드에 오신걸 환영합니다', '2023-03-03', '인천', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '현아', '제목', '현아의 월드에 오신걸 환영합니다', '2023-04-04', '대전', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '10cm', '제목', '10cm의 월드에 오신걸 환영합니다', '2023-05-05', '대구', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '장범준', '제목', '장범준의 월드에 오신걸 환영합니다', '2024-01-02', '서울', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '잔나비', '제목', '잔나비의 월드에 오신걸 환영합니다', '2024-02-03', '부산', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, 'IU', '제목', 'IU의 월드에 오신걸 환영합니다', '2024-03-04', '인천', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '현아', '제목', '현아의 월드에 오신걸 환영합니다', '2024-04-05', '대구', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '10cm', '제목', '10cm의 월드에 오신걸 환영합니다', '2024-05-06', '대전', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '장범준', '제목', '장범준의 월드에 오신걸 환영합니다', '2025-01-03', '서울', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '잔나비', '제목', '잔나비의 월드에 오신걸 환영합니다', '2025-02-04', '부산', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, 'IU', '제목', 'IU의 월드에 오신걸 환영합니다', '2025-03-05', '인천', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '현아', '제목', '현아의 월드에 오신걸 환영합니다', '2025-04-06', '대구', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '10cm', '제목', '10cm의 월드에 오신걸 환영합니다', '2025-05-07', '대전', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '장범준','제목',  '장범준의 월드에 오신걸 환영합니다', '2026-01-04', '부산', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '잔나비', '제목', '잔나비의 월드에 오신걸 환영합니다', '2026-02-05', '서울', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, 'IU', '제목', 'IU의 월드에 오신걸 환영합니다', '2026-03-06', '대구', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '현아', '제목', '현아의 월드에 오신걸 환영합니다', '2026-04-07', '인천', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '10cm', '제목', '10cm의 월드에 오신걸 환영합니다', '2026-05-08', '대전', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '장범준', '제목', '장범준의 월드에 오신걸 환영합니다', '2027-01-04', '서울', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '잔나비', '제목', '잔나비의 월드에 오신걸 환영합니다', '2027-02-05', '부산', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, 'IU', '제목', 'IU의 월드에 오신걸 환영합니다', '2027-03-06', '인천', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '현아', '제목', '현아의 월드에 오신걸 환영합니다', '2027-04-07', '대전', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '10cm', '제목', '10cm의 월드에 오신걸 환영합니다', '2027-05-08', '대구', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '장범준', '제목', '장범준의 월드에 오신걸 환영합니다', '2028-01-05', '서울', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '잔나비', '제목', '잔나비의 월드에 오신걸 환영합니다', '2028-02-06', '부산', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, 'IU', '제목', 'IU의 월드에 오신걸 환영합니다', '2028-03-07', '대전', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '현아', '제목', '현아의 월드에 오신걸 환영합니다', '2028-04-08', '대구', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '10cm', '제목', '10cm의 월드에 오신걸 환영합니다', '2028-05-09', '인천', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '장범준', '제목', '장범준의 월드에 오신걸 환영합니다', '2029-01-01', '서울', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '잔나비', '제목', '잔나비의 월드에 오신걸 환영합니다', '2029-02-02', '부산', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, 'IU', '제목', 'IU의 월드에 오신걸 환영합니다', '2029-03-03', '인천', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '현아', '제목', '현아의 월드에 오신걸 환영합니다', '2029-04-04', '대전', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '10cm', '제목', '10cm의 월드에 오신걸 환영합니다', '2029-05-05', '대구', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '장범준', '제목', '장범준의 월드에 오신걸 환영합니다', '2030-01-02', '서울', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '잔나비', '제목', '잔나비의 월드에 오신걸 환영합니다', '2030-02-03', '부산', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, 'IU', '제목', 'IU의 월드에 오신걸 환영합니다', '2030-03-04', '인천', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '현아', '제목', '현아의 월드에 오신걸 환영합니다', '2030-04-05', '대구', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '10cm', '제목', '10cm의 월드에 오신걸 환영합니다', '2030-05-06', '대전', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '장범준', '제목', '장범준의 월드에 오신걸 환영합니다', '2031-01-03', '서울', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '잔나비', '제목', '잔나비의 월드에 오신걸 환영합니다', '2031-02-04', '부산', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, 'IU', '제목', 'IU의 월드에 오신걸 환영합니다', '2031-03-05', '인천', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '현아', '제목', '현아의 월드에 오신걸 환영합니다', '2031-04-06', '대구', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '10cm', '제목', '10cm의 월드에 오신걸 환영합니다', '2031-05-07', '대전', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '장범준','제목',  '장범준의 월드에 오신걸 환영합니다', '2032-01-04', '부산', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '잔나비', '제목', '잔나비의 월드에 오신걸 환영합니다', '2032-02-05', '서울', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, 'IU', '제목', 'IU의 월드에 오신걸 환영합니다', '2032-03-06', '대구', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '현아', '제목', '현아의 월드에 오신걸 환영합니다', '2032-04-07', '인천', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '10cm', '제목', '10cm의 월드에 오신걸 환영합니다', '2032-05-08', '대전', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '장범준', '제목', '장범준의 월드에 오신걸 환영합니다', '2033-01-04', '서울', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '잔나비', '제목', '잔나비의 월드에 오신걸 환영합니다', '2033-02-05', '부산', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, 'IU', '제목', 'IU의 월드에 오신걸 환영합니다', '2033-03-06', '인천', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '현아', '제목', '현아의 월드에 오신걸 환영합니다', '2033-04-07', '대전', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '10cm', '제목', '10cm의 월드에 오신걸 환영합니다', '2033-05-08', '대구', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '장범준', '제목', '장범준의 월드에 오신걸 환영합니다', '2034-01-05', '서울', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '잔나비', '제목', '잔나비의 월드에 오신걸 환영합니다', '2034-02-06', '부산', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, 'IU', '제목', 'IU의 월드에 오신걸 환영합니다', '2034-03-07', '대전', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '현아', '제목', '현아의 월드에 오신걸 환영합니다', '2034-04-08', '대구', 100000);INSERT INTO CONCERTS(NO, ARTIST, TITLE, CONTENT, CDATE, LOCATION, PRICE) VALUES(CONCERTS_NO_SEQ.NEXTVAL, '10cm', '제목', '10cm의 월드에 오신걸 환영합니다', '2034-05-09', '인천', 100000);



-- 월별 콘서트 조회하기
select no, title, to_char(cdate, 'MM/DD'), location
  from concerts
  where cdate >= to_date('20215', 'YYYYMM') and cdate < to_date('20216', 'YYYYMM') order by cdate asc;

-- 전체 콘서트 조회하기
SELECT * FROM CONCERTS ORDER BY NO DESC;

-- 등록된 콘서트 개수 조회하기
SELECT COUNT(*) FROM CONCERTS;

-- 검색결과에 해당하는 콘서트 개수 조회하기
SELECT COUNT(*)
FROM (SELECT *
          FROM (SELECT ROWNUM AS RNO, NO, ARTIST, TITLE, CONTENT, TO_CHAR(CDATE, 'YYYY-MM-DD'), LOCATION
                     FROM (SELECT * 
                               FROM CONCERTS 
                               WHERE ARTIST LIKE('%범준%') OR TITLE LIKE('%범준%')
                               ORDER BY NO DESC) C));

-- 콘서트 목록 한 페이지의 데이터 조회 (페이지당 10개, 2페이지 조회)
SELECT *
FROM (SELECT ROWNUM AS RNO, NO, ARTIST, TITLE, CONTENT, TO_CHAR(CDATE, 'YYYY-MM-DD'), LOCATION
           FROM (SELECT * 
                     FROM CONCERTS 
                     ORDER BY NO DESC) C)
WHERE RNO > 10 * (2 - 1) AND RNO <= 10 * 2;

-- 콘서트 삭제하기
DELETE FROM CONCERTS WHERE NO = 110;

-- 콘서트 검색하기 - 콘서트 명 검색
SELECT *
FROM (SELECT ROWNUM AS RNO, NO, ARTIST, TITLE, CONTENT, TO_CHAR(CDATE, 'YYYY-MM-DD'), LOCATION
           FROM (SELECT * 
                     FROM CONCERTS 
                     WHERE TITLE LIKE('%제%')
                     ORDER BY NO DESC) C)
WHERE RNO > 10 * (2 - 1) AND RNO <= 10 * 2;

-- 콘서트 검색하기 - 아티스트 검색
SELECT *
FROM (SELECT ROWNUM AS RNO, NO, ARTIST, TITLE, CONTENT, TO_CHAR(CDATE, 'YYYY-MM-DD'), LOCATION
           FROM (SELECT * 
                     FROM CONCERTS 
                     WHERE LOWER(ARTIST) LIKE(LOWER('%u%'))
                     ORDER BY CDATE DESC) C)
WHERE RNO > 10 * (2 - 1) AND RNO <= 10 * 2;

-- 콘서트 검색하기 - 아티스트 & 콘서트 검색
SELECT *
FROM (SELECT ROWNUM AS RNO, NO, ARTIST, TITLE, CONTENT, TO_CHAR(CDATE, 'YYYY-MM-DD'), LOCATION
           FROM (SELECT * 
                     FROM CONCERTS 
                     WHERE ARTIST LIKE('%범준%') OR TITLE LIKE('%범준%')
                     ORDER BY NO DESC) C)
WHERE RNO > 10 * (2 - 1) AND RNO <= 10 * 2;

-- 다음에 등록할 콘서트 번호 조회 
SELECT CONCERTS_NO_SEQ.NEXTVAL FROM DUAL;

-- 콘서트 상세정보 조회하기
SELECT NO, ARTIST, TITLE, CONTENT, TO_CHAR(CDATE, 'YYYY-MM-DD'), LOCATION, PRICE FROM CONCERTS WHERE NO = 30;

-- 예매 정보 조회하기
SELECT * FROM ORDERS;

-- 예매 번호 생성하기
SELECT ORDERS_NO_SEQ.NEXTVAL FROM DUAL;

-- 주문 정보 추가
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'hwisaek', 2);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'test', 2);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'test', 116);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'test', 117);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'test', 118);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'test', 119);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'test', 120);

INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'qqq', 116);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'qqq', 117);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'qqq', 118);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'qqq', 119);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'qqq', 120);

INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'asd', 116);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'asd', 117);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'asd', 118);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'asd', 119);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'asd', 120);

INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'zxc', 116);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'zxc', 117);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'zxc', 118);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'zxc', 119);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'zxc', 120);

INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'aaa', 116);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'aaa', 117);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'aaa', 118);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'aaa', 119);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'aaa', 120);

INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'abc123', 116);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'abc123', 117);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'abc123', 118);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'abc123', 119);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'abc123', 120);

INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'dlckdals', 116);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'dlckdals', 117);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'dlckdals', 118);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'dlckdals', 119);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'dlckdals', 120);

INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'rkdwlstmf', 116);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'rkdwlstmf', 117);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'rkdwlstmf', 118);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'rkdwlstmf', 119);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'rkdwlstmf', 120);

INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'ghdwnstn', 116);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'ghdwnstn', 117);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'ghdwnstn', 118);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'ghdwnstn', 119);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'ghdwnstn', 120);

INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'wnehdtjd', 116);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'wnehdtjd', 117);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'wnehdtjd', 118);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'wnehdtjd', 119);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'wnehdtjd', 120);

INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'rnwldnjs', 116);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'rnwldnjs', 117);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'rnwldnjs', 118);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'rnwldnjs', 119);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'rnwldnjs', 120);

INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'wkawkfl32', 116);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'wkawkfl32', 117);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'wkawkfl32', 118);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'wkawkfl32', 119);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'wkawkfl32', 120);

INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'rkddnjsehcorh', 116);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'rkddnjsehcorh', 117);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'rkddnjsehcorh', 118);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'rkddnjsehcorh', 119);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'rkddnjsehcorh', 120);

INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'nic', 118);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'nic', 119);
INSERT INTO ORDERS VALUES(ORDERS_NO_SEQ.NEXTVAL, 'nic', 120);




-- 전체 좌석 보기
SELECT * FROM SEATS;

-- 좌석 하나 예매하기
INSERT INTO SEATS(CONCERT_NO, SEAT_NO, ID, ORDER_NO) VALUES(2, 'A_1', 'hwisaek', 1);
INSERT INTO SEATS(CONCERT_NO, SEAT_NO, ID, ORDER_NO) VALUES(2, 'A_5', 'test', 2);
INSERT INTO SEATS(CONCERT_NO, SEAT_NO, ID, ORDER_NO) VALUES(2, 'A_6', 'test', 2);
INSERT INTO SEATS(CONCERT_NO, SEAT_NO, ID, ORDER_NO) VALUES(2, 'A_7', 'test', 2);
INSERT INTO SEATS(CONCERT_NO, SEAT_NO, ID, ORDER_NO) VALUES(116, 'A_7', 'test', 3);
INSERT INTO SEATS(CONCERT_NO, SEAT_NO, ID, ORDER_NO) VALUES(117, 'A_7', 'test', 4);
INSERT INTO SEATS(CONCERT_NO, SEAT_NO, ID, ORDER_NO) VALUES(118, 'A_7', 'test', 5);
INSERT INTO SEATS(CONCERT_NO, SEAT_NO, ID, ORDER_NO) VALUES(119, 'A_7', 'test', 6);
INSERT INTO SEATS(CONCERT_NO, SEAT_NO, ID, ORDER_NO) VALUES(120, 'A_7', 'test', 7);

INSERT INTO SEATS(CONCERT_NO, SEAT_NO, ID, ORDER_NO) VALUES(116, 'A_8', 'qqq', 8);
INSERT INTO SEATS(CONCERT_NO, SEAT_NO, ID, ORDER_NO) VALUES(117, 'A_8', 'qqq', 9);
INSERT INTO SEATS(CONCERT_NO, SEAT_NO, ID, ORDER_NO) VALUES(118, 'A_8', 'qqq', 10);
INSERT INTO SEATS(CONCERT_NO, SEAT_NO, ID, ORDER_NO) VALUES(119, 'A_8', 'qqq', 11);
INSERT INTO SEATS(CONCERT_NO, SEAT_NO, ID, ORDER_NO) VALUES(120, 'A_8', 'qqq', 12);

INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(116, 'A_9', 'asd', 13);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(117, 'A_9', 'asd', 14);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(118, 'A_9', 'asd', 15);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(119, 'A_9', 'asd', 16);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(120, 'A_9', 'asd', 17);

INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(116, 'A_10', 'zxc', 18);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(117, 'A_10', 'zxc', 19);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(118, 'A_10', 'zxc', 20);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(119, 'A_10', 'zxc', 21);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(120, 'A_10', 'zxc', 22);

INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(116, 'A_11', 'aaa', 23);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(117, 'A_11', 'aaa', 24);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(118, 'A_11', 'aaa', 25);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(119, 'A_11', 'aaa', 26);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(120, 'A_11', 'aaa', 27);

INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(116, 'A_12', 'abc123', 28);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(117, 'A_12', 'abc123', 29);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(118, 'A_12', 'abc123', 30);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(119, 'A_12', 'abc123', 31);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(120, 'A_12', 'abc123', 32);

INSERT INTO SEATS(CONCERT_NO, SEAT_NO, ID, ORDER_NO) VALUES(116, 'B_8', 'dlckdals', 33);
INSERT INTO SEATS(CONCERT_NO, SEAT_NO, ID, ORDER_NO) VALUES(117, 'B_8', 'dlckdals', 34);
INSERT INTO SEATS(CONCERT_NO, SEAT_NO, ID, ORDER_NO) VALUES(118, 'B_8', 'dlckdals', 35);
INSERT INTO SEATS(CONCERT_NO, SEAT_NO, ID, ORDER_NO) VALUES(119, 'B_8', 'dlckdals', 36);
INSERT INTO SEATS(CONCERT_NO, SEAT_NO, ID, ORDER_NO) VALUES(120, 'B_8', 'dlckdals', 37);

INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(116, 'B_9', 'rkdwlstmf', 38);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(117, 'B_9', 'rkdwlstmf', 39);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(118, 'B_9', 'rkdwlstmf', 40);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(119, 'B_9', 'rkdwlstmf', 41);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(120, 'B_9', 'rkdwlstmf', 42);

INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(116, 'B_10', 'ghdwnstn', 43);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(117, 'B_10', 'ghdwnstn', 44);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(118, 'B_10', 'ghdwnstn', 45);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(119, 'B_10', 'ghdwnstn', 46);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(120, 'B_10', 'ghdwnstn', 47);

INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(116, 'B_11', 'wnehdtjd', 48);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(117, 'B_11', 'wnehdtjd', 49);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(118, 'B_11', 'wnehdtjd', 50);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(119, 'B_11', 'wnehdtjd', 51);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(120, 'B_11', 'wnehdtjd', 52);

INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(116, 'B_12', 'rnwldnjs', 53);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(117, 'B_12', 'rnwldnjs', 54);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(118, 'B_12', 'rnwldnjs', 55);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(119, 'B_12', 'rnwldnjs', 56);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(120, 'B_12', 'rnwldnjs', 57);

INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(116, 'C_11', 'wkawkfl32', 58);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(117, 'C_11', 'wkawkfl32', 59);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(118, 'C_11', 'wkawkfl32', 60);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(119, 'C_11', 'wkawkfl32', 61);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(120, 'C_11', 'wkawkfl32', 62);

INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(116, 'C_12', 'rkddnjsehcorh', 63);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(117, 'C_12', 'rkddnjsehcorh', 64);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(118, 'C_12', 'rkddnjsehcorh', 65);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(119, 'C_12', 'rkddnjsehcorh', 66);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(120, 'C_12', 'rkddnjsehcorh', 67);

INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(118, 'C_13', 'nic', 68);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(119, 'C_14', 'nic', 69);
INSERT INTO SEATS(CONCERT_BO, SEAT_NO, ID, ORDER_NO) VALUES(120, 'C_15', 'nic', 70);


-- 한번에 여러 좌석 예매하기 
INSERT INTO SEATS
    SELECT 119, 'B_1', 'test', 2 FROM DUAL UNION ALL 
    SELECT 119, 'B_2', 'test', 2 FROM DUAL UNION ALL 
    SELECT 119, 'B_3', 'test', 2 FROM DUAL UNION ALL 
    SELECT 119, 'B_4', 'test', 2 FROM DUAL; 

-- 특정 콘서트의 예매된 좌석 조회
SELECT * FROM SEATS WHERE CONCERT_NO = 300;

-- 해당 주문 번호의 결제 정보 조회
SELECT o.NO, m.first_name, m.last_name, m.phone, c.cdate FROM orders o, concerts c, members m WHERE o.NO = 1 AND o.concerts_no = c.NO AND o.ID = m.ID;

-- 해당 주문 번호의 결제 좌석 조회
SELECT seat_no FROM seats WHERE order_no = 1;

-- 해당 사용자의 주문 내역을 조회
select m.first_name, m.last_name, o.no, c.no, c.artist, c.title, c.location, to_char(c.cdate, 'YYYY.MM.DD HH:Mi') 
from members m, orders o, concerts c 
where m.id = 'test' and o.id = m.id and o.concerts_no = c.no;

-- 통계 관련 구문 시작-----------------------------------------------------------------------------------------------------

-- 성별 통계
SELECT SEX, COUNT(*)
FROM ORDERS O, MEMBERS M
WHERE O.ID = M.ID
GROUP BY SEX;

-- 아티스트별 성별 통계
SELECT SEX, COUNT(*)
FROM ORDERS O, MEMBERS M, CONCERTS C
WHERE O.ID = M.ID AND O.CONCERTS_NO = C.NO AND C.ARTIST = '잔나비'
GROUP BY SEX;

-- 연령별 통계
select age, count(*) 
from (select floor((to_char(sysdate, 'YYYY') - to_char(m.birthdate, ' YYYY')) / 10) * 10 as age 
        from orders o, members m where o.id = m.id) 
group by age 
order by age asc ;

-- 아티스트별 연령별 통계
select age, count(*) 
from (select floor((to_char(sysdate, 'YYYY') - to_char(m.birthdate, ' YYYY')) / 10) * 10 as age 
        from orders o, members m, concerts c 
        where o.id = m.id and o.concerts_no = c.no and c.artist = '잔나비') 
group by age 
order by age asc ;

-- 통계 관련 구문 끝   -----------------------------------------------------------------------------------------------------

-- 주문 정보의 id와 세션의 id가 같은지 확인
select count(*) from orders where no = 3 and id = 'test';

COMMIT;