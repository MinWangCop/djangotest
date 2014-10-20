# -*- coding:UTF-8 -*-

import random,StringIO
import os
from PIL import Image,ImageDraw,ImageFont
from math import ceil
from django.http import HttpResponse

session_key = 'validatecode'

def check(inputcode,request):
    origin_code = request.session[session_key]
    code = ''.join(origin_code)
    return inputcode.upper() == code.upper()

def get_font_size(img_height,img_width,code):
        """  将图片高度的80%作为字体大小

        """
        s1 = int(img_height * 0.8)
        s2 = int(img_width/len(code))
        return int(min((s1,s2)) + max((s1,s2))*0.05)

def render_validate_code(request):
    """  生成验证码图片
    """
    img_width=101
    img_height=28
    current_path = os.path.normpath(os.path.dirname(__file__))
    # font color
    font_color = ['black','darkblue','darkred']

    # background color
    background = (random.randrange(230,255),random.randrange(230,255),random.randrange(230,255))

    # font path
    font_path = os.path.join(current_path,'timesbi.ttf')
    #self.font_path = os.path.join(current_path,'Menlo.ttc')
    # creat a image
    im = Image.new('RGB',(img_width,img_height),background)
    code = random.sample('ABCDEFGHIJKLMNOPQRSTUVWXYZ',4)
    request.session[session_key] = code
    # set font size automaticly
    font_size = get_font_size(img_width,img_height,code)

    # creat a pen
    draw = ImageDraw.Draw(im)

    # draw noisy point/line
    c = int(8/len(code)*3) or 3
    

    for i in range(random.randrange(c-2,c)):
        line_color = (random.randrange(0,255),random.randrange(0,255),random.randrange(0,255))
        xy = (
                random.randrange(0,int(img_width*0.2)),
                random.randrange(0,img_height),
                random.randrange(3*img_width/4,img_width),
                random.randrange(0,img_height)
            )
        draw.line(xy,fill=line_color,width=int(font_size*0.1))
        #draw.arc(xy,fill=line_color,width=int(self.font_size*0.1))
    #draw.arc(xy,0,1400,fill=line_color)

    # draw code
    j = int(font_size*0.3)
    k = int(font_size*0.5)
    x = random.randrange(j,k) #starts point
    for i in code:
        # 上下抖动量,字数越多,上下抖动越大
        m = int(len(code))
        y = random.randrange(1,3)

        if i in ('+','=','?'):
            # 对计算符号等特殊字符放大处理
            m = ceil(font_size*0.8)
        else:
            # 字体大小变化量,字数越少,字体大小变化越多
            m = random.randrange(0,int( 45 / font_size) + int(font_size/5))

        font = ImageFont.truetype(font_path.replace('\\','/'),font_size + int(ceil(m)))
        draw.text((x,y), i, font=font, fill=random.choice(font_color))
        x += font_size*0.9

    del x
    del draw
    buf = StringIO.StringIO()
    im.save(buf,'gif')
    buf.closed
    return HttpResponse(buf.getvalue(),'image/gif')