-- ȸ�� ���̺�
create table member(
    id varchar2(50) primary key,
    pw varchar2(100) not null,
    name varchar2(30) not null,
    email varchar2(100),
    post varchar2(30),
    addr1 varchar2(100),
    addr2 varchar2(100),
    tel varchar2(30),
    adminck number(1) default 0 not null
);
desc member;
select * from member;
drop table member;
commit;


-- ī�װ� ���̺�
create table category(
tier number(1),
cateName VARCHAR2(30) not null,
cateCode VARCHAR2(30)not null,
cateParent VARCHAR2(30),
PRIMARY KEY(cateCode)
);
desc category;
select * from category;
drop table category;
commit;

-- ī�װ� insert
insert into category(cateCode, cateName) values(1, '��Ǿ ��');
insert into category(cateCode, cateName) values(2, '�������ٵ�');
insert into category(cateCode, cateName) values(3, '��Ǿ');
insert into category(cateCode, cateName) values(4, '��Ǿ ��');
insert into category(cateCode, cateName) values(5, '����Ƽ�� ĵ��');
insert into category(cateCode, cateName) values(6, '��Ǿ �ڵ�');
insert into category(cateCode, cateName) values(7, 'Ʃ�� �ڵ�');
insert into category(cateCode, cateName) values(8, '�ڵ�عٵ�');
insert into category(cateCode, cateName) values(9, 'ü�� �ڵ�');
insert into category(cateCode, cateName) values(10, '�� �ҵ���');
insert into category(cateCode, cateName) values(11, '�� ������Ʈ');
insert into category(cateCode, cateName) values(12, '���� ŰƮ');
insert into category(cateCode, cateName) values(13, '��Ƽ�����׷���');


-- prodNum ������
create sequence prod_seq start with 1 increment by 1;
drop sequence prod_seq;
-- ��ǰ���� ���̺�
create table product (
    prodNum number primary key,
    categoryNum number not null,
    prodName varchar2(100) not null,
    price number not null,
    img1 varchar2(50) not null,
    img2 varchar2(50),
    img3 varchar2(50),
    prodInfo varchar2(1000),
    stock number default 0
);
desc product;
select * from product;
delete from product;
drop table product;
commit;

-- cartNum ������
create SEQUENCE cart_seq INCREMENT by 1 start with 1;
drop sequence cart_seq;
--īƮ ���̺�
create table cart(
cartNum number primary key,
prodNum number,
id varchar2(50),
cartCount number
);
desc cart;
select * from cart;
drop table cart;
commit;

-- orderNum ������
create sequence order_seq start with 1 increment by 1;
drop sequence order_seq;
-- �ֹ� ���̺�
create table orderlist (
    orderNum number primary key,
    id varchar2(50) not null,
    orderPrice number default 0 not null,
    orderDate date default sysdate not null,
    orderPay varchar2(50) not null,
    orderStatus varchar2(30) not null,    --��ǰ�غ�->����غ�->�����->��ۿϷ� //�ֹ����
    orderRecv varchar2(30) not null,
    orderPost varchar2(10) not null,
    orderAddr1 varchar2(100) not null,
    orderAddr2 varchar2(100) not null,
    orderMsg varchar2(1000),
    orderPointIn number(10),
    orderPointOut number(10) default 0,
    mainImg varchar2(100),
    mainProd varchar2(50)
);
desc orderlist;
select * from orderlist;
drop table orderlist;
commit;

-- orderDetail ������
create sequence od_seq start with 1 increment by 1;
drop sequence od_seq;
-- �ֹ��� ���̺�
create table orderDetail(
    odNum number primary key,
    orderNum number not null,
    prodNum number not null,
    odStock number default 1 not null,
    odPrice number not null
);
desc orderDetail;
select * from orderDetail;
drop table orderDetail;
commit;

-- ������ sequence
create sequence point_seq start with 1 increment by 1;
drop sequence point_seq;
-- ������ 
create table point(
    pointNum number primary key,
    id varchar2(50) not null,
    point number not null,
    pointStatus number not null,    -- 0: ���� ������, 1: ����� ������
    pointContent varchar2(200)
);
desc point;
select * from point;
drop table point;
commit;

-- review sequence
create sequence re_seq start with 1 increment by 1;
drop sequence re_seq;
-- ��ǰ�ı� table
create table review (
    reNum number not null,
    prodNum number not null,
    id varchar2(50) not null,
    reContent varchar2(1000)
);
desc review;
select * from review;
drop table review;
commit;

-- Q&A sequence
create sequence qna_seq start with 1 increment by 1;
drop sequence qna_seq;
-- Q&A ���̺�
create table qna(
qnaNum number primary key,
qnaStatus varchar2(100) not null,
qnaTitle varchar2(100) not null,
prodNum number not null,
id varchar2(50) not null,
qnaPw number(4) not null,
qnaContent varchar2(3000),
anqContent varchar2(3000),
qnaPostDate date not null,
anqPostDate date
);
desc qna;
select * from qna;
drop table qna;
commit;

-- Q&A sequence
create sequence notice_seq start with 1 increment by 1;
-- �������� ���̺�
create table notice(
    noticeNum number(30) unique,
    noticeTitle varchar2(100),
    noticeContent varchar2(3000),
    postDate date default sysdate
);
desc notice;
select * from notice;
drop table notice;
commit;