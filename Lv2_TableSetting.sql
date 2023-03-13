--��� ���̺�
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
--Ʃ�� ���̺�
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

--ī�װ�
CREATE TABLE ch_category_2_3(
    cateno NUMBER,
    catename VARCHAR2(300) CONSTRAINT ch_cate_name_nn_2_3 NOT NULL,
    CONSTRAINT ch_cate_cateno_pk_2_3 PRIMARY KEY(cateno)
);

--Ŭ��������
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

-- �������̺�
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

/* �Ʒ� ������ Ŭ������û ���̺� ÷���� (�˻�Ű���� : 'Ŭ������û ���̺� ����(����)') 
--Ŭ������û���̺�(������û) ���� - ���� �Ϸ� ���� �������̺� insert��
--Ŭ���� ��¥/�ð� nn �ָ� �� �� ��, Ŭ�������� ������ ���� ���� ��� ����
CREATE TABLE ch_classReserve_2_3(
  crno NUMBER,  --Ŭ������û������ȣ
  cno NUMBER,  --�����󼼺������̺� Ŭ������ȣ ����
  id VARCHAR2(100),  --������̺� ȸ��id ����
  has_schedule CHAR(1) DEFAULT 'y',  --Ŭ�������� ���翩�� Ȯ��
  cdate VARCHAR2(100),  --Ŭ������¥
  ctime VARCHAR2(100),  --Ŭ�����ð�
  inwon NUMBER DEFAULT 1, --��û�ο�
  msg CLOB,  --���Ǹ޽���
  regdate DATE DEFAULT SYSDATE, --�����
  ok CHAR(1) DEFAULT 'n', --��û���ο���(y ���οϷ�/n ���δ��)
  CONSTRAINT ch_cr_crno_pk_2_3 PRIMARY KEY(crno),  --Ŭ������û������ȣ pk
  CONSTRAINT ch_cr_cno_fk_2_3 FOREIGN KEY(cno)  --�����󼼺������̺� Ŭ������ȣ fk
    REFERENCES ch_classDetail_2_3(cno) ON DELETE CASCADE,  --Ŭ���� ���� �� �ڵ� ����
  CONSTRAINT ch_cr_member_fk_2_3 FOREIGN KEY(id)  --������̺� ȸ��id fk
    REFERENCES ch_member_2_3(id) ON DELETE CASCADE,  --ȸ�� ���� �� �ڵ� ����
  CONSTRAINT ch_cr_sche_ck CHECK(has_schedule IN('y','n')),  --Ŭ�����������翩��  
  CONSTRAINT ch_cr_ok_ck CHECK(ok IN('y','n')),  --��û���ο��� ck
  CONSTRAINT ch_cr_inwon_ck CHECK(inwon>0)  --��û�ο� ck
);

CREATE SEQUENCE ch_cr_crno_seq_2_3
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

--Ŭ������¥���̺�(������¥) ����
CREATE TABLE ch_classDate_2_3(
  cdno NUMBER,
  cdate NUMBER CONSTRAINT ch_cd_cdate_nn_2_3 NOT NULL,
  ctime VARCHAR2(20) CONSTRAINT ch_cd_ctime_nn_2_3 NOT NULL,
  CONSTRAINT ch_cd_cdno_pk_2_3 PRIMARY KEY(cdno)
);

--Ŭ�����ð����̺�(�����ð�) ����
CREATE TABLE ch_classTime_2_3(
  ctno NUMBER,
  ctime VARCHAR2(20) CONSTRAINT ch_ct_ctime_nn_2_3 NOT NULL,
  CONSTRAINT ch_ct_ctno_pk_2_3 PRIMARY KEY(ctno)
);
*/
--�Խ������̺� ����
CREATE TABLE ch_board_2_3(
  bno NUMBER,  --�Խñ۰�����ȣ
  btype NUMBER CONSTRAINT ch_b_btype_nn_2_3 NOT NULL,  --�Խ��Ǳ���(1�� ��������/2�� ���͵�/3�� �����亯)
  id VARCHAR2(100),  --������̺� ȸ��id ����
  title VARCHAR2(300) CONSTRAINT ch_b_title_nn_2_3 NOT NULL,  --����
  content CLOB CONSTRAINT ch_b_cont_nn_2_3 NOT NULL,  --����
  regdate DATE DEFAULT SYSDATE,  --�����
  hit NUMBER DEFAULT 0,  --��ȸ��
  tag VARCHAR2(500),  --�±�
  CONSTRAINT ch_b_bno_pk_2_3 PRIMARY KEY(bno),  --�Խñ۰�����ȣ pk
  CONSTRAINT ch_b_id_fk_2_3 FOREIGN KEY(id)  --������̺� ȸ��id fk
    REFERENCES ch_member_2_3(id) ON DELETE CASCADE  --������̺� ȸ�� ���� �� �ڵ� ����
);

CREATE SEQUENCE ch_board_bno_seq_2_3
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;
--������̺� ����
CREATE TABLE ch_boardReply_2_3(
  brno NUMBER,  --��۰�����ȣ
  bno NUMBER,  --�Խñ۰�����ȣ ����
  id VARCHAR2(100),  --������̺� ȸ��id ����
  msg CLOB CONSTRAINT ch_br_msg_nn_2_3 NOT NULL, --��۳���
  regdate DATE DEFAULT SYSDATE, --�����
  group_id NUMBER CONSTRAINT ch_br_gi_nn_2_3 NOT NULL,  --��۱׷��ȣ
  group_step NUMBER DEFAULT 0,   --�׷� �� ����
  group_tab NUMBER DEFAULT 0,  --����ǰ���
  root NUMBER DEFAULT 0,  --�׷� �� �ֻ�����۹�ȣ
  depth NUMBER DEFAULT 0,  --�׷� �� ���� �Ѱ���
  CONSTRAINT ch_br_brno_pk_2_3 PRIMARY KEY(brno), --��۰�����ȣ pk
  CONSTRAINT ch_br_bno_fk_2_3 FOREIGN KEY(bno) --�Խñ۰�����ȣ ����
    REFERENCES ch_board_2_3(bno) ON DELETE CASCADE,  --�Խñ� ���� �� �ڵ� ����
  CONSTRAINT ch_br_id_fk_2_3 FOREIGN KEY(id)  --ȸ��������ȣ ����
    REFERENCES ch_member_2_3(id)
);
CREATE SEQUENCE ch_br_brno_seq_2_3
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;
--�Խñ� �±� ���̺� ����
CREATE TABLE ch_boardTag_2_3(
  btno NUMBER,  --�±װ�����ȣ
  bno NUMBER,  --�Խñ۰�����ȣ ����
  tag VARCHAR2(50) CONSTRAINT ch_bt_tag_nn_2_3 NOT NULL,  --�±׳���
  CONSTRAINT ch_bt_btno_pk_2_3 PRIMARY KEY(btno),  --�±װ�����ȣ pk
  CONSTRAINT ch_bt_bno_fk_2_3 FOREIGN KEY(bno)  --�Խñ۰�����ȣ fk
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

--Ŭ������û ���̺� ����(����)
CREATE TABLE ch_reserve_2_3(
  crno NUMBER,    --���������ȣ
  cno NUMBER,    --Ŭ����������ȣ ����
  id varchar2(100),    --�������̵� ����
  schedule VARCHAR2(500),    --����(null�� ��� '���� �� ��¥, �ð� ����')
  location VARCHAR2(500),    --����(ex ����)
  place VARCHAR2(500),    --���
  inwon NUMBER DEFAULT 1,    --��û�ο�
  totalprice NUMBER,    --����*��û�ο�
  msg CLOB,    --Ʃ�Ϳ��� ���ϴ� ��
  regdate DATE DEFAULT SYSDATE,   --�����û��
  ok CHAR(1) DEFAULT 'n',    --������ο���
  CONSTRAINT chr_crno_pk_2_3 PRIMARY KEY(crno),
  CONSTRAINT chr_cno_fk_2_3 FOREIGN KEY(cno)
    REFERENCES ch_classdetail_2_3(cno) ON DELETE CASCADE,
  CONSTRAINT chr_id_fk_2_3 FOREIGN KEY(id)
    REFERENCES ch_member_2_3(id) ON DELETE CASCADE,
  CONSTRAINT chr_ok_ck_2_3 CHECK(ok IN('y','n'))
);

--����
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