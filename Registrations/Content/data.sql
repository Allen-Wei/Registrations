--initial Colleges
insert into Colleges(Gid, Name, CanRegistrate) values(NEWID(), '南开大学', 1)
insert into Colleges(Gid, Name, CanRegistrate) values(NEWID(), '天津大学', 1)
insert into Colleges(Gid, Name, CanRegistrate) values(NEWID(), '外国语学院', 1)
insert into Colleges(Gid, Name, CanRegistrate) values(NEWID(), '财经大学', 1)
insert into Colleges(Gid, Name, CanRegistrate) values(NEWID(), '中德职业技术', 0)
insert into Colleges(Gid, Name, CanRegistrate) values(NEWID(), '电子信息技术', 0)

--Initial User and Roles
insert into Roles(RoleName, ApplicationName) values('sales', 'alan')
insert into UsersInRoles(UserId, RoleName, ApplicationName) values('sale1', 'sales', 'alan')
insert into Users(Code, Email,Password) values('sale1', 'sale@qq.com', 'saleone')

--Initial CourseCategories
insert into CourseCategories(Name, Description, Category) values('xljy', '学历教育', 'c1');
insert into CourseCategories(Name, Description, Category) values('zgzpx', '资格证培训', 'c2');
insert into CourseCategories(Name, Description, Category) values('zxxfd', '中小学辅导', 'c2');

--Initial Courses
insert into Courses(Name, Description, CourseCategoryName) values('yanjiusheng','研究生', 'xljy')
insert into Courses(Name, Description, CourseCategoryName) values('chengrengaokao','成人高考', 'xljy')
insert into Courses(Name, Description, CourseCategoryName) values('zixuekaoshi','自学考试', 'xljy')
insert into Courses(Name, Description, CourseCategoryName) values('yuanchengjiaoyu','远程教育', 'xljy')

insert into Courses(Name, Description, CourseCategoryName) values('jisuanjierji','计算机二级', 'zgzpx')
insert into Courses(Name, Description, CourseCategoryName) values('huijicongye','会计从业资格证', 'zgzpx')
insert into Courses(Name, Description, CourseCategoryName) values('jiaoshizigezheng','教师资格证', 'zgzpx')

insert into Courses(Name, Description, CourseCategoryName) values('jipinban','极品班', 'zxxfd')
insert into Courses(Name, Description, CourseCategoryName) values('jingpinban','精品班', 'zxxfd')
insert into Courses(Name, Description, CourseCategoryName) values('teseban','特色班', 'zxxfd')
insert into Courses(Name, Description, CourseCategoryName) values('hanshujia','寒暑假制胜班', 'zxxfd')
insert into Courses(Name, Description, CourseCategoryName) values('zuoyefudaoban','作业辅导班', 'zxxfd')
