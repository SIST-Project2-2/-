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
    NO NUMBER(10) CONSTRAINT PK_MEMBERS_NO NOT NULL UNIQUE, -- 회원 번호
    ID VARCHAR2(10) CONSTRAINT PK_MEMBERS_ID PRIMARY KEY, -- 아이디
    PW VARCHAR2(20) CONSTRAINT NN_MEMBERS_PW NOT NULL, -- 패스워드
    NICKNAME VARCHAR2(30) CONSTRAINT NN_MEMBERS_NICKNAME NOT NULL, -- 닉네임
    FIRST_NAME VARCHAR2(30) CONSTRAINT NN_MEMBERS_FIRST_NAME NOT NULL, -- 이름
    LAST_NAME VARCHAR2(30) CONSTRAINT NN_MEMBERS_LAST_NAME NOT NULL, -- 성
    BIRTHDATE DATE CONSTRAINT NN_MEMBERS_BIRTHDATE NOT NULL, -- 생년월일
    SEX VARCHAR(5) CONSTRAINT NN_MEMBERS_SEX NOT NULL, -- 성별
    ADDRESS VARCHAR2(100), -- 주소
    PHONE VARCHAR2(30), -- 핸드폰 번호
    AUTHORITY VARCHAR2(10) DEFAULT 'USER', -- 권한. 관리자인지 아닌지 구분
    WITHDRAWAL NUMBER(1), -- 탈퇴요청 여부
    EMAIL VARCHAR2(100) CONSTRAINT NN_MEMBERS_EMAIL NOT NULL -- 이메일 주소
);

CREATE TABLE ARTISTS(
    NO NUMBER(10) CONSTRAINT  NNU_ARTISTS_NO NOT NULL UNIQUE, -- 아티스트 번호
    NAME VARCHAR2(30) CONSTRAINT PK_ARTISTS_NAME PRIMARY KEY, -- 아티스트 이름
    CONTENT VARCHAR2(2000) CONSTRAINT NN_ARTISTS_CONTENT NOT NULL -- 아티스트 설명
);

CREATE TABLE COMMENTS(
    NO NUMBER(10) CONSTRAINT PK_COMMENTS_NO PRIMARY KEY, -- 댓글 번호
    ARTIST VARCHAR2(30) CONSTRAINT NN_COMMENTS_ARTIST NOT NULL, -- 작성된 아티스트 이름  
    ID VARCHAR2(10) CONSTRAINT NN_COMMENTS_ID NOT NULL, -- 작성자 ID
    CONTENT VARCHAR2(1000) CONSTRAINT NN_COMMENTS_CONTENT NOT NULL, -- 작성 내용
    WDATE DATE CONSTRAINT NN_COMMENTS_DATE NOT NULL, -- 작성일자
    CONSTRAINT FK_COMMENTS_ARTISTS FOREIGN KEY (ARTIST) REFERENCES ARTISTS(NAME),
    CONSTRAINT FK_COMMENTS_MEMBERS FOREIGN KEY (CONTENT) REFERENCES MEMBERS(ID)
);

CREATE TABLE CONCERTS(
    NO NUMBER(10) CONSTRAINT PK_CONCERTS_NO PRIMARY KEY, -- 콘서트 번호
    ARTIST VARCHAR2(30) CONSTRAINT NN_CONCERTS_ARTIST NOT NULL, -- 공연 아티스트
    TITLE VARCHAR2(100) CONSTRAINT NN_CONCERTS_TITLE NOT NULL, -- 공연 제목
    CONTENT VARCHAR2(1000) CONSTRAINT NN_CONCERTS_CONTENT NOT NULL, -- 공연 내용
    CDATE DATE CONSTRAINT NN_CONCERTS_CDATE NOT NULL, -- 공연 일자
    LOCATION VARCHAR2(100) CONSTRAINT NN_CONCERTS_LOCATION NOT NULL, -- 공연 장소
    CONSTRAINT FK_CONCERTS_ARTISTS FOREIGN KEY (ARTIST) REFERENCES ARTISTS(NAME)
);

CREATE TABLE SEAT_PRICE(
    CONCERT_NO NUMBER(10) CONSTRAINT NN_SEAT_PRICE_CONCERT_NO NOT NULL, -- 공연 번호
    CLASS VARCHAR(1) CONSTRAINT NN_SEAT_PRICE_CLASS NOT NULL, -- 좌석 등급
    PRICE NUMBER(10) CONSTRAINT NN_SEAT_PRICE_PRICE NOT NULL, -- 좌석 가격
    CONSTRAINT FK_SEAT_PRICE_CONCERTS FOREIGN KEY (CONCERT_NO) REFERENCES CONCERTS(NO)
);

CREATE TABLE SEATS(
    CONCERT_NO NUMBER(10) CONSTRAINT NN_SEATSCONCERT_NO NOT NULL, -- 공연 번호
    ID VARCHAR2(10) CONSTRAINT NN_SEATS_ID NOT NULL, -- 예매한 유저 ID
    CLASS VARCHAR2(1) CONSTRAINT NN_SEATS_CLASS NOT NULL, -- 좌석 등급
    NO VARCHAR2(5) CONSTRAINT NN_SEATS_NO NOT NULL, -- 좌석 번호
    CONSTRAINT FK_SEATS_CONCERTS FOREIGN KEY (CONCERT_NO) REFERENCES CONCERTS(NO)
);

CREATE TABLE NOTICES(
    NO NUMBER(10) CONSTRAINT PK_NOTICES_NO PRIMARY KEY, -- 공지사항 번호
    TITLE VARCHAR2(30) CONSTRAINT NN_NOTICES_TITLE NOT NULL, -- 공지사항 제목
    CONTENT VARCHAR2(1000) CONSTRAINT NN_NOTICES_CONTENT NOT NULL, -- 공지사항 내용
    WDATE DATE CONSTRAINT NN_NOTICES_WDATE NOT NULL, -- 작성 일자
    WRITER VARCHAR2(10) CONSTRAINT NN_NOTICES_WRITER NOT NULL, -- 작성자 ID
    VIEWS NUMBER(10) CONSTRAINT NN_NOTICES_VIEWS NOT NULL, -- 조회수
    TAG VARCHAR2(50), -- 관련 태그
    CONSTRAINT FK_NOTICES_WRITER FOREIGN KEY (WRITER) REFERENCES MEMBERS(ID)
);

CREATE TABLE ORDERS(
    NO NUMBER(10) CONSTRAINT PK_ORDERS_NO PRIMARY KEY, -- 주문번호
    ID VARCHAR2(10) CONSTRAINT NN_ORDERS_ID NOT NULL, -- 주문한 ID
    CONCERTS_NO NUMBER(10) CONSTRAINT NN_ORDERS_CONCERTS_NO NOT NULL, -- 예매한 콘서트 번호 
    SEATS_NO VARCHAR2(5) CONSTRAINT NN_ORDERS_SEATS_NO NOT NULL, -- 예매한 좌석 번호
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
INSERT INTO MEMBERS VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'test', '1234', '테스트', '길동', '홍', '2021-05-25', 'M', '서울시', '010-1234-5678', 'tester', 0, 'test@test.com');
INSERT INTO MEMBERS VALUES(MEMBERS_NO_SEQ.NEXTVAL, 'hwisaek', '1234', 'hwisaek', '창민', '이', '2021-02-28', 'M', '서울시', '010-0000-0000', 'tester', 0, 'hwisaek@hwisaek.com');

-- 로그인 기능
SELECT PW FROM MEMBERS WHERE ID='test';

-- 아이디 찾기
SELECT ID FROM MEMBERS WHERE FIRST_NAME='길동' AND LAST_NAME='홍' AND EMAIL=LOWER('test@test.com');

-- 비밀번호 찾기
SELECT PW FROM MEMBERS WHERE ID='test' AND FIRST_NAME='길동' AND LAST_NAME='홍' AND TO_CHAR(BIRTHDATE, 'YYYY-MM-DD')='2021-02-02' AND PHONE='010-9999-9999';

-- 프로필 보기
SELECT NO,ID,NICKNAME,FIRST_NAME, LAST_NAME,TO_CHAR(BIRTHDATE, 'YYYY-MM-DD') AS BIRTHDATE,SEX,ADDRESS,PHONE,EMAIL FROM MEMBERS WHERE ID='test';

-- 프로필 변경하기
UPDATE MEMBERS SET NICKNAME='아이디수정', ADDRESS='경기도', BIRTHDATE=TO_DATE('2020-02-02', 'YYYY-MM-DD'), PHONE='010-9999-9999' WHERE ID='test';

-- 닉네임 중복 확인
SELECT COUNT(NICKNAME) FROM MEMBERS WHERE LOWER(NICKNAME)=LOWER('test');

-- 회원탈퇴 신청
UPDATE MEMBERS SET WITHDRAWAL=1 WHERE ID='test';

-- 공지사항 조회
SELECT * FROM NOTICES;

-- 공지사항 데이터 생성
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '안녕하세요', 'ㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇ', SYSDATE, 'test', 55, '장범준');
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '공지사항1', '공지사항입니다~', SYSDATE, 'test', 59, '10cm');
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '안녕하세요', 'ㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇ', SYSDATE, 'test', 55, '장범준');
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '공지사항1', '공지사항입니다~', SYSDATE, 'test', 59, '10cm');
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '안녕하세요', 'ㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇ', SYSDATE, 'test', 55, '장범준');
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '공지사항1', '공지사항입니다~', SYSDATE, 'test', 59, '10cm');
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '안녕하세요', 'ㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇ', SYSDATE, 'test', 55, '장범준');
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '공지사항1', '공지사항입니다~', SYSDATE, 'test', 59, '10cm');
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '안녕하세요', 'ㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇ', SYSDATE, 'test', 55, '장범준');
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '공지사항1', '공지사항입니다~', SYSDATE, 'test', 59, '10cm');
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '안녕하세요', 'ㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇ', SYSDATE, 'test', 55, '장범준');
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '공지사항1', '공지사항입니다~', SYSDATE, 'test', 59, '10cm');
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '안녕하세요', 'ㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇ', SYSDATE, 'test', 55, '장범준');
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '공지사항1', '공지사항입니다~', SYSDATE, 'test', 59, '10cm');
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '안녕하세요', 'ㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇ', SYSDATE, 'test', 55, '장범준');
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '공지사항1', '공지사항입니다~', SYSDATE, 'test', 59, '10cm');
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '안녕하세요', 'ㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇ', SYSDATE, 'test', 55, '장범준');
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '공지사항1', '공지사항입니다~', SYSDATE, 'test', 59, '10cm');
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '안녕하세요', 'ㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇ', SYSDATE, 'test', 55, '장범준');
INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, '공지사항1', '공지사항입니다~', SYSDATE, 'test', 59, '10cm');

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
INSERT INTO ARTISTS VALUES(ARTISTS_NO_SEQ.NEXTVAL, '장범준', '장범준은 밴드 ''버스커버스커''의 보컬이자 리더이다. 2011년 Mnet 오디션 프로그램 ''슈퍼스타K3''에서 준우승을 하며 화제에 올랐다. 이후 2012년 발표한 버스커버스커 1집 앨범의 타이틀곡인 ''벚꽃 엔딩''은 봄을 상징하는 ''봄캐롤'' 노래로 인정 받으며 매년 봄마다 음원 차트를 역주행하며 꾸준한 사랑을 받고 있다. 2016년 3월 25일, 장범준은 두번째 정규앨범 [장범준 2집]으로 컴백했으며, 박수봉 작가와 ''금세 사랑에 빠지는'' 이라는 브랜드 웹툰을 연재하기도 했다. 2019년 3월 21일, 3년 만의 정규앨범 [장범준 3집]이 발매되었고, 타이틀곡 ''당신과는 천천히'' 음원 차트 상위권을 차지하며 봄의 음원 강자로서의 면모를 보여주며,다시 한 번 입지를 굳혔다');
INSERT INTO ARTISTS VALUES(ARTISTS_NO_SEQ.NEXTVAL, '잔나비', '각종 커버곡과 [슈퍼스타K]를 통해 주목 받았던 독특한 청년들, 인디 밴드 ''잔나비'' \n멤버: 최정훈 (보컬), 김도형 (기타), 장경준 (베이스), 윤결 (드럼)\n밴드 ''잔나비''. 1992년 생으로 갓 20대에 들어선 청년 셋이 지은 신선하면서도 유쾌한 이름, 그게 딱 밴드 ''잔나비''였다. 잔나비, 원숭이가 가지고 있는 그 느낌처럼 분당 동네 친구 정훈(보컬), 도형(기타) 이들은 신나고 즐거우며 솔직한 청춘들이다. 잔나비밴드를 이야기할 때 빼놓을 수 없는 것은 [슈퍼스타K5]다. 잔나비밴드는 자신들이 어떤 밴드인지 많은 사람들에게 알리기 위해 오디션 프로그램을 택했다. 하지만 세 사람 중 정훈만 플랜비에 속해 본선에 진출했고 TOP7에 올랐다. 다른 두 멤버들의 응원이 있었기에 가능했다.\n밴드 잔나비는 이미 다수의 버스킹 공연과 홍대 클럽 공연을 펼쳐오며 실력을 검증받았으며 2014 펜타슈퍼루키에 선정되는 등 이미 두드러진 활약을 펼치며 존재감을 과시하고 있다. 밴드 잔나비는 지난 4월 28일 첫 싱글 [로켓트]를 발매해 인디 음악계의 새로운 돌풍을 일으켰다.');
INSERT INTO ARTISTS VALUES(ARTISTS_NO_SEQ.NEXTVAL, 'IU', '섬세하고 아련한 감성을 노래하는 아티스트 ''아이유''\n\n''노래를 위한 가수''보다 ''연예인이 되기 위한 가수''로 득실거리는 가요계의 쓸쓸한 현주소에서 음악이 아닌 것에 대한 생각은 한번도 가져보지 않은 소녀의 출현은 세상의 마음을 움직이기에 충분했다.\n\n''스타가 되는 것이 꿈이 아니라, 제 노래를 통해 사람들이 잃어버린 꿈을 찾게 해주는 것이에요..'' 오디션 통과의 순간부터 기획과 제작을 병행할 만큼 음악적인 재능과 끼를 보여주었으며, 힘든 녹음 기간 내내 완벽에 가까운 진행으로 모든 스탭들의 인정을 받은 신인 가수 ''아이유(IU)''. 데뷔 전부터 고유진, 원티드 등 여러 아티스트들의 Featuring과 chorus 등의 활동은 물론 거미, 휘성 등 대한민국 최고의 보컬리스트들로부터 극찬을 받으며 이미 아티스트로서의 자질을 인정받았다.\n\n어느덧 데뷔 10년 차 아티스트가 된 아이유. 10년이라는 시간의 무게처럼 깊이 있는 싱어송라이터 겸 프로듀서로도 점차 진화하고 있다. 여전히 보여줄 것이 무궁무진하다는 것을 알기에, 대중들로 하여금 아이유의 또 다른 10년을 기대케 한다.\n\n소속사 : EDAM엔터테인먼트');
INSERT INTO ARTISTS VALUES(ARTISTS_NO_SEQ.NEXTVAL, '10cm', '소규모 사운드로 거대한 감동을 추구하며 로맨스의 모든 면을 다루는 가사로 무장한 ''10cm''\n\n- 2009년 홍대 클럽을 중심으로 활동 시작.\n- 제이슨 므라즈의 영향을 받은 부분이 많으나 그와는 또다른 독자적인 세계를 가지고 있음.\n- 뉴욕 맨하탄 스타일의 스마트하고 도도하며 섹시함이 깃든 음악을 구현하고 있음.\n- 소규모 사운드로 거대한 감동을 추구하며 로맨스의 모든 면을 다루는 가사로 무장.\n\n분명히 10cm는 한국 음악계의 하나의 아이콘이다. 질펀한 가사와 달콤한 멜로디로 대중들을 사로잡은 10cm.\n인디 신에서 시작한 이 엉큼한 뮤지션은 한국 음악계의 인디와 메이저의 경계를 허문 장본인이기도 하다.\n‘오늘밤은 어둠이 무서워요’, ‘아메리카노’로 이름을 알린 2010년에는 한국 버스킹 1세대로써 홍대 씬의 ‘통기타와 젬베’ 열풍을 설명하는 척도였고, 연이어 꾸준히 발매된 앨범들을 통해 대체 불가의 존재로 거듭나게 되었다.\n탑 아이돌들과의 콜라버레이션, 각종 드라마 ost, 대형 페스티벌 등 섭외 1순위가 되었고, 식을 줄 모르는 열광 속에서 전 회 매진을 기록하는 단독 공연들로 명실상부 대한민국의 대표 인디밴드로 자리 잡았다.\n\n2017년, 멤버 윤철중의 탈퇴로 10cm는 권정열 1인체제로 변경하여 네 번째 정규앨범 [4.0]으로 활동을 이어나갔으며 2018년 발표한 싱글 [매트리스]로 다시 한번 음악차트 1위를 거머쥐며 음원 강자 10cm의 저력을 보여주었다.\n\n[AWARD]\n2016  제8회 멜론뮤직어워드 뮤직스타일상 포크블루스 부문\n2015  제7회 멜론뮤직어워드 포크부문\n2011  제8회 한국대중음악상 최우수 팝 노래 부문\n2010  M.NET 아시안 뮤직 어워드 올해의 발견상');
INSERT INTO ARTISTS VALUES(ARTISTS_NO_SEQ.NEXTVAL, '현아', '항상 새로운 장르의 음악과 퍼포먼스로 트렌드를 리드해나가는 진정한 퀸 ''''현아''!\n\n현아는 약 4년의 연습생 생활을 거쳐 2007년 원더걸스의 싱글 [The Wonder Begins]로 데뷔. 이후 2009년 큐브 엔터테인먼트로 소속을 옮겨 포미닛의 멤버로서 활발히 활동하기 시작했다. 이후 2010년 1월에는 첫 솔로 싱글 [Change], [Bubble Pop!], [A Talk] 등 발매하고 활발히 활동하여, 각 종 음반 차트에서 상위권을 유지하며 이 시대 트렌드 아이콘으로서 성공적인 행보를 보인다. 이후 장현승과 유닛 그룹 트러블 메이커를 결성해 2014년까지 활동하였고, 2016년 그룹 포미닛 해체 후 8월 1일 다섯 번째 EP 음반 [A''wesome]을 발매했다. 2017년 5월 펜타곤 멤버 후이, 이던과 함께 트리플 H로 활동하며 다양한 무대를 보여왔다.\n\n2017년 8월, 올해 데뷔 10주년을 맞은 현아는 새로운 미니앨범을 통해 기존에 보여주었던 그녀의 섹시함은 물론 색다른 모습을 보여 줄 예정이다. 언제나 다채로운 음악적인 색깔을 보여주는 현아는, 더욱 더 깊어진 음악적인 색깔과 새로운 모습을 보여줄 준비가 되었다.\n\n출생: 1992년 6월 6일\n신체: 164cm, 44kg\n소속그룹: 포미닛, 트러블 메이커, 트리플 H\n수상: 2015년 제24회 하이원 서울가요대상 댄스 퍼포먼스상');

-- 댓글 조회하기
SELECT * FROM COMMENTS;

-- 댓글 등록하기
INSERT INTO COMMENTS VALUES(COMMENTS_NO_SEQ.NEXTVAL, '장범준', 'test', '이것은 댓글입니다', '2021-01-02');

-- 콘서트 조회하기
SELECT * FROM CONCERTS;

-- 등록된 콘서트 개수 조회하기
SELECT COUNT(*) FROM CONCERTS;

-- 콘서트 목록 한 페이지의 데이터 조회 (페이지당 10개, 2페이지 조회)
SELECT *
FROM ( SELECT ROWNUM AS RNO, NO, ARTIST, TITLE, CONTENT, TO_CHAR(CDATE, 'YYYY-MM-DD'), LOCATION
            FROM CONCERTS C
            ORDER BY NO DESC)
WHERE RNO> 10 * (2 - 1) AND RNO<= 10 * 2;

-- 콘서트 등록하기
INSERT INTO CONCERTS VALUES(CONCERTS_NO_SEQ.NEXTVAL, '장범준', '제목', '장범준의 월드에 오신걸 환영합니다', '2021-01-01', '서울');
INSERT INTO CONCERTS VALUES(CONCERTS_NO_SEQ.NEXTVAL, '잔나비', '제목', '잔나비의 월드에 오신걸 환영합니다', '2021-02-02', '부산');
INSERT INTO CONCERTS VALUES(CONCERTS_NO_SEQ.NEXTVAL, 'IU', '제목', 'IU의 월드에 오신걸 환영합니다', '2021-03-03', '인천');
INSERT INTO CONCERTS VALUES(CONCERTS_NO_SEQ.NEXTVAL, '현아', '제목', '현아의 월드에 오신걸 환영합니다', '2021-04-04', '대전');
INSERT INTO CONCERTS VALUES(CONCERTS_NO_SEQ.NEXTVAL, '10cm', '제목', '10cm의 월드에 오신걸 환영합니다', '2021-05-05', '대구');
INSERT INTO CONCERTS VALUES(CONCERTS_NO_SEQ.NEXTVAL, '장범준', '제목', '장범준의 월드에 오신걸 환영합니다', '2021-01-02', '서울');
INSERT INTO CONCERTS VALUES(CONCERTS_NO_SEQ.NEXTVAL, '잔나비', '제목', '잔나비의 월드에 오신걸 환영합니다', '2021-02-03', '부산');
INSERT INTO CONCERTS VALUES(CONCERTS_NO_SEQ.NEXTVAL, 'IU', '제목', 'IU의 월드에 오신걸 환영합니다', '2021-03-04', '인천');
INSERT INTO CONCERTS VALUES(CONCERTS_NO_SEQ.NEXTVAL, '현아', '제목', '현아의 월드에 오신걸 환영합니다', '2021-04-05', '대구');
INSERT INTO CONCERTS VALUES(CONCERTS_NO_SEQ.NEXTVAL, '10cm', '제목', '10cm의 월드에 오신걸 환영합니다', '2021-05-06', '대전');
INSERT INTO CONCERTS VALUES(CONCERTS_NO_SEQ.NEXTVAL, '장범준', '제목', '장범준의 월드에 오신걸 환영합니다', '2021-01-03', '서울');
INSERT INTO CONCERTS VALUES(CONCERTS_NO_SEQ.NEXTVAL, '잔나비', '제목', '잔나비의 월드에 오신걸 환영합니다', '2021-02-04', '부산');
INSERT INTO CONCERTS VALUES(CONCERTS_NO_SEQ.NEXTVAL, 'IU', '제목', 'IU의 월드에 오신걸 환영합니다', '2021-03-05', '인천');
INSERT INTO CONCERTS VALUES(CONCERTS_NO_SEQ.NEXTVAL, '현아', '제목', '현아의 월드에 오신걸 환영합니다', '2021-04-06', '대구');
INSERT INTO CONCERTS VALUES(CONCERTS_NO_SEQ.NEXTVAL, '10cm', '제목', '10cm의 월드에 오신걸 환영합니다', '2021-05-07', '대전');
INSERT INTO CONCERTS VALUES(CONCERTS_NO_SEQ.NEXTVAL, '장범준','제목',  '장범준의 월드에 오신걸 환영합니다', '2021-01-04', '부산');
INSERT INTO CONCERTS VALUES(CONCERTS_NO_SEQ.NEXTVAL, '잔나비', '제목', '잔나비의 월드에 오신걸 환영합니다', '2021-02-05', '서울');
INSERT INTO CONCERTS VALUES(CONCERTS_NO_SEQ.NEXTVAL, 'IU', '제목', 'IU의 월드에 오신걸 환영합니다', '2021-03-06', '대구');
INSERT INTO CONCERTS VALUES(CONCERTS_NO_SEQ.NEXTVAL, '현아', '제목', '현아의 월드에 오신걸 환영합니다', '2021-04-07', '인천');
INSERT INTO CONCERTS VALUES(CONCERTS_NO_SEQ.NEXTVAL, '10cm', '제목', '10cm의 월드에 오신걸 환영합니다', '2021-05-08', '대전');
INSERT INTO CONCERTS VALUES(CONCERTS_NO_SEQ.NEXTVAL, '장범준', '제목', '장범준의 월드에 오신걸 환영합니다', '2021-01-04', '서울');
INSERT INTO CONCERTS VALUES(CONCERTS_NO_SEQ.NEXTVAL, '잔나비', '제목', '잔나비의 월드에 오신걸 환영합니다', '2021-02-05', '부산');
INSERT INTO CONCERTS VALUES(CONCERTS_NO_SEQ.NEXTVAL, 'IU', '제목', 'IU의 월드에 오신걸 환영합니다', '2021-03-06', '인천');
INSERT INTO CONCERTS VALUES(CONCERTS_NO_SEQ.NEXTVAL, '현아', '제목', '현아의 월드에 오신걸 환영합니다', '2021-04-07', '대전');
INSERT INTO CONCERTS VALUES(CONCERTS_NO_SEQ.NEXTVAL, '10cm', '제목', '10cm의 월드에 오신걸 환영합니다', '2021-05-08', '대구');
INSERT INTO CONCERTS VALUES(CONCERTS_NO_SEQ.NEXTVAL, '장범준', '제목', '장범준의 월드에 오신걸 환영합니다', '2021-01-05', '서울');
INSERT INTO CONCERTS VALUES(CONCERTS_NO_SEQ.NEXTVAL, '잔나비', '제목', '잔나비의 월드에 오신걸 환영합니다', '2021-02-06', '부산');
INSERT INTO CONCERTS VALUES(CONCERTS_NO_SEQ.NEXTVAL, 'IU', '제목', 'IU의 월드에 오신걸 환영합니다', '2021-03-07', '대전');
INSERT INTO CONCERTS VALUES(CONCERTS_NO_SEQ.NEXTVAL, '현아', '제목', '현아의 월드에 오신걸 환영합니다', '2021-04-08', '대구');
INSERT INTO CONCERTS VALUES(CONCERTS_NO_SEQ.NEXTVAL, '10cm', '제목', '10cm의 월드에 오신걸 환영합니다', '2021-05-09', '인천');

COMMIT;