from django.conf.urls import patterns, include, url

from django.contrib import admin
import autocomplete_light

from tastypie.api import Api
from bars.api import *
from drinks.api import *

autocomplete_light.autodiscover()
admin.autodiscover()

v1_api = Api(api_name='v1')

v1_api.register(ThemeResource())
v1_api.register(BarImageResource())
v1_api.register(CommentResource())
v1_api.register(BarResource())
v1_api.register(DrinkCategoryResource())
v1_api.register(DrinkSubCategoryResource())
v1_api.register(DrinkResource())
v1_api.register(DrinkBarResource())


urlpatterns = patterns('',
    # Examples:
    (r'', include('home.urls')),
    (r'', include('bars.urls')),
    (r'', include('drinks.urls')),
    (r'', include('search.urls')),
    (r'', include('portal.urls')),
    (r'^comments/', include('django.contrib.comments.urls')),

    (r'^api/', include(v1_api.urls)),
    #(r'^search/', include('haystack.urls')),
    # url(r'^$', 'DrinkizyWeb.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    url(r'^admin/', include(admin.site.urls)),
    url(r'^autocomplete/', include('autocomplete_light.urls')),


)
