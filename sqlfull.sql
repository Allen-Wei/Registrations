﻿/*
	sqlmetal /code:E:\Education.cs /server:(localdb)\v11.0 /database:Education /views /functions /sprocs /context:EducationModel /pluralize /namespace:Education.Models

		public EducationModel() :
            base(global::System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString, mappingSource)
        {
            OnCreated();
        }

drop table Colleges
drop table Registrations
drop table Courses
drop table CourseCategories

*/


--create tables
create table CourseCategories(
 Id int identity(1,1) not null, 
 Name varchar(500) primary key, 
 Description varchar(500) not null,
 Category varchar(500) not null
)
go
create table Courses(
Id int identity(1,1) not null, 
Name varchar(500) primary key, 
Description varchar(500), 
CourseCategoryName varchar(500)
)
go 
create table Colleges(
Id int identity(1,1),				--记录Id
Gid uniqueidentifier primary key,	--院校编号
Name varchar(500) not null,			--院校名称		
CanRegistrate bit					--此院校是否允许被报考
)
go
create table Registrations
(
Id int identity(1,1) primary key,						--记录Id
GenerateDate datetime not null default getdate(),		--Generate Date
KeyId Uniqueidentifier  not null default NewID(),

StudentName varchar(500) not null,						--学员名字
Gender bit not null,									--性别
Phone varchar(500),										--电话号码
Phone2 varchar(500),									--电话号码
LiveAddress varchar(500),								--学员住宿地址
HomeAddress varchar(500),								--户籍

ReceiptNumber varchar(500) not null,					--票号
RegistrateDate datetime not null default getdate(),		--报考日期
Price money not null,									--费用
Payee varchar(500) not null,							--收款人

RegistrationAddress varchar(500) not null,				--报考地址
CourseCategoryName varchar(500) not null,				--课程类别
CourseName varchar(500) not null,						--所报课程
CurrentCollege varchar(500),							--当前院校
RegistrateCollege varchar(500),							--报考院校
CurrentGrade varchar(500),								--当前年级
EducationDegree varchar(500),							--学历
Note varchar(max),										--备注
Confirm bit not null default 0							--Confirmed
)
go
CREATE TABLE Roles
(
  RoleName varchar(200) NOT NULL,
  ApplicationName varchar(100) NOT NULL,
    CONSTRAINT PKRoles PRIMARY KEY (RoleName, ApplicationName)
)
 go
CREATE TABLE UsersInRoles
(
  UserId varchar(200) NOT NULL,
  RoleName varchar(200) NOT NULL,
  ApplicationName varchar(100) NOT NULL,
    CONSTRAINT PKUsersInRoles PRIMARY KEY (UserId, RoleName, ApplicationName)
)
go
create table Users
(
Id int identity(1,1),
Code varchar(200) primary key,
Email varchar(200) unique null,
Password varchar(500) not null
)

--Initial data
--CourseCategories data
insert into CourseCategories(Name, Description, Category) values('xljy', 'xuelijiaoyu', 'c1')
insert into CourseCategories(Name, Description, Category) values('zgzpx', 'zigezhengpeixun', 'c2')
insert into CourseCategories(Name, Description, Category) values('zxxfd', 'zhongxiaoxue', 'c2')
--Courses data
go
insert into Courses(Name, Description, CourseCategoryName) values('yanjiusheng', 'yanjiusheng', 'xljy')
insert into Courses(Name, Description, CourseCategoryName) values('chengrengaokao', 'chengrengaokao', 'xljy')
insert into Courses(Name, Description, CourseCategoryName) values('yuanchengjiaoyu', 'yuanchengjiaoyu', 'xljy')
insert into Courses(Name, Description, CourseCategoryName) values('gaozhishengben', 'gaozhishengben', 'xljy')
go
insert into Courses(Name, Description, CourseCategoryName) values('jisuanjierji', 'jisuanjierji', 'zgzpx')
insert into Courses(Name, Description, CourseCategoryName) values('kuaijicongyezgz', 'kuaijicongye', 'zgzpx')
insert into Courses(Name, Description, CourseCategoryName) values('jiaoshizgz', 'jiaoshizigezheng', 'zgzpx')
go
insert into Courses(Name, Description, CourseCategoryName) values('jipinban', 'jipinban', 'zxxfd')
insert into Courses(Name, Description, CourseCategoryName) values('jingpinban', 'jingpinban', 'zxxfd')
insert into Courses(Name, Description, CourseCategoryName) values('teseban', 'teseban', 'zxxfd')
insert into Courses(Name, Description, CourseCategoryName) values('hanshujiaban', 'hanshujia', 'zxxfd')
insert into Courses(Name, Description, CourseCategoryName) values('zuoyefudaoban', 'zuoyefudaoban', 'zxxfd')

--Colleges data
insert into Colleges(Gid, Name, CanRegistrate)
values(NEWID(), 'nankaidaxue', 1)
go
insert into Colleges(Gid, Name, CanRegistrate)
values(NEWID(), 'tianjindaxue', 1)
go
insert into Colleges(Gid, Name, CanRegistrate)
values(NEWID(), 'waiguoyuxueyuan', 1)
go
insert into Colleges(Gid, Name, CanRegistrate)
values(NEWID(), 'caijingdaxue', 1)
go
insert into Colleges(Gid, Name, CanRegistrate)
values(NEWID(), 'zhongde', 0)
go
insert into Colleges(Gid, Name, CanRegistrate)
values(NEWID(), 'dianzijishu', 0)

--User and roles
insert into Roles(RoleName, ApplicationName) values('sales', 'alan')
insert into UsersInRoles(UserId, RoleName, ApplicationName) values('sale1', 'sales', 'alan')
insert into Users(Code, Email,Password) values('sale1', 'sale@qq.com', 'saleone')




































/*
insert into CourseCategories(Name, Description, Category) values('xljy', '学历教育', 'c1');
insert into CourseCategories(Name, Description, Category) values('zgzpx', '资格证培训', 'c2');
insert into CourseCategories(Name, Description, Category) values('zxxfd', '中小学辅导', 'c3');
go
insert into Courses(Name, Description, CourseCategoryName) values('yanjiusheng','研究生', 'xljy')
insert into Courses(Name, Description, CourseCategoryName) values('chengrengaokao','成人高考', 'xljy')
insert into Courses(Name, Description, CourseCategoryName) values('zixuekaoshi','自学考试', 'xljy')
insert into Courses(Name, Description, CourseCategoryName) values('yuanchengjiaoyu','远程教育', 'xljy')
go
insert into Courses(Name, Description, CourseCategoryName) values('jisuanjierji','计算机二级', 'zgzpx')
insert into Courses(Name, Description, CourseCategoryName) values('huijicongye','会计从业资格证', 'zgzpx')
insert into Courses(Name, Description, CourseCategoryName) values('jiaoshizigezheng','教师资格证', 'zgzpx')
go
insert into Courses(Name, Description, CourseCategoryName) values('jipinban','极品班', 'zxxfd')
insert into Courses(Name, Description, CourseCategoryName) values('jingpinban','精品班', 'zxxfd')
*/

