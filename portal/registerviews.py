# -*- coding:UTF-8 -*-
'''
Created on 2014年10月21日

@author: Ming
'''

import re
from portal.models import Register
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse
from validatecode import render_validate_code,check
from django.shortcuts import render_to_response
from datetime import datetime

def validate_code(request):
    return render_validate_code(request)

def get_register(request):
    reg = Register()
    reg.address1 = request.POST["address1"]
    reg.address2 = request.POST["address1"]
    reg.city = request.POST["city"]
    reg.currentstate = request.POST["currentstate"]
    reg.extended = request.POST["extended"]
    reg.fullname = request.POST["fullname"]
    reg.mobile = request.POST["mobile"]
    reg.qqnumber = request.POST["qqnumber"]
    reg.qualifications = request.POST["qualifications"]
    reg.regtime = datetime.now()
    return reg

@csrf_exempt
def register_post(request):
    last_submit = request.session.get("submittime",False)
    if not last_submit:
        if check(request):
            reg = get_register(request)
            _return = validate(reg)
            if _return=="successful":
                reg.save()
                request.session["submittime"] = True
        else:
            _return = "codeerror"
    else:
        _return = "repeat"
    return HttpResponse(_return)

def register(request):
    return render_to_response('register.html')


def validate(reg):
    new_reg = Register.objects.get(mobile__iexact=reg.mobile)
    if new_reg!=None:
        return "repeat"
    new_reg = Register.objects.get(qqnumber_iexact = reg.qqnumber)
    if new_reg !=None:
        return 'repeat'
    mobilepattern = re.compile(r'^1[0-9]{2}\d{8}$')
    qqnumberpattern = re.compile(r'^\d{4,}$')
    if not reg.fullname.strip():
        return "fullnameerror"
    if not reg.mobile.strip():
        return "mobileerror"
    if not mobilepattern.match(reg.mobile.strip()):
        return "mobileformaterror"
    if not reg.qqnumber.strip():
        return "qqerror"
    if not qqnumberpattern.match(reg.qqnumber.strip()):
        return "qqformaterror"
   
    return "successful"


