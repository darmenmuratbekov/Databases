create database fucking;
create table messsi
(
    id  serial,
    name  varchar(20),
    dept_name varchar(20),
    salary  integer
);

insert into  messsi (id,  name, dept_name, salary)
VALUES ('20000','darmen',  'kkkk',  10000);
VALUES ('200000','k', 'messi' ,  100000);

select *  from messsi;



create table dapartment
(    dept_name varchar(20)  check (char_length(dept_name)  > 3),
    building varchar(20) default 'main_bulding',
    budget integer check( budget > 0)

);


insert  into    dapartment(dept_name, building , budget)
VALUES('AKll', 'MALL_BACK', 500 );



SELECT *  from dapartment;

insert into  dapartment (dept_name, budget )
VALUES('AKKLL', 10000);
SELECT * from  dapartment;
