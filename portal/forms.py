from django import forms
from django.contrib import admin
from django.core.exceptions import ValidationError
from portal.models import News, Friends,Student,Studentworks,Teacher


class NewsForm(forms.ModelForm):

    content = forms.CharField(label='aaa',widget=forms.Textarea(attrs={'class':'vLargeTextField'}))
    
    def clean_show_home_page(self):
        
        data = self.cleaned_data['show_home_page']
        print data
        count=News.objects.filter(show_home_page__exact='1').count()
        print count
        raise forms.ValidationError("show_home_page er")

        # Always return the cleaned data, whether you have changed it or
        # not.
        return data
    
    class Meta:
        model = News
        fields = ('title','publishtime','picture','bigpic','content','show_home_page')

#    def __init__(self, *args, **kwargs):
#
#        if kwargs.get('instance'):
#            email = kwargs['instance'].email
#            kwargs.setdefault('initial', {})['confirm_email'] = email
#
#        return super(ContactForm, self).__init__(*args, **kwargs)