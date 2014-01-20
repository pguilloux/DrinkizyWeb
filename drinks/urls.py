from django.conf.urls import patterns, include, url
from drinks.views import *
# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    url(r'^categories', categories, name='categories'),
    # url(r'^movies', movies, name='movies'),
    url(r'^category/(?P<slug>[\w-]+)/$', category, name='category'),
    url(r'^subcategory/(?P<slug>[\w-]+)/$', subcategory, name='subcategory'),
    url(r'^drink/(?P<slug>[\w-]+)/$', drink, name='drink'),
    # # url(r'^$', 'firstProject.views.home', name='home'),
    # url(r'^firstProject/', include('firstProject.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    # url(r'^admin/', include(admin.site.urls)),
)