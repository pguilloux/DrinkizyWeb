from django.conf.urls import patterns, include, url

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    (r'', include('bars.urls')),
    (r'', include('drinks.urls')),
    (r'', include('search.urls')),
    #(r'^search/', include('haystack.urls')),
    # url(r'^$', 'DrinkizyWeb.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    url(r'^admin/', include(admin.site.urls)),
)
