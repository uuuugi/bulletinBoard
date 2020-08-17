show databases;

create database bulletinBoardDB;

use bulletinBoardDB;

create table user(
id varchar(20) not null unique,
pw varchar(20)
);

create table board(
id varchar(20) not null,
name varchar(20)  not null,
text varchar(10000),
star int default 0,
num int auto_increment unique,
constraint fk_user2board foreign key (id) references user (id) on update cascade on delete cascade
);

create table comment(
id varchar(20) not null,
text varchar(300) not null,
num int auto_increment unique,
constraint fk_board2comment foreign key(num) references board (num) on update cascade on delete cascade,
constraint fk_comment2user foreign key(id) references user(id) on update cascade on delete cascade
);

-- insert
insert into user
values('id2', 'pw2');

insert into board(id, name, text)
values('id1','test2', 'text1');

insert into comment(id, text, num)
values('id2', 'comment', 1);

-- select
select * from user;
select * from board;
select * from comment;

-- drop
drop table user;
drop table board;
drop table comment;