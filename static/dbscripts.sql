drop table if exists School;

/*==============================================================*/
/* Table: School                                                */
/*==============================================================*/
create table School
(
   SchoolId             int not null auto_increment comment 'ѧУId',
   Content              varchar(2048) comment 'ѧԺ���',
   primary key (SchoolId)
);

drop table if exists Student;

/*==============================================================*/
/* Table: Student                                               */
/*==============================================================*/
create table Student
(
   StudentId            int not null auto_increment comment 'ѧԱId',
   SchoolId             int comment 'ѧУId',
   Pic                  varchar(1024) comment 'ѧԱͷ��',
   Content              varchar(1024) comment 'ѧԱ���',
   title                varchar(512) comment 'ѧԱ������',
   fullname             varchar(512) comment 'ѧԱ����',
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
   StudentworksId       int not null auto_increment comment 'ѧԱ��ƷId',
   SchoolId             int comment 'ѧУId',
   StudentId            int comment 'ѧԱId',
   worksUrl             varchar(1024) comment '��ƷUrl',
   publishtime          datetime comment '����ʱ��',
   studentName          varchar(1024) comment 'ѧԱ����',
   worksName            varchar(1024) comment '��Ʒ����',
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
   CourseId             int not null auto_increment comment '�γ�Id',
   SchoolId             int comment 'ѧУId',
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
   RegisterId           int not null auto_increment comment 'ע��Id',
   SchoolId             int comment 'ѧУId',
   FullName             varchar(512) comment 'ȫ��',
   Qualifications       varchar(512) comment '���ѧ��',
   City                 varchar(512) comment '���ڳ���',
   Address1             varchar(1024) comment '��ϸ��ַ1',
   Address2             varchar(1024) comment '��ϸ��ַ2',
   Mobile               varchar(512) comment '�ֻ�����',
   QQNumber             varchar(512) comment 'QQ����',
   CurrentState              varchar(512) comment 'Ŀǰ״��',
   Extended             varchar(2048) comment '��������',
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
   NewsId               int not null auto_increment comment '����Id',
   SchoolId             int comment 'ѧУId',
   Title                varchar(512) comment '���ű���',
   PublishTime          datetime comment '����ʱ��',
   Content              varchar(8000) comment '��������',
   Picture              varchar(1024) comment '����ͼƬ',
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
   FriendsId            int not null auto_increment comment '��������Id',
   SchoolId             int comment 'ѧУId',
   Logo                 varchar(1024) comment '��������ͼ��',
   Content              varchar(1024) comment '�����������',
   SiteUrl              varchar(1024) comment '��������Url',
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
   TeacherId            int not null auto_increment comment '��ʦId',
   SchoolId             int comment 'ѧУId',
   primary key (TeacherId)
);

alter table Teacher add constraint FK_Reference_8 foreign key (SchoolId)
      references School (SchoolId) on delete restrict on update restrict;

