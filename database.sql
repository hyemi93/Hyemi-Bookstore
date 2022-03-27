/*관리자 테이블*/
drop table worker;
create table worker(          
    id          varchar2(20)  primary key,
    pwd         varchar2(20),
    name        varchar2(40),
    phone       varchar2(20)
);

/*테스트용 쿼리*/
insert into worker values('admin', 'admin', '관리자', '010-777-7777');

select * from worker;

/*회원 테이블*/
alter table member drop primary key cascade;
drop table member;
create table member(   
    id         varchar2(20)  primary key,
    pwd        varchar2(20),     
    name       varchar2(40),
    email      varchar2(40),
    zip_num    varchar2(7),
    address    varchar2(100),
    phone      varchar2(20),
    useyn      char(1)       default 'y',
    indate     date          default sysdate
);

/*테스트용 쿼리*/
insert into member(id, pwd, name, zip_num, address, phone) values
('one', '1111', '허혜미', '133-110', '서울시성동구성수동1가 1번지21호', '010-1234-5678');
insert into member(id, pwd, name, zip_num, address, phone) values
('two', '2222', '김혜미', '130-120', '서울시송파구잠실2동 리센츠 아파트 201동 505호', '010-1234-4567');

select * from member;

/*상품 테이블*/
alter table product drop primary key cascade;
drop table product;
create table product(
    pseq       number(5)     primary key,
    name       varchar2(100),
    kind       char(1),   
    price1     number(7)     default '0',
    price2     number(7)     default '0',
    writer     varchar2(30),
    publisher  varchar2(30),
    content    varchar2(1000),
    image      varchar2(50)  default 'default.jpg',
    useyn      char(1)       default 'y',
    bestyn     char(1)       default 'n',
    indate     date          default sysdate  
);

/*상품 번호 시퀀스*/
drop sequence product_seq;
create sequence product_seq start with 1;

/*테스트용 쿼리*/
insert into product(pseq, name, kind, price1, price2, writer, publisher, content, image, bestyn) values(
product_seq.nextval, '미드나잇 라이브러리', '1', '15800', '14200', '매트 헤이그', '인플루엔셜', '인생의 두 번째 기회에 대한 마법 같은 이야기', 'n1.jpg', 'y');
insert into product(pseq, name, kind, price1, price2, writer, publisher, content, image, bestyn) values(
product_seq.nextval, '센 강의 이름 모를 여인', '1', '16000', '14400', '기욤 뮈소', '밝은세상', '항공기 사고로 사망한 여인이 센 강에서 발견되었다.', 'n2.jpg', 'n');
insert into product(pseq, name, kind, price1, price2, writer, publisher, content, image, bestyn) values(
product_seq.nextval, '불편한 편의점', '1', '14000', '12600', '김호연', '나무옆의자', '힘겨운 시대를 살아가는 우리들에게 다가온 조금 특별한 편의점 이야기', 'n3.jpg', 'n');
insert into product(pseq, name, kind, price1, price2, writer, publisher, content, image, bestyn) values(
product_seq.nextval, '달러구트 꿈 백화점', '1', '24000', '21600', '이미예', '팩토리나인', '이 이야기는 책장을 덮은 뒤, 오늘 밤 당신의 꿈으로 이어집니다.', 'n4.jpg', 'n');
insert into product(pseq, name, kind, price1, price2, writer, publisher, content, image, bestyn) values(
product_seq.nextval, '파과', '1', '14000', '12600', '구병모', '위즈덤하우스', '짧은 시간 빛나다 사라질 살아 있는 모든 것들에 대한 뜨거운 찬사!', 'n5.jpg', 'n');
insert into product(pseq, name, kind, price1, price2, writer, publisher, content, image, bestyn) values(
product_seq.nextval, '그리하여 흘려 쓴 것들', '2', '12000', '10800', '이제니', '문학과지성사', '여백에서 태어난 세상 모든 목소리의 시', 'p1.jpg', 'y');
insert into product(pseq, name, kind, price1, price2, writer, publisher, content, image, bestyn) values(
product_seq.nextval, '불온한 검은 피', '2', '12000', '10800', '허연', '민음사', '부조리한 세계와의 지독한 불화와 사랑, 그 아름다운 신경질', 'p2.jpg', 'n');
insert into product(pseq, name, kind, price1, price2, writer, publisher, content, image, bestyn) values(
product_seq.nextval, '오은영의 화해', '2', '16000', '14400', '오은영', '코리아닷컴', '상처받아 울고 있는 나에게, 그런 자신을 미워했던 내가 화해의 손을 내밀다!', 'p3.jpg', 'n');
insert into product(pseq, name, kind, price1, price2, writer, publisher, content, image, bestyn) values(
product_seq.nextval, '꽃을 보듯 너를 본다', '2', '10000', '9000', '나태주', '지혜', '만인의 심금을 울릴 수 있는 서정시의 진수', 'p4.jpg', 'n');
insert into product(pseq, name, kind, price1, price2, writer, publisher, content, image, bestyn) values(
product_seq.nextval, '작은 별이지만 빛나고 있어', '2', '15000', '13500', '소윤', '북로망스', '하늘 위 수억 개의 별들 중 너라는 별은 유일한 존재니까', 'p5.jpg', 'n');
insert into product(pseq, name, kind, price1, price2, writer, publisher, content, image, bestyn) values(
product_seq.nextval, '세븐 테크', '3', '18000', '16200', '김미경', '웅진지식하우스', '디지털 혁명의 필수교양을 위해 각 분야 최고 전문가 8인이 한자리에 모였다', 'm1.jpg', 'n');
insert into product(pseq, name, kind, price1, price2, writer, publisher, content, image, bestyn) values(
product_seq.nextval, '같은 월급 다른 투자', '3', '22000', '19800', '핀업 스탁', '팬덤북스', '주식의 거래 원리부터 주식 실전 매매비법까지!', 'm2.jpg', 'y');
insert into product(pseq, name, kind, price1, price2, writer, publisher, content, image, bestyn) values(
product_seq.nextval, '뉴욕주민의 진짜 미국식 주식투자', '3', '24000', '21600', '뉴욕주민', '비즈니스북스', '이 책을 읽기 전에 미국 주식을 시작한다면 수익의 반은 버린 것과 같다!', 'm3.jpg', 'n');
insert into product(pseq, name, kind, price1, price2, writer, publisher, content, image, bestyn) values(
product_seq.nextval, '앞으로 10년 빅테크 수업', '3', '17000', '15300', '조원경', '페이지2북스', '10년 후 미래, 당신은 얼마나 준비돼 있는가?', 'm4.jpg', 'n');
insert into product(pseq, name, kind, price1, price2, writer, publisher, content, image, bestyn) values(
product_seq.nextval, '거꾸로 읽는 세계사', '4', '17500', '15750', '유시민', '돌베개', '한 시대를 풍미했던 베스트셀러의 귀환', 'h1.jpg', 'n');
insert into product(pseq, name, kind, price1, price2, writer, publisher, content, image, bestyn) values(
product_seq.nextval, '총 균 쇠', '4', '28000', '25200', '재레드 다이아몬드', '문학사상', '인류문명의 불균형은 총, 균, 쇠 때문이다!', 'h2.jpg', 'n');
insert into product(pseq, name, kind, price1, price2, writer, publisher, content, image, bestyn) values(
product_seq.nextval, '헤리티지: 대한민국의 유산', '4', '20000', '18000', '헤리티지 출판팀', '아크', '오늘 심은 여러분의 말이 대한민국의 미래가 됩니다.', 'h3.jpg', 'n');
insert into product(pseq, name, kind, price1, price2, writer, publisher, content, image, bestyn) values(
product_seq.nextval, '사계절 오동통 꽃자수', '5', '20000', '18000', '최부경', '팜파스', '좋아하는 일을 마음껏 행복하게!', 'y1.jpg', 'y');
insert into product(pseq, name, kind, price1, price2, writer, publisher, content, image, bestyn) values(
product_seq.nextval, '나만의 핸드메이드 천연비누', '5', '18000', '16200', '오혜리', '리스컴', '세상에 단 하나뿐인 나만의 디자인 비누', 'y2.jpg', 'n');
insert into product(pseq, name, kind, price1, price2, writer, publisher, content, image, bestyn) values(
product_seq.nextval, '코바늘로 뜨는 봄여름가을겨울', '5', '16000', '14400', '맨디 오설리번', '시그마북스', '좋아하는 색과 감각적인 디자인으로 사계절을 떠보자!', 'y3.jpg', 'n');

/*장바구니 테이블*/
alter table cart drop primary key cascade;
drop table cart;
create table cart (
  cseq         number(10)    primary key,  -- 장바구니번호
  oseq         number(10)    references orders(oseq),
  id           varchar(16)   references member(id),  -- 주문자 아이디(FK :　member.id) 
  pseq         number(5)     references product(pseq), -- 주문 상품번호(FK :product.pseq) 
  quantity     number(5)     default 1,        -- 주문 수량
  result       char(1)       default '1',      -- 1:미처리 2:처리
  indate       date          default SYSDATE   -- 주문일
);

/*장바구니 번호 시퀀스*/
drop sequence cart_seq;
create sequence cart_seq start with 1;

/*주문 테이블*/
alter table orders drop primary key cascade;
drop table orders;
create table orders(
  oseq        number(10)    primary key,           -- 주문번호  
  id          varchar(16)   references member(id), -- 주문자 아이디
  name        varchar(50),
  price       number,
  count2	  number,
  indate      date          default sysdate       -- 주문일
);

select * from orders;
drop sequence orders_seq;
create sequence orders_seq start with 1;

/*주문 상세 정보 테이블*/
alter table order_detail drop primary key cascade;
drop table order_detail;
create table order_detail(
  odseq       number(10)   primary key,        -- 주문상세번호
  oseq        number(10)   references orders(oseq),   -- 주문번호  
  pseq        number(5)    references product(pseq),  -- 상품번호
  quantity    number(5)    default 1,                 -- 주문수량
  result      char(1)      default '1'                -- 1: 미처리 2: 처리     
);
drop sequence order_detail_seq;
create sequence order_detail_seq start with 1;

/*Q&A 게시판 테이블*/
alter table qna drop primary key cascade;
drop table qna;
create table qna (
  qseq        number(5)    primary key,  -- 글번호 
  subject     varchar(300),            -- 제목
  content     varchar(1000),          -- 문의내용
  reply       varchar(1000),           -- 답변내용
  id          varchar(20),                 -- 작성자(FK : member.id) 
  rep         char(1)       default '1',        --1:답변 무  2:답변 유  
  indate      date default  sysdate     -- 작성일
); 
drop sequence qna_seq;
create sequence qna_seq start with 1;

/*테스트용 쿼리*/
insert into qna (qseq, subject, content, id)
values(qna_seq.nextval, '테스트', '질문내용1', 'one');
update qna SET reply='답변내용', rep='2';

insert into qna (qseq, subject, content, id)
values(qna_seq.nextval, '테스트2', '질문내용2', 'one');
commit;


-- 샘플 데이터 입력








create or replace view cart_view
as
select o.cseq, o.id, o.pseq, m.name mname, p.name pname, 
o.quantity, o.indate, p.price2, o.result, p.image, p.writer, p.publisher
from cart o, member m, product p 
where o.id = m.id and o.pseq = p.pseq
and result='1';

create or replace view order_view
as
select o.cseq, o.oseq, o.id, o.pseq, m.name mname, p.name pname, 
o.quantity, o.indate, p.price2, o.result, p.image, p.writer, p.publisher
from cart o, member m, product p 
where o.id = m.id and o.pseq = p.pseq
and result='2';

create or replace view order_view2
as
select d.odseq, o.oseq, o.id, o.indate, d.pseq,d.quantity, m.name mname,
m.zip_num, m.address, m.phone, p.name pname, p.price2, d.result, p.image   
from orders o, order_detail d, member m, product p 
where o.oseq=d.oseq and o.id = m.id and d.pseq = p.pseq;
           
-- 베스트 상품
create or replace view best_pro_view
as
select pseq, name, price2, image, writer, publisher
from( select rownum, pseq, name, price2, image, writer, publisher
      from product  
      where bestyn='y' 
      order by indate desc)
where  rownum <=4;

-- 신상품
create or replace view new_pro_view
as
select pseq, name, price2, image, writer, publisher
from( select rownum, pseq, name, price2, image, writer, publisher
      from product  
      where useyn='y' 
      order by indate desc)
where  rownum <=4;

select * from new_pro_view;
select * from best_pro_view;

select * from product;

select * from member;

select * from cart_view;
select * from order_view;

select * from orders;
select * from qna;
select * from order_detail;

select * from worker;
select * from cart;

select MAX(oseq) from orders
