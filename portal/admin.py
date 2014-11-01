from django.contrib import admin
from portal.models import News, Friends,Student,Studentworks,Teacher

# Register your models here.

@admin.register(Friends)
class FriendsAdmin(admin.ModelAdmin):
    list_display=('logo','siteurl','content')  
    fields = (('logo', 'siteurl'), 'content')


@admin.register(News)
class NewsAdmin(admin.ModelAdmin):
    list_display=('title','publishtime','picture','bigpic')  
    fields = ('title','publishtime','picture','bigpic', 'content')



@admin.register(Student)
class StudentAdmin(admin.ModelAdmin):
    list_display=('fullname','pic','title','content')  
    fields = ('fullname','pic','title','content')

@admin.register(Studentworks)
class StudentworksAdmin(admin.ModelAdmin):
    list_display=('worksname','studentname','publishtime','worksurl')  
    fields = ('worksname','studentname','publishtime','worksurl')

@admin.register(Teacher)
class TeacherAdmin(admin.ModelAdmin):
    pass