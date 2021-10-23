create database  Lecture3_example4;

create table mesi(
    name serial,
    dept_name varchar(20),
    building varchar(20)
);
insert into mesi(name, dept_name,  building )
values  (1,  'DARMEN',  'GIT');
select * from mesi;

update mesi
set building =  'GITl'
where  building  =  'GIT';

select  *  from  mesi;
