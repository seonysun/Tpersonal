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
    rtime VARCHAR2(50),
    CONSTRAINT grd_grdno_pk_3 PRIMARY KEY(grdno)
);

-- 예약시간
CREATE TABLE god_reserve_time_3 (
    grtno NUMBER,
    time VARCHAR2(50) CONSTRAINT grt_time_nn_3 NOT NULL,
    CONSTRAINT grt_grtno_pk_3 PRIMARY KEY(grtno)
);