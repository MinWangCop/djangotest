drop table if exists School;

/*==============================================================*/
/* Table: School                                                */
/*==============================================================*/
create table School
(
   SchoolId             int not null auto_increment comment '学校Id',
   Content              varchar(2048) comment '学院简介',
   primary key (SchoolId)
);

drop table if exists Student;

/*==============================================================*/
/* Table: Student                                               */
/*==============================================================*/
create table Student
(
   StudentId            int not null auto_increment comment '学员Id',
   SchoolId             int comment '学校Id',
   Pic                  varchar(1024) comment '学员头像',
   Content              varchar(1024) comment '学员简介',
   title                varchar(512) comment '学员简介标题',
   fullname             varchar(512) comment '学员姓名',
   primary key (StudentId)
);

alter table Student add constraint FK_Reference_2 foreign key (SchoolId)
      references School (SchoolId) on delete restrict on update restrict;

drop table if exists StudentWorks;

/*==============================================================*/
/* Table: StudentWorks                                          */
/*==============================================================*/
create table StudentWorks
(
   StudentworksId       int not null auto_increment comment '学员作品Id',
   SchoolId             int comment '学校Id',
   StudentId            int comment '学员Id',
   worksUrl             varchar(1024) comment '作品Url',
   publishtime          datetime comment '发布时间',
   studentName          varchar(1024) comment '学员姓名',
   worksName            varchar(1024) comment '作品名称',
   primary key (StudentworksId)
);

alter table StudentWorks add constraint FK_Reference_7 foreign key (SchoolId)
      references School (SchoolId) on delete restrict on update restrict;

alter table StudentWorks add constraint FK_Reference_9 foreign key (StudentId)
      references Student (StudentId) on delete restrict on update restrict;
	  
drop table if exists Course;

/*==============================================================*/
/* Table: Course                                                */
/*==============================================================*/
create table Course
(
   CourseId             int not null auto_increment comment '课程Id',
   SchoolId             int comment '学校Id',
   primary key (CourseId)
);

alter table Course add constraint FK_Reference_1 foreign key (SchoolId)
      references School (SchoolId) on delete restrict on update restrict;

drop table if exists Register;

/*==============================================================*/
/* Table: Register                                              */
/*==============================================================*/
create table Register
(
   RegisterId           int not null auto_increment comment '注册Id',
   SchoolId             int comment '学校Id',
   FullName             varchar(512) comment '全名',
   Qualifications       varchar(512) comment '最高学历',
   City                 varchar(512) comment '所在城市',
   Address1             varchar(1024) comment '详细地址1',
   Address2             varchar(1024) comment '详细地址2',
   Mobile               varchar(512) comment '手机号码',
   QQNumber             varchar(512) comment 'QQ号码',
   CurrentState              varchar(512) comment '目前状况',
   Extended             varchar(2048) comment '补充内容',
   primary key (RegisterId)
);

alter table Register add constraint FK_Reference_5 foreign key (SchoolId)
      references School (SchoolId) on delete restrict on update restrict;
	  
drop table if exists News;

/*==============================================================*/
/* Table: News                                                  */
/*==============================================================*/
create table News
(
   NewsId               int not null auto_increment comment '新闻Id',
   SchoolId             int comment '学校Id',
   Title                varchar(512) comment '新闻标题',
   PublishTime          datetime comment '发布时间',
   Content              varchar(8000) comment '新闻内容',
   Picture              varchar(1024) comment '新闻图片',
   primary key (NewsId)
);

alter table News add constraint FK_Reference_6 foreign key (SchoolId)
      references School (SchoolId) on delete restrict on update restrict;

drop table if exists Friends;

/*==============================================================*/
/* Table: Friends                                               */
/*==============================================================*/
create table Friends
(
   FriendsId            int not null auto_increment comment '合作机构Id',
   SchoolId             int comment '学校Id',
   Logo                 varchar(1024) comment '合作机构图标',
   Content              varchar(1024) comment '合作机构简介',
   SiteUrl              varchar(1024) comment '合作机构Url',
   primary key (FriendsId)
);

alter table Friends add constraint FK_Reference_4 foreign key (SchoolId)
      references School (SchoolId) on delete restrict on update restrict;

drop table if exists Teacher;

/*==============================================================*/
/* Table: Teacher                                               */
/*==============================================================*/
create table Teacher
(
   TeacherId            int not null auto_increment comment '教师Id',
   SchoolId             int comment '学校Id',
   primary key (TeacherId)
);

alter table Teacher add constraint FK_Reference_8 foreign key (SchoolId)
      references School (SchoolId) on delete restrict on update restrict;

