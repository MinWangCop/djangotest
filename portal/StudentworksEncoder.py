#--*--coding:utf-8--*--
import json
from models import Studentworks

class StudentworksEncoder(json.JSONEncoder):
    def default(self, o):
        if isinstance(o,Studentworks):
            #return str(type(o.publishtime))
            return '{"studentworksid":"%d","worksurl":"%s","publishtime":"%s","studentname":"%s","worksname":"%s","smallimg":"%s","originimg":"%s","description":"%s"}' % \
                (o.studentworksid,
                 o.worksurl,\
                 o.publishtime.strftime("%Y-%m-%d"),\
                 o.studentname,\
                 o.worksname,\
                 o.smallimg,\
                 o.originimg,\
                 o.description)
        json.JSONEncoder.default(self, o)