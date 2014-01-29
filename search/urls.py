from django.conf.urls import patterns, include, url
from drinks.views import *
from search.forms import MultiFacetedSearchForm
from haystack.query import SearchQuerySet
from search.views import MultiFacetedSearchView
from search.views import *
# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

sqs = SearchQuerySet().facet("bar")

# urlpatterns = patterns('',
#     url(r'^search/$', FacetedSearchView(searchqueryset=sqs), name='search_all'),
# )


urlpatterns = patterns('haystack.views',
    url(r'^search/$', MultiFacetedSearchView(form_class=MultiFacetedSearchForm, searchqueryset=sqs), name='haystack_search'),
)

# # Without threading...
# urlpatterns += patterns('haystack.views',
#     url(r'^$', SearchView(
#         template='templates/search/search.html',
#     ), name='bars_search'),
# )