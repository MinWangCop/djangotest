from django import forms
from django.contrib import admin
from django.core.exceptions import ValidationError
from portal.models import News, Friends,Student,Studentworks,Teacher


class NewsForm(forms.ModelForm):

    content = forms.CharField(label='aaa',widget=forms.Textarea(attrs={'class':'vLargeTextField'}))

    class Meta:
        model = News
        fields = ('title','publishtime','picture','bigpic','content')

#    def __init__(self, *args, **kwargs):
#
#        if kwargs.get('instance'):
#            email = kwargs['instance'].email
#            kwargs.setdefault('initial', {})['confirm_email'] = email
#
#        return super(ContactForm, self).__init__(*args, **kwargs)