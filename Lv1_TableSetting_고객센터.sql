CREATE TABLE god_keyword_3(
    gkno NUMBER,
    keyword VARCHAR2(100),
    id VARCHAR2(20),
    CONSTRAINT gk3_pkno_pk PRIMARY KEY(pkno),
    CONSTRAINT gk3_id_fk FOREIGN KEY(id)
        REFERENCES god_member_3(id)
);
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
    msg CLOB CONSTRAINT ga_msg_nn_3 NOT NULL,
    root NUMBER DEFAULT 0,
    depth NUMBER DEFAULT 0,
    id VARCHAR2(20),
    CONSTRAINT ga_gano_pk_3 PRIMARY KEY(gano),
    CONSTRAINT ga_id_fk_3 FOREIGN KEY(id)
    REFERENCES god_member_3(id),
    CONSTRAINT ga_astate_ch_3 CHECK(ans_state IN('미답변','답변완료'))
);
CREATE SEQUENCE ga_gano_seq_3
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
CREATE TABLE god_faq_3(
    gfno NUMBER,
    type VARCHAR2(20) CONSTRAINT gf_type_nn_3 NOT NULL,
    subject VARCHAR2(1000) CONSTRAINT gf_sub_nn_3 NOT NULL, 
    content CLOB CONSTRAINT gf_cont_nn_3 NOT NULL,
    hit NUMBER DEFAULT 0,
    CONSTRAINT gf_gfno_pk_3 PRIMARY KEY(gfno)
);