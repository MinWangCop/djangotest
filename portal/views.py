# -*- coding:UTF-8 -*-

import json
from django.shortcuts import render_to_response
from django.template import Context
from portal.models import News, Friends,Student,Studentworks, Teacher
from django.core.paginator import Paginator
from django.http.response import HttpResponse
from StudentworksEncoder import StudentworksEncoder

# Create your views here.
def index(request):
    news_array = News.objects.order_by('-publishtime')
    hot_news = News.objects.order_by('-publishtime').filter(show_home_page__exact='1')
    return render_include_to_response('homepage.html','home','首页',{'news':news_array,'hot_news':hot_news})

def friends(request):
    friends_array = Friends.objects.order_by("friendsid")
    return render_include_to_response('friends.html','friends','合作机构',{'friends':friends_array})

def news(request):
    news_array = News.objects.order_by('-publishtime')
    return render_include_to_response('news.html','news','学院新闻',{'news':news_array})

def news_context(request,news_title):
    news = News.objects.get(title__iexact=news_title)
    return render_include_to_response('news_context.html','news','学院新闻',{'new':news})

def students_show(request):
    students = Student.objects.order_by('-studentid')[:5]
    student_works = Studentworks.objects.order_by('-publishtime')
    top_works = student_works[:4] if len(student_works)>=4 else student_works[:len(student_works)]
    bottom_works = student_works[4:8] if len(student_works)>=8 \
        else student_works[4:len(student_works)] if len(student_works)>=4 else student_works
    return render_include_to_response('students_show.html','student','学员风采',
                                      {'students':students,'top_works':top_works,'bottom_works':bottom_works,'defaultworkid':top_works[0].studentworksid})

def show_works(request,work_id):
    work = Studentworks.objects.get(studentworksid__exact = work_id)
    return HttpResponse(json.dumps(work ,cls=StudentworksEncoder),content_type="application/json")

def school(request):
    teachers = Teacher.objects.order_by('-teacherid')
    page_list = Paginator(teachers, 5)
    page_objects_list = []
    for page_index in page_list.page_range:
        page = page_list.page(page_index).object_list
        page_objects_list.append(page)
    return render_include_to_response('school.html', 'unity', 'Unity 学院',{'teachers':page_objects_list,})

def render_include_to_response(template_path,current_page,page_title,params = {}):
    friends_array = Friends.objects.order_by('-friendsid').filter(show_home_page__exact='1')
    context = Context({'current_page':current_page,'page_title':page_title,'top_friends':friends_array[:4]})
    context.push(params)
    return render_to_response(template_path,context)
