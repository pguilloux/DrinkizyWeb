from django.conf.urls import patterns, include, url

from django.contrib import admin
import autocomplete_light

autocomplete_light.autodiscover()
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    (r'', include('home.urls')),
    (r'', include('bars.urls')),
    (r'', include('drinks.urls')),
    (r'', include('search.urls')),
    #(r'^search/', include('haystack.urls')),
    # url(r'^$', 'DrinkizyWeb.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    url(r'^admin/', include(admin.site.urls)),
    url(r'^autocomplete/', include('autocomplete_light.urls')),
)
