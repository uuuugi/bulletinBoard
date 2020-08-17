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
select name from board where id='id'; -- id값으로 작성글 검색
select name from board where name='name'; -- 글 이름으로 글 검색

select * from comment;
select text from comment where id='id'; -- id값으로 댓글 검색
select text from comment where num='1'; -- num 값으로 댓글 검색(board에 있는 작성글 a에 대한 댓글을 검색할 때 사용한다.)

-- drop
drop table user;
drop table board;
drop table comment;