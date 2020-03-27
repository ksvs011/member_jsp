create table member(
id varchar2(50) unique,
password varchar2(16) not null,
name varchar2(15) not null,
reg_date timestamp);

select * from member;

drop table member;

commit;