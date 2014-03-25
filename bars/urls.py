from django.conf.urls import patterns, include, url
from bars.views import *
# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    url(r'^bar/(?P<slug>[\w-]+)/$', fiche_bar, name='fiche_bar'),
    url(r'^theme/(?P<slug>[\w-]+)/$', bars_for_theme, name='bars_for_theme'),
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