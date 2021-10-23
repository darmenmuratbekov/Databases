

create database Lecture3_example3;
create table dapartment
(    dept_name varchar(20)  check (char_length(dept_name)  > 3),
    building varchar(20),
    name text  CHECK (char_length(name) > 0) default   'da',
    budget integer check( budget > 0)


);


insert  into    dapartment(dept_name, building , name,  budget)
VALUES('AKll', 'MALL_BACK', 500 );
VALUES('LLLL','MALL_BACK', 5000);
 /* VALUES('LLLLLL',  'MALL_BACK', default, 10) */
 
