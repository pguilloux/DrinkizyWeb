from django.conf.urls import patterns, include, url
from portal.views import *

urlpatterns = patterns('',

    # Main web portal entrance.
    #url(r'^$', portal_main_page, name='portal'),
    url(r'^compte/', portal_main_page, name='portal'),

)