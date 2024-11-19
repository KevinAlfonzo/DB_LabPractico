-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-11-19 20:56:37.81

-- tables
-- Table: campus
CREATE TABLE campus (
    code char(4)  NOT NULL,
    register_date date  NOT NULL,
    name varchar(100)  NOT NULL,
    description varchar(150)  NOT NULL,
    place varchar(150)  NOT NULL,
    status char(1)  NOT NULL,
    CONSTRAINT campus_pk PRIMARY KEY  (code)
);

-- Table: careers
CREATE TABLE careers (
    id int  NOT NULL,
    names varchar(150)  NOT NULL,
    descriptions varchar(2500)  NOT NULL,
    durations int  NOT NULL,
    register_date date  NOT NULL,
    status char(1)  NOT NULL,
    CONSTRAINT careers_pk PRIMARY KEY  (id)
);

-- Table: careers_detail
CREATE TABLE careers_detail (
    id int  NOT NULL,
    careers_id int  NOT NULL,
    course_code char(4)  NOT NULL,
    teachers_id int  NOT NULL,
    CONSTRAINT careers_detail_pk PRIMARY KEY  (id)
);

-- Table: course
CREATE TABLE course (
    code char(4)  NOT NULL,
    names varchar(150)  NOT NULL,
    credits int  NOT NULL,
    status char(1)  NOT NULL,
    CONSTRAINT course_pk PRIMARY KEY  (code)
);

-- Table: enrollment
CREATE TABLE enrollment (
    id int  NOT NULL,
    register_date date  NOT NULL,
    student_id int  NOT NULL,
    seller_code char(4)  NOT NULL,
    careers_id int  NOT NULL,
    campus_code char(4)  NOT NULL,
    price decimal(8,2)  NOT NULL,
    start_date date  NOT NULL,
    status char(1)  NOT NULL,
    CONSTRAINT enrollment_pk PRIMARY KEY  (id)
);

-- Table: seller
CREATE TABLE seller (
    code char(4)  NOT NULL,
    names varchar(70)  NOT NULL,
    last_names varchar(120)  NOT NULL,
    email varchar(90)  NOT NULL,
    birthday date  NOT NULL,
    place varchar(150)  NOT NULL,
    salary decimal(8,2)  NOT NULL,
    status char(1)  NOT NULL,
    CONSTRAINT seller_pk PRIMARY KEY  (code)
);

-- Table: student
CREATE TABLE student (
    id int  NOT NULL,
    names varchar(60)  NOT NULL,
    last_names varchar(90)  NOT NULL,
    email varchar(100)  NOT NULL,
    register_date date  NOT NULL,
    birthday date  NOT NULL,
    status char(1)  NOT NULL,
    CONSTRAINT student_pk PRIMARY KEY  (id)
);

-- Table: teachers
CREATE TABLE teachers (
    id int  NOT NULL,
    register_date date  NOT NULL,
    names varchar(70)  NOT NULL,
    last_names varchar(150)  NOT NULL,
    specialty varchar(120)  NOT NULL,
    phone char(9)  NOT NULL,
    email varchar(120)  NOT NULL,
    status char(1)  NOT NULL,
    CONSTRAINT teachers_pk PRIMARY KEY  (id)
);

-- foreign keys
-- Reference: careers_detail_careers (table: careers_detail)
ALTER TABLE careers_detail ADD CONSTRAINT careers_detail_careers
    FOREIGN KEY (careers_id)
    REFERENCES careers (id);

-- Reference: careers_detail_course (table: careers_detail)
ALTER TABLE careers_detail ADD CONSTRAINT careers_detail_course
    FOREIGN KEY (course_code)
    REFERENCES course (code);

-- Reference: careers_detail_teachers (table: careers_detail)
ALTER TABLE careers_detail ADD CONSTRAINT careers_detail_teachers
    FOREIGN KEY (teachers_id)
    REFERENCES teachers (id);

-- Reference: enrollment_campus (table: enrollment)
ALTER TABLE enrollment ADD CONSTRAINT enrollment_campus
    FOREIGN KEY (campus_code)
    REFERENCES campus (code);

-- Reference: enrollment_careers (table: enrollment)
ALTER TABLE enrollment ADD CONSTRAINT enrollment_careers
    FOREIGN KEY (careers_id)
    REFERENCES careers (id);

-- Reference: enrollment_seller (table: enrollment)
ALTER TABLE enrollment ADD CONSTRAINT enrollment_seller
    FOREIGN KEY (seller_code)
    REFERENCES seller (code);

-- Reference: enrollment_student (table: enrollment)
ALTER TABLE enrollment ADD CONSTRAINT enrollment_student
    FOREIGN KEY (student_id)
    REFERENCES student (id);

-- End of file.

