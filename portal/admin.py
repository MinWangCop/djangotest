from django.contrib import admin
from portal.models import News, Friends,Student,Studentworks,Teacher

# Register your models here.

@admin.register(Friends)
class FriendsAdmin(admin.ModelAdmin):
    list_display=('logo','content','siteurl')

@admin.register(News)
class NewsAdmin(admin.ModelAdmin):
    pass


@admin.register(Student)
class StudentStudentAdmin(admin.ModelAdmin):
    pass

@admin.register(Studentworks)
class StudentworksAdmin(admin.ModelAdmin):
    pass

@admin.register(Teacher)
class TeacherAdmin(admin.ModelAdmin):
    pass