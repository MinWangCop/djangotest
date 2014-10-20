# -*- coding:UTF-8 -*-

from django.shortcuts import render_to_response
from django.template import Context
from django.views.decorators.csrf import csrf_exempt
from portal.models import News, Friends,Student,Studentworks, Teacher
from django.core.paginator import Paginator
from django.http import HttpResponse
from validatecode import render_validate_code,check

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
    return render_include_to_response('students_show.html','student','学员风采',
                                      {'students':students,'works':student_works})

def school(request):
    teachers = Teacher.objects.order_by('-teacherid')
    page_list = Paginator(teachers, 5)
    page_objects_list = []
    for page_index in page_list.page_range:
        page = page_list.page(page_index).object_list
        page_objects_list.append(page)
    return render_include_to_response('school.html', 'unity', 'Unity 学院',{'teachers':page_objects_list,})

def validate_code(request):
    return render_validate_code(request)

@csrf_exempt
def register_post(request):
    _code = request.POST["validatecode"]
    if check(_code, request):
        return HttpResponse("code")
    else:
        return HttpResponse("codeerror")

def register(request):
    return render_to_response('register.html')        

def render_include_to_response(template_path,current_page,page_title,params = {}):
    context = Context({'current_page':current_page,'page_title':page_title})
    context.push(params)
    return render_to_response(template_path,context)
