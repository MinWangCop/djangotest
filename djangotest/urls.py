from django.conf.urls import patterns, include, url
from django.contrib import admin

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'djangotest.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
    url(r'^$', 'portal.views.index'),
    url(r'^news/$','portal.views.news'),
    url(r'^friends/$','portal.views.friends'),
    url(r'^news/([\w\W]+)/$','portal.views.news_context'),
    url(r'^studentshow/$','portal.views.students_show'),
    url(r'^register/$','portal.registerviews.register'),
    url(r'^registerpost/$','portal.registerviews.register_post'),
    url(r'^school/$', 'portal.views.school'),
    url(r'^code/$','portal.registerviews.validate_code'),
)   
