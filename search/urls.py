from django.conf.urls import patterns, include, url
from drinks.views import *
from haystack.forms import ModelSearchForm
from haystack.query import SearchQuerySet
from haystack.views import SearchView
from search.views import *
# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()


urlpatterns = patterns('',
    # Examples:

    url(r'^search/$', FacetedSearchView(), 
        name='search_all',
    ),

    # # url(r'^$', 'firstProject.views.home', name='home'),
    # url(r'^firstProject/', include('firstProject.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    # url(r'^admin/', include(admin.site.urls)),
)


# # Without threading...
# urlpatterns += patterns('haystack.views',
#     url(r'^$', SearchView(
#         template='templates/search/search.html',
#     ), name='bars_search'),
# )