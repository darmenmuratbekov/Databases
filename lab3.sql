create table students(
    full_name_students varchar NOT NULL ,
    age integer CHECK (age > 0 ),
    birth_date integer NOT NULL  ,
    gender varchar NOT NULL ,
    average_grade double precision NOT NULL ,
    info_about_student varchar,
    primary key (full_name_students)
);

create table instructors(
    full_name_instructors varchar NOT NULL ,
    speaking_languages varchar NOT NULL ,
    work_experience varchar ,
    possible_to_give_lesson_online varchar(3) NOT NULL,
    primary key (full_name_instructors)
);

create table lesson_participants(
    lesson_title varchar NOT NULL ,
    teaching_instructor varchar NOT NULL ,
    studying_students integer CHECK ( studying_students > 0 ) ,
    room_number varchar NOT NULL
);
