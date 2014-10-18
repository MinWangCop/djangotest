# -*- coding:UTF-8 -*-

import random
import string
import simplejson as json
from django.shortcuts import render, render_to_response
from django.template import Context,Template
from django.http import HttpResponse 
from django.views.decorators.csrf import csrf_exempt
from portal.models import News, Friends,Student,Studentworks
from DjangoCaptcha import Captcha

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
    student_works = Studentworks.objects.order_by('publishtime')
    return render_include_to_response('students_show.html','student','学员风采',
                                      {'students':students,'works':student_works})

def validate_code(request):
    ca =  Captcha(request)
    ca.img_height=28
    ca.img_width=101
    #ca.font_size = 12
    word = random.sample('zyxwvutsrqponmlkjihgfedcbaABCDEFGHIJKLMNOPQRSTUVWXYZ',4)
    ca.words = [word]
    ca.type = 'word'
    return ca.display()

@csrf_exempt
def register_post(request):
    _code = request.POST["validatecode"]
    #print(_code)
    ca = Captcha(request)
    if ca.check(_code):
        #registe = json.loads(request.body)
        return HttpResponse("code")
    else:
        return HttpResponse("codeerror")

def register(request):
    return render_to_response('register.html')        

def render_include_to_response(template_path,current_page,page_title,params = {}):
    context = Context({'current_page':current_page,'page_title':page_title})
    context.push(params)
    return render_to_response(template_path,context)