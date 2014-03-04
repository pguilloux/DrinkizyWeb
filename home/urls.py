from django.conf.urls import patterns, include, url
from home.views import *
# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    url(r'^$', home, name='home'),
    url(r'^faq/$', faq, name='faq'),

    url(r'^login/$', 'django.contrib.auth.views.login'),
    url(r'^logout/$', logout_view, name='logout_view'),
    url(r'^inscription/$', registration, name='registration'),

    #url(r'^portal/', include('portal.urls'), name='portal'),
    # url(r'^movies', movies, name='movies'),
    # url(r'^film/(?P<slug>[\w-]+)/$', movie_details, name='movie_details'),
    # url(r'^director/(?P<slug>[\w-]+)/$', director_details, name='director_details'),
    # # url(r'^$', 'firstProject.views.home', name='home'),
    # url(r'^firstProject/', include('firstProject.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    # url(r'^admin/', include(admin.site.urls)),
)