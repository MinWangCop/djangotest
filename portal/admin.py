from django.contrib import admin
from portal.models import News, Friends,Student,Studentworks,Teacher,Register
from django import forms
from portal.forms import NewsForm

# Register your models here.

@admin.register(Friends)
class FriendsAdmin(admin.ModelAdmin):
    list_display=('logo','siteurl','content')  
    fields = (('logo', 'siteurl'), 'content','show_home_page')
    

@admin.register(News)
class NewsAdmin(admin.ModelAdmin):
    list_display=('title','publishtime','picture','bigpic')  
    fields = ('title','publishtime','picture','bigpic','content','show_home_page')
    form = NewsForm



@admin.register(Student)
class StudentAdmin(admin.ModelAdmin):
    list_display=('fullname','pic','title','content')  
    fields = ('fullname','pic','title','content')

@admin.register(Studentworks)
class StudentworksAdmin(admin.ModelAdmin):
    list_display=('worksname','studentname','publishtime','worksurl')  
    fields = ('worksname','studentname','publishtime','worksurl','smallimg','originimg','description')

@admin.register(Teacher)
class TeacherAdmin(admin.ModelAdmin):
    list_display=('fullname','photo','title','content')  
    fields = ('fullname','photo','title','content') 

@admin.register(Register)    
class RegisterAdmin(admin.ModelAdmin):
    list_display=('registerid','fullname','qualifications','regtime') 
    def has_add_permission(self, request):
        return False
    def has_delete_permission(self, request,obj=Register):
        return False
    
    
    