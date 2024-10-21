-- Crear la base de datos
CREATE DATABASE Colegio;
GO

USE Colegio;
GO

--SCHOOL
CREATE TABLE SCHOOL (
    SchoolId INT PRIMARY KEY,
    SchoolName VARCHAR(50) NOT NULL,
    Description VARCHAR(1000),
    Address VARCHAR(50),
    Phone VARCHAR(50),
    PostCode VARCHAR(50),
    PostAddress VARCHAR(50)
);

-- CLASS
CREATE TABLE CLASS (
    ClassId INT PRIMARY KEY,
    SchoolId INT NOT NULL,
    ClassName VARCHAR(50) NOT NULL,
    Description VARCHAR(1000),
    FOREIGN KEY (SchoolId) REFERENCES SCHOOL(SchoolId)
);

--STUDENT
CREATE TABLE STUDENT (
    StudentId INT PRIMARY KEY,
    ClassId INT NOT NULL,
    StudentName VARCHAR(100) NOT NULL,
    StudentNumber VARCHAR(20),
    TotalGrade FLOAT,
    Address VARCHAR(100),
    Phone VARCHAR(20),
    EMail VARCHAR(100),
    FOREIGN KEY (ClassId) REFERENCES CLASS(ClassId)
);

-- COURSE
CREATE TABLE COURSE (
    CourseId INT PRIMARY KEY,
    CourseName VARCHAR(50) NOT NULL,
    SchoolId INT NOT NULL,
    Description VARCHAR(1000),
    FOREIGN KEY (SchoolId) REFERENCES SCHOOL(SchoolId)
);

--TEACHER
CREATE TABLE TEACHER (
    TeacherId INT PRIMARY KEY,
    SchoolId INT NOT NULL,
    TeacherName VARCHAR(50) NOT NULL,
    Description VARCHAR(1000),
    FOREIGN KEY (SchoolId) REFERENCES SCHOOL(SchoolId)
);

--STUDENT_COURSE 
CREATE TABLE STUDENT_COURSE (
    StudentId INT NOT NULL,
    CourseId INT NOT NULL,
    PRIMARY KEY (StudentId, CourseId),
    FOREIGN KEY (StudentId) REFERENCES STUDENT(StudentId),
    FOREIGN KEY (CourseId) REFERENCES COURSE(CourseId)
);

--TEACHER_COURSE
CREATE TABLE TEACHER_COURSE (
    TeacherId INT NOT NULL,
    CourseId INT NOT NULL,
    PRIMARY KEY (TeacherId, CourseId),
    FOREIGN KEY (TeacherId) REFERENCES TEACHER(TeacherId),
    FOREIGN KEY (CourseId) REFERENCES COURSE(CourseId)
);

-- GRADE
CREATE TABLE GRADE (
    GradeId INT PRIMARY KEY,
    StudentId INT NOT NULL,
    CourseId INT NOT NULL,
    Grade FLOAT,
    Comment VARCHAR(1000),
    FOREIGN KEY (StudentId) REFERENCES STUDENT(StudentId),
    FOREIGN KEY (CourseId) REFERENCES COURSE(CourseId)
);
