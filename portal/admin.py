# -*- coding: utf-8 -*- 
from __future__ import division
from django.contrib import admin,messages
from django.core.urlresolvers import reverse
from portal.models import News,Friends,Student,Studentworks,Teacher,Register
from django import forms
from portal.forms import NewsForm
from django.http import HttpResponseRedirect

# Register your models here.

@admin.register(Friends)
class FriendsAdmin(admin.ModelAdmin):
    list_display=('logo','siteurl','content')  
    fields = (('logo', 'siteurl'), 'content','show_home_page')
    list_filter=('show_home_page',)    

@admin.register(News)
class NewsAdmin(admin.ModelAdmin):
    list_display=('title','publishtime','picture','bigpic')  
    list_filter=('show_home_page',)
    search_fields = ('title',)
    fields = ('title','publishtime','picture','bigpic','content','show_home_page')
    # radio_fields={'show_home_page':admin.VERTICAL}
    form = NewsForm
#    inlines = [MediaAdmin,]
#
    # def save_form(self, request, form, change):

        # return HttpResponseRedirect(reverse(''))

    # def save_model(self,request,obj,form,change):
    #     return
        # print request._messages

        # messages.info(request, 'Three credits remain in your account.')
        # messages.error(request,'111122')
        # messages.warning(request,'22222')
        # mobj=messages.get_messages(request)
        # request
         # messages.error(request, 'I am wrong')
         # return
#        print request
#        print 3333333333333
#        print form
#        print 44444444444
#        print change
#        print 555554
#        print self
#        return request
#        raise ValidationError("show_home_page er")
##        obj.save()
#        
#        large_image_base, large_image_ext = os.path.splitext(os.path.basename(obj.picture.path))
#        large_thumb_pixbuf = make_thumb(os.path.join(MEDIA_ROOT, obj.picture.name))
#        
#        large_relate_thumb_path = os.path.join(MEDIA_ROOT, large_image_base + '_large_' + large_image_ext)
#        
#        large_thumb_path = os.path.join(MEDIA_ROOT, large_relate_thumb_path)
#        large_thumb_pixbuf.save(large_thumb_path)
#        obj.picture = ImageFieldFile(obj, obj.picture, large_thumb_path)
#
#        obj.save()


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


    
    
    