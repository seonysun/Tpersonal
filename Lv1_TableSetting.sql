-- 회원정보
CREATE TABLE god_member_3 (
    id VARCHAR2(20),
    pwd VARCHAR2(10) CONSTRAINT gm_pwd_nn_3 NOT NULL,
    name VARCHAR2(34) CONSTRAINT gm_name_nn_3 NOT NULL,
    sex VARCHAR2(6),
    brithday VARCHAR2(20) CONSTRAINT gm_brithday_nn_3 NOT NULL,
    email VARCHAR2(50),
    post VARCHAR2(7) CONSTRAINT gm_post_nn_3 NOT NULL,
    addr1 VARCHAR2(200) CONSTRAINT gm_addr1_nn_3 NOT NULL,
    addr2 VARCHAR2(200),
    phone VARCHAR2(20) CONSTRAINT gm_phone_nn_3 NOT NULL,
    admin CHAR(1) DEFAULT 'n',
    CONSTRAINT gm_id_pk_3 PRIMARY KEY(id),
    CONSTRAINT gm_sex_ck_3 CHECK(sex IN('남자', '여자')),
    CONSTRAINT gm_email_uk_3 UNIQUE(email),
    CONSTRAINT gm_phone_uk_3 UNIQUE(phone),
    CONSTRAINT gm_admin_ck_3 CHECK(admin IN('y', 'n'))
);

-- 전시회정보
CREATE TABLE god_exhibition_3(
    geno NUMBER,
    poster VARCHAR2(260) CONSTRAINT ge_poster_nn_3 NOT NULL,
    title VARCHAR2(150) CONSTRAINT ge_title_nn_3 NOT NULL,
    title2 VARCHAR2(150),
    kind VARCHAR2(60),
    period VARCHAR2(100) CONSTRAINT ge_period_nn_3 NOT NULL,
    loc VARCHAR2(60) CONSTRAINT ge_loc_nn_3 NOT NULL,
    loc2 VARCHAR2(100),
    area VARCHAR2(200),
    area2 VARCHAR2(200),
    item CLOB,
    host VARCHAR2(450),
    url VARCHAR2(200),
    price CLOB,
    time VARCHAR2(400),
    hashtag CLOB,
    good NUMBER DEFAULT 0,
    content CLOB,
    CONSTRAINT ge_geno_pk_3 PRIMARY KEY(geno)
);

-- 전시회 시퀀스
CREATE SEQUENCE ge_geno_seq_3
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
    
-- 한줄 리뷰
CREATE TABLE god_review_3 (
    grno NUMBER,
    msg VARCHAR(90) CONSTRAINT gr_msg_nn_3 NOT NULL,
    regdate DATE DEFAULT SYSDATE,
    id VARCHAR2(20),
    geno NUMBER,
    CONSTRAINT gr_grno_pk_3 PRIMARY KEY(grno),
    CONSTRAINt gr_id_fk_3 FOREIGN KEY(id)
    REFERENCES god_member_3(id),
    CONSTRAINT gr_geno_fk_3 FOREIGN KEY(geno)
    REFERENCES god_exhibition_3(geno)  
);

-- 좋아요
CREATE TABLE god_like_3 (
    glno NUMBER,
    id VARCHAR2(20),
    geno NUMBER,
    CONSTRAINT gl_glno_pk_3 PRIMARY KEY(glno),
    CONSTRAINT gl_id_fk_3 FOREIGN KEY(id)
    REFERENCES god_member_3(id),
    CONSTRAINT gl_geno_fk_3 FOREIGN KEY(geno)
    REFERENCES god_exhibition_3(geno)
);

-- 전시회 예약
CREATE TABLE god_exhibition_reserve_3 (
    gerno NUMBER,
    rdate VARCHAR2(30) CONSTRAINT ger_rdate_nn_3 NOT NULL,
    rtime VARCHAR2(20) CONSTRAINT ger_rtime_nn_3 NOT NULL,
    inwon NUMBER CONSTRAINT ger_inwon_nn_3 NOT NULL,
    ok VARCHAR2(10) CONSTRAINT ger_ok_nn_3 NOT NULL,
    geno NUMBER,
    id VARCHAR2(20),
    CONSTRAINT ger_gerno_pk_3 PRIMARY KEY(gerno),
    CONSTRAINT ger_inwon_ck_3 CHECK(inwon > 0),
    CONSTRAINT ger_geno_fk_3 FOREIGN KEY(geno)
    REFERENCES god_exhibition_3(geno),
    CONSTRAINT ger_id_fk_3 FOREIGN KEY(id)
    REFERENCES god_member_3(id)
);

-- 예약날짜
CREATE TABLE god_reserve_date_3 (
    grdno NUMBER,
    rdate NUMBER CONSTRAINT grd_radte_nn_3 NOT NULL,
    CONSTRAINT grd_grdno_pk_3 PRIMARY KEY(grdno)
);

-- 예약시간
CREATE TABLE god_reserve_time_3 (
    grtno NUMBER,
    time VARCHAR2(10) CONSTRAINT grt_time_nn_3 NOT NULL,
    CONSTRAINT grt_grtno_pk_3 PRIMARY KEY(grtno)
);

-- 그림정보
CREATE TABLE god_picture_3 (
    gpno NUMBER,
    image VARCHAR2(260) CONSTRAINT gp_image_nn_3 NOT NULL,
    title VARCHAR2(150) CONSTRAINT gp_title_nn_3 NOT NULL,
    name VARCHAR2(60) CONSTRAINT gp_name_nn_3 NOT NULL,
    content CLOB,
    CONSTRAINT gp_gpno_pk_3 PRIMARY KEY(gpno)
);

-- 그림 시퀀스
CREATE SEQUENCE gp_gpno_seq_3
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

-- 공지사항
CREATE TABLE god_notice_board_3(
    gnbno NUMBER,
    name VARCHAR2(34) CONSTRAINT gnb_name_nn_3 NOT NULL,
    subject VARCHAR2(300) CONSTRAINT gnb_subject_nn_3 NOT NULL,
    content CLOB CONSTRAINT gnb_content_nn_3 NOT NULL,
    regdate DATE DEFAULT SYSDATE,
    type VARCHAR2(30),
    hit NUMBER DEFAULT 0,
    CONSTRAINT gnb_gnbno_pk_3 PRIMARY KEY(gnbno)
);

-- 후기 게시판
CREATE TABLE god_review_board_3(
    grbno NUMBER,
    name VARCHAR2(34) CONSTRAINT grb_name_nn_3 NOT NULL,
    subject VARCHAR2(300) CONSTRAINT grb_subject_nn_3 NOT NULL,
    display_name VARCHAR2(300) CONSTRAINT grb_dn_nn_3 NOT NULL,
    content CLOB CONSTRAINT grb_content_nn_3 NOT NULL,
    regdate DATE DEFAULT SYSDATE,
    type VARCHAR2(30),
    hit NUMBER DEFAULT 0,
    id VARCHAR2(20),
    CONSTRAINT grb_grbno_pk_3 PRIMARY KEY(grbno),
    CONSTRAINT grb_id_fk_3 FOREIGN KEY(id)
    REFERENCES god_member_3(id)
);

-- 이벤트 게시판
CREATE TABLE god_event_board_3(
    gebno NUMBER,
    name VARCHAR2(300) CONSTRAINT geb_name_nn_3 NOT NULL,
    subject VARCHAR2(300) CONSTRAINT geb_subject_nn_3 NOT NULL,
    poster VARCHAR2(300) CONSTRAINT geb_poster_nn_3 NOT NULL,
    content CLOB CONSTRAINT geb_content_nn_3 NOT NULL,
    regdate DATE DEFAULT SYSDATE,
    type VARCHAR2(30),
    hit NUMBER DEFAULT 0,
    progress_status VARCHAR2(300) CONSTRAINT geb_ps_nn_3 NOT NULL,
    event_date VARCHAR2(300) CONSTRAINT geb_ed_nn_3 NOT NULL,
    id VARCHAR2(20),
    CONSTRAINT geb_gebno_pk_3 PRIMARY KEY(gebno),
    CONSTRAINT geb_id_fk_3 FOREIGN KEY(id)
    REFERENCES god_member_3(id)
);

-- 댓글
CREATE TABLE god_board_reply_3(
    gbrno NUMBER,
    name VARCHAR2(34) CONSTRAINT gbr_name_nn_3 NOT NULL,
    msg CLOB CONSTRAINT gbr_msg_nn_3 NOT NULL,
    regdate DATE DEFAULT SYSDATE,
    group_id NUMBER CONSTRAINT gbr_gi_nn_3 NOT NULL,
    group_step NUMBER DEFAULT 0,
    group_tab NUMBER DEFAULT 0,
    root NUMBER DEFAULT 0,
    depth NUMBER DEFAULT 0,
    id VARCHAR2(20),
    grbno NUMBER,
    CONSTRAINT gbr_gbrno_pk_3 PRIMARY KEY(gbrno),
    CONSTRAINT gbr_grbno_fk_3 FOREIGN KEY(grbno)
    REFERENCES god_review_board_3(grbno),
    CONSTRAINT gbr_id_fk_3 FOREIGN KEY(id)
    REFERENCES god_member_3(id)
);

-- 1:1문의
CREATE TABLE god_ask_3(
    gano NUMBER,
    subject VARCHAR2(1000) CONSTRAINT ga_sub_nn_3 NOT NULL,
    type VARCHAR2(20) CONSTRAINT ga_type_nn_3 NOT NULL,
    content CLOB CONSTRAINT ga_cont_nn_3 NOT NULL,
    pwd VARCHAR2(20) CONSTRAINT ga_pwd_nn_3 NOT NULL,
    regdate DATE DEFAULT SYSDATE,
    ans_state VARCHAR2(20) DEFAULT '미답변',
    hit NUMBER DEFAULT 0,
    group_id NUMBER CONSTRAINT ga_gid_nn_3 NOT NULL,
    group_step NUMBER DEFAULT 0,
    group_tab NUMBER DEFAULT 0,
    root NUMBER DEFAULT 0,
    depth NUMBER DEFAULT 0,
    id VARCHAR2(20),
    CONSTRAINT ga_gano_pk_3 PRIMARY KEY(gano),
    CONSTRAINT ga_id_fk_3 FOREIGN KEY(id)
    REFERENCES god_member_3(id),
    CONSTRAINT ga_astate_ch_3 CHECK(ans_state IN('미답변','답변완료'))
);

-- 문의 시퀀스
CREATE SEQUENCE ga_gano_seq_3
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

-- FAQ
CREATE TABLE god_faq_3(
    gfno NUMBER,
    type VARCHAR2(20) CONSTRAINT gf_type_nn_3 NOT NULL,
    subject VARCHAR2(1000) CONSTRAINT gf_sub_nn_3 NOT NULL, 
    content CLOB CONSTRAINT gf_cont_nn_3 NOT NULL,
    hit NUMBER DEFAULT 0,
    CONSTRAINT gf_gfno_pk_3 PRIMARY KEY(gfno)
);

-- FAQ 시퀀스
CREATE SEQUENCE gf_gfno_seq_3
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
