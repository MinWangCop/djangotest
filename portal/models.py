# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
#
# Also note: You'll have to insert the output of 'django-admin.py sqlcustom [app_label]'
# into your database.
from __future__ import unicode_literals

from django.db import models


class Course(models.Model):
    courseid = models.IntegerField(db_column='CourseId', primary_key=True)  # Field name made lowercase.
    schoolid = models.ForeignKey('School', db_column='SchoolId', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Course'


class Friends(models.Model):
    friendsid = models.IntegerField(db_column='FriendsId', primary_key=True)  # Field name made lowercase.
    schoolid = models.ForeignKey('School', db_column='SchoolId', blank=True, null=True)  # Field name made lowercase.
    logo = models.CharField(db_column='Logo', max_length=1024, blank=True)  # Field name made lowercase.
    content = models.CharField(db_column='Content', max_length=1024, blank=True)  # Field name made lowercase.
    siteurl = models.CharField(db_column='SiteUrl', max_length=1024, blank=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Friends'


class News(models.Model):
    newsid = models.IntegerField(db_column='NewsId', primary_key=True)  # Field name made lowercase.
    schoolid = models.ForeignKey('School', db_column='SchoolId', blank=True, null=True)  # Field name made lowercase.
    title = models.CharField(db_column='Title', max_length=512, blank=True)  # Field name made lowercase.
    publishtime = models.DateTimeField(db_column='PublishTime', blank=True, null=True)  # Field name made lowercase.
    content = models.CharField(db_column='Content', max_length=8000, blank=True)  # Field name made lowercase.
    picture = models.CharField(db_column='Picture', max_length=1024, blank=True)  # Field name made lowercase.
    bigpic = models.CharField(db_column='BigPic', max_length=1024, blank=True)  # Field name made lowercase.
    show_home_page = models.IntegerField(db_column='ShowHomePage')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'News'


class Register(models.Model):
    registerid = models.IntegerField(db_column='RegisterId', primary_key=True)  # Field name made lowercase.
    schoolid = models.ForeignKey('School', db_column='SchoolId', blank=True, null=True)  # Field name made lowercase.
    fullname = models.CharField(db_column='FullName', max_length=512, blank=True)  # Field name made lowercase.
    qualifications = models.CharField(db_column='Qualifications', max_length=512, blank=True)  # Field name made lowercase.
    city = models.CharField(db_column='City', max_length=512, blank=True)  # Field name made lowercase.
    address1 = models.CharField(db_column='Address1', max_length=1024, blank=True)  # Field name made lowercase.
    address2 = models.CharField(db_column='Address2', max_length=1024, blank=True)  # Field name made lowercase.
    mobile = models.CharField(db_column='Mobile', max_length=512, blank=True)  # Field name made lowercase.
    qqnumber = models.CharField(db_column='QQNumber', max_length=512, blank=True)  # Field name made lowercase.
    currentstate = models.CharField(db_column='CurrentState', max_length=512, blank=True)  # Field name made lowercase.
    extended = models.CharField(db_column='Extended', max_length=2048, blank=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Register'


class School(models.Model):
    schoolid = models.IntegerField(db_column='SchoolId', primary_key=True)  # Field name made lowercase.
    content = models.CharField(db_column='Content', max_length=2048, blank=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'School'


class Student(models.Model):
    studentid = models.IntegerField(db_column='StudentId', primary_key=True)  # Field name made lowercase.
    schoolid = models.ForeignKey(School, db_column='SchoolId', blank=True, null=True)  # Field name made lowercase.
    pic = models.CharField(db_column='Pic', max_length=1024, blank=True)  # Field name made lowercase.
    content = models.CharField(db_column='Content', max_length=1024, blank=True)  # Field name made lowercase.
    title = models.CharField(db_column='title', max_length=512, blank=True)  # Field name made lowercase.
    fullname = models.CharField(db_column='fullname', max_length=512, blank=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Student'


class Studentworks(models.Model):
    studentworksid = models.IntegerField(db_column='StudentworksId', primary_key=True)  # Field name made lowercase.
    schoolid = models.ForeignKey(School, db_column='SchoolId', blank=True, null=True)  # Field name made lowercase.
    studentid = models.ForeignKey(Student, db_column='StudentId', blank=True, null=True)  # Field name made lowercase.
    worksurl = models.CharField(db_column='worksUrl', max_length=1024, blank=True)  # Field name made lowercase.
    publishtime = models.DateTimeField(blank=True, null=True)
    studentname = models.CharField(db_column='studentName', max_length=1024, blank=True)  # Field name made lowercase.
    worksname = models.CharField(db_column='worksName', max_length=1024, blank=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'StudentWorks'


class Teacher(models.Model):
    teacherid = models.IntegerField(db_column='TeacherId', primary_key=True)  # Field name made lowercase.
    schoolid = models.ForeignKey(School, db_column='SchoolId', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Teacher'


class AuthGroup(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    name = models.CharField(unique=True, max_length=80)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    group = models.ForeignKey(AuthGroup)
    permission = models.ForeignKey('AuthPermission')

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'


class AuthPermission(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    name = models.CharField(max_length=50)
    content_type = models.ForeignKey('DjangoContentType')
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'


class AuthUser(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField()
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=30)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    email = models.CharField(max_length=75)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    user = models.ForeignKey(AuthUser)
    group = models.ForeignKey(AuthGroup)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'


class AuthUserUserPermissions(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    user = models.ForeignKey(AuthUser)
    permission = models.ForeignKey(AuthPermission)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'


class DjangoAdminLog(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.IntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', blank=True, null=True)
    user = models.ForeignKey(AuthUser)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    name = models.CharField(max_length=100)
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'


class DjangoMigrations(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'
