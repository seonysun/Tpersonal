--멤버 테이블
CREATE TABLE ch_member_2_3(
    id VARCHAR2(100),
    pwd VARCHAR2(20) CONSTRAINT ch_member_pwd_nn_2_3 NOT NULL,
    tel VARCHAR2(20),
    name VARCHAR2(34) CONSTRAINT ch_member_name_nn_2_3 NOT NULL,
    nickname VARCHAR2(24),
    intro CLOB,
    image VARCHAR2(300),
    tutor CHAR(1) DEFAULT 'n',
    admin CHAR(1) DEFAULT 'n',
    CONSTRAINT ch_member_id_pk_2_3 PRIMARY KEY(id),
    CONSTRAINT ch_tutor_ck_2_3 CHECK (tutor IN('n','y')),
    CONSTRAINT ch_admin_ck_2_3 CHECK (admin IN('n','y'))
);
--튜터 테이블
CREATE TABLE ch_tutor_2_3(
    tno NUMBER,
    id VARCHAR2(100),
    CONSTRAINT ch_tutor_tno_pk_2_3 PRIMARY KEY(tno),
    CONSTRAINT ch_tutor_id_fk_2_3 FOREIGN KEY(id)
    REFERENCES ch_member_2_3(id) ON DELETE CASCADE
);

CREATE SEQUENCE ch_tutor_tno_seq
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

--카테고리
CREATE TABLE ch_category_2_3(
    cateno NUMBER,
    catename VARCHAR2(300) CONSTRAINT ch_cate_name_nn_2_3 NOT NULL,
    CONSTRAINT ch_cate_cateno_pk_2_3 PRIMARY KEY(cateno)
);

--클래스정보
CREATE TABLE ch_classDetail_2_3(
    cno NUMBER,
    title VARCHAR2(300) CONSTRAINT ch_cd_title_nn_2_3 NOT NULL,
    image VARCHAR2(2000),
    onoff VARCHAR2(100),
    info CLOB CONSTRAINT ch_cd_info_nn_2_3 NOT NULL,
    place VARCHAR2(50),
    location VARCHAR2(300),
    schedule CLOB,
    notice CLOB,
    inwon VARCHAR2(30) CONSTRAINT ch_cd_inwon_nn_2_3 NOT NULL,
    time VARCHAR2(100),
    perPrice VARCHAR2(150) CONSTRAINT ch_cd_perPrice_nn_2_3 NOT NULL,
    totalPrice VARCHAR2(200) CONSTRAINT ch_cd_totalPrice_nn_2_3 NOT NULL,
    jjim_count NUMBER DEFAULT 0,
    cateno NUMBER,
    tno NUMBER,
    CONSTRAINT ch_cd_cno_pk_2_3 PRIMARY KEY(cno),
    CONSTRAINT ch_cd_cateno_fk_2_3 FOREIGN KEY(cateno)
    REFERENCES ch_category_2_3(cateno),
    CONSTRAINT ch_cd_tno_fk_2_3 FOREIGN KEY(tno)
    REFERENCES ch_tutor_2_3(tno) ON DELETE CASCADE
);

CREATE SEQUENCE ch_cd_cno_seq_2_3
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

-- 리뷰테이블
CREATE TABLE ch_review_2_3(
    rno NUMBER,
    regdate DATE DEFAULT SYSDATE,
    content CLOB CONSTRAINT ch_rv_content_nn_2_3 NOT NULL,
    heart NUMBER DEFAULT 0,
    comment_count NUMBER DEFAULT 0,
    curriculum NUMBER CONSTRAINT ch_rv_curriculum_nn_2_3 NOT NULL,
    preparation NUMBER CONSTRAINT ch_rv_preparation_nn_2_3 NOT NULL,
    kindness NUMBER CONSTRAINT ch_rv_kindness_nn_2_3 NOT NULL,
    delivery NUMBER CONSTRAINT ch_rv_delivery_nn_2_3 NOT NULL,
    time NUMBER CONSTRAINT ch_rv_time_nn_2_3 NOT NULL,
    id VARCHAR2(100),
    cno NUMBER,
    CONSTRAINT ch_rv_rno_pk_2_3 PRIMARY KEY(rno),
    CONSTRAINT ch_rv_id_fk_2_3 FOREIGN KEY(id)
    REFERENCES ch_member_2_3(id) ON DELETE CASCADE,
    CONSTRAINT ch_rv_cno_fk_2_3 FOREIGN KEY(cno)
    REFERENCES ch_classDetail_2_3(cno) ON DELETE CASCADE
);

CREATE SEQUENCE ch_rv_rno_seq_2_3
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

/* 아래 수정한 클래스신청 테이블 첨부함 (검색키워드 : '클래스신청 테이블 생성(수정)') 
--클래스신청테이블(수업신청) 생성 - 결제 완료 이후 예약테이블에 insert됨
--클래스 날짜/시간 nn 주면 안 될 듯, 클래스마다 정해진 일정 없는 경우 있음
CREATE TABLE ch_classReserve_2_3(
  crno NUMBER,  --클래스신청고유번호
  cno NUMBER,  --수업상세보기테이블 클래스번호 참조
  id VARCHAR2(100),  --멤버테이블 회원id 참조
  has_schedule CHAR(1) DEFAULT 'y',  --클래스일정 존재여부 확인
  cdate VARCHAR2(100),  --클래스날짜
  ctime VARCHAR2(100),  --클래스시간
  inwon NUMBER DEFAULT 1, --신청인원
  msg CLOB,  --문의메시지
  regdate DATE DEFAULT SYSDATE, --등록일
  ok CHAR(1) DEFAULT 'n', --신청승인여부(y 승인완료/n 승인대기)
  CONSTRAINT ch_cr_crno_pk_2_3 PRIMARY KEY(crno),  --클래스신청고유번호 pk
  CONSTRAINT ch_cr_cno_fk_2_3 FOREIGN KEY(cno)  --수업상세보기테이블 클래스번호 fk
    REFERENCES ch_classDetail_2_3(cno) ON DELETE CASCADE,  --클래스 삭제 시 자동 삭제
  CONSTRAINT ch_cr_member_fk_2_3 FOREIGN KEY(id)  --멤버테이블 회원id fk
    REFERENCES ch_member_2_3(id) ON DELETE CASCADE,  --회원 삭제 시 자동 삭제
  CONSTRAINT ch_cr_sche_ck CHECK(has_schedule IN('y','n')),  --클래스일정존재여부  
  CONSTRAINT ch_cr_ok_ck CHECK(ok IN('y','n')),  --신청승인여부 ck
  CONSTRAINT ch_cr_inwon_ck CHECK(inwon>0)  --신청인원 ck
);

CREATE SEQUENCE ch_cr_crno_seq_2_3
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

--클래스날짜테이블(수업날짜) 생성
CREATE TABLE ch_classDate_2_3(
  cdno NUMBER,
  cdate NUMBER CONSTRAINT ch_cd_cdate_nn_2_3 NOT NULL,
  ctime VARCHAR2(20) CONSTRAINT ch_cd_ctime_nn_2_3 NOT NULL,
  CONSTRAINT ch_cd_cdno_pk_2_3 PRIMARY KEY(cdno)
);

--클래스시간테이블(수업시간) 생성
CREATE TABLE ch_classTime_2_3(
  ctno NUMBER,
  ctime VARCHAR2(20) CONSTRAINT ch_ct_ctime_nn_2_3 NOT NULL,
  CONSTRAINT ch_ct_ctno_pk_2_3 PRIMARY KEY(ctno)
);
*/
--게시판테이블 생성
CREATE TABLE ch_board_2_3(
  bno NUMBER,  --게시글고유번호
  btype NUMBER CONSTRAINT ch_b_btype_nn_2_3 NOT NULL,  --게시판구분(1번 자유주제/2번 스터디/3번 질문답변)
  id VARCHAR2(100),  --멤버테이블 회원id 참조
  title VARCHAR2(300) CONSTRAINT ch_b_title_nn_2_3 NOT NULL,  --제목
  content CLOB CONSTRAINT ch_b_cont_nn_2_3 NOT NULL,  --내용
  regdate DATE DEFAULT SYSDATE,  --등록일
  hit NUMBER DEFAULT 0,  --조회수
  tag VARCHAR2(500),  --태그
  CONSTRAINT ch_b_bno_pk_2_3 PRIMARY KEY(bno),  --게시글고유번호 pk
  CONSTRAINT ch_b_id_fk_2_3 FOREIGN KEY(id)  --멤버테이블 회원id fk
    REFERENCES ch_member_2_3(id) ON DELETE CASCADE  --멤버테이블 회원 삭제 시 자동 삭제
);

CREATE SEQUENCE ch_board_bno_seq_2_3
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;
--댓글테이블 생성
CREATE TABLE ch_boardReply_2_3(
  brno NUMBER,  --댓글고유번호
  bno NUMBER,  --게시글고유번호 참조
  id VARCHAR2(100),  --멤버테이블 회원id 참조
  msg CLOB CONSTRAINT ch_br_msg_nn_2_3 NOT NULL, --댓글내용
  regdate DATE DEFAULT SYSDATE, --등록일
  group_id NUMBER CONSTRAINT ch_br_gi_nn_2_3 NOT NULL,  --댓글그룹번호
  group_step NUMBER DEFAULT 0,   --그룹 내 순서
  group_tab NUMBER DEFAULT 0,  --댓글탭간격
  root NUMBER DEFAULT 0,  --그룹 내 최상위댓글번호
  depth NUMBER DEFAULT 0,  --그룹 내 대댓글 총개수
  CONSTRAINT ch_br_brno_pk_2_3 PRIMARY KEY(brno), --댓글고유번호 pk
  CONSTRAINT ch_br_bno_fk_2_3 FOREIGN KEY(bno) --게시글고유번호 참조
    REFERENCES ch_board_2_3(bno) ON DELETE CASCADE,  --게시글 삭제 시 자동 삭제
  CONSTRAINT ch_br_id_fk_2_3 FOREIGN KEY(id)  --회원고유번호 참조
    REFERENCES ch_member_2_3(id)
);
CREATE SEQUENCE ch_br_brno_seq_2_3
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;
--게시글 태그 테이블 생성
CREATE TABLE ch_boardTag_2_3(
  btno NUMBER,  --태그고유번호
  bno NUMBER,  --게시글고유번호 참조
  tag VARCHAR2(50) CONSTRAINT ch_bt_tag_nn_2_3 NOT NULL,  --태그내용
  CONSTRAINT ch_bt_btno_pk_2_3 PRIMARY KEY(btno),  --태그고유번호 pk
  CONSTRAINT ch_bt_bno_fk_2_3 FOREIGN KEY(bno)  --게시글고유번호 fk
    REFERENCES ch_board_2_3(bno) ON DELETE CASCADE
);

CREATE TABLE ch_alljjim_2_3(
    ajno NUMBER,
    id VARCHAR2(100),
    cno NUMBER,
    CONSTRAINT ch_aj_ajno_pk_2_3 PRIMARY KEY(ajno),
    CONSTRAINT ch_aj_id_fk_2_3 FOREIGN KEY(id)
    REFERENCES ch_member_2_3(id),
    CONSTRAINT ch_aj_cno_fk_2_3 FOREIGN KEY(cno)
    REFERENCES ch_classDetail_2_3(cno)
);

CREATE SEQUENCE ch_aj_ajno_seq_2_3
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE TABLE ch_faq_2_3(
  no NUMBER,
  cate_no NUMBER CONSTRAINT ch_faq_cateno_nn_2_3 NOT NULL,
  subject VARCHAR2(1000) CONSTRAINT ch_faq_sub_nn_2_3 NOT NULL,
  content CLOB CONSTRAINT ch_faq_cont_nn_2_3 NOT NULL,
  CONSTRAINT ch_faq_no_pk_2_3 PRIMARY KEY(no)
);

CREATE SEQUENCE ch_faq_no_seq_2_3
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE TABLE ch_chatfaq_2_3(
  cno NUMBER CONSTRAINT ch_cfaq_cno_nn_2_3 NOT NULL,
  cdno NUMBER CONSTRAINT ch_cfaq_cdno_nn_2_3 NOT NULL,
  subject VARCHAR2(1000) CONSTRAINT ch_cfaq_sub_nn_2_3 NOT NULL,
  content CLOB CONSTRAINT ch_cfaq_content_nn_2_3 NOT NULL
);

--클래스신청 테이블 생성(수정)
CREATE TABLE ch_reserve_2_3(
  crno NUMBER,    --예약고유번호
  cno NUMBER,    --클래스고유번호 참조
  id varchar2(100),    --유저아이디 참조
  schedule VARCHAR2(500),    --일정(null인 경우 '협의 후 날짜, 시간 결정')
  location VARCHAR2(500),    --지역(ex 신촌)
  place VARCHAR2(500),    --장소
  inwon NUMBER DEFAULT 1,    --신청인원
  totalprice NUMBER,    --가격*신청인원
  msg CLOB,    --튜터에게 전하는 말
  regdate DATE DEFAULT SYSDATE,   --예약신청일
  ok CHAR(1) DEFAULT 'n',    --예약승인여부
  CONSTRAINT chr_crno_pk_2_3 PRIMARY KEY(crno),
  CONSTRAINT chr_cno_fk_2_3 FOREIGN KEY(cno)
    REFERENCES ch_classdetail_2_3(cno) ON DELETE CASCADE,
  CONSTRAINT chr_id_fk_2_3 FOREIGN KEY(id)
    REFERENCES ch_member_2_3(id) ON DELETE CASCADE,
  CONSTRAINT chr_ok_ck_2_3 CHECK(ok IN('y','n'))
);

--쪽지
create table ch_text_2_3(
    tno number,
    id varchar2(100),
    msg clob,
    receiver varchar2(100) CONSTRAINT ch_t_re_nn_2_3 NOT NULL,
    regdate date default sysdate,
    ok varchar2(2) default 'n',
    constraint ch_t_tno_pk_2_3 primary key(tno),
    CONSTRAINT ch_t_id_fk_2_3 FOREIGN KEY(id)
    REFERENCES ch_member_2_3(id) ON DELETE CASCADE
);