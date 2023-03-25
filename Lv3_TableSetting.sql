show databases;
/*
create database mydb character set utf8 collate utf8_general_ci;
number = int, double
varchar2 = varchar
clob = text
date = datetime
nvl = ifnull
TO_CHAR = date_format
'%'||A||'%' = concat('%',값,'%')
*/
use mydb;

create table board(
	no int auto_increment,
    name varchar(34) not null,
    subject varchar(1000) not null,
    content text not null,
    pwd varchar(10) not null,
    regdate datetime default now(),
    hit int default 0,
    primary key(no)
);
insert into board(name,subject,content,pwd) 
values('홍길동','JPA를 이용한 게시판 CRUD','JPA를 이용한 게시판 CRUD','1234');
select * from board;