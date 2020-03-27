create table member(
num number(10) primary key,
id varchar2(50) unique,
password varchar2(16) not null,
name varchar2(15) not null,
email varchar2(50) not null,
phonenum number(12) not null,
reg_date timestamp);

select * from member;

desc member; 

INSERT INTO MEMBER VALUES ((SELECT NVL(MAX(NUM),0)+1 FROM MEMBER),'admin','admin','°ü¸®ÀÚ','abc@abc','01012345678',CURRENT_TIMESTAMP);
INSERT INTO MEMBER VALUES ((SELECT NVL(MAX(NUM),0)+1 FROM MEMBER),'?','?','?','?','?',CURRENT_TIMESTAMP);

commit;