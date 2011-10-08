from django.conf.urls.defaults import patterns, include, url

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    url(r'^$', 'trif_feeds.views.home', name='home'),
    url(r'^index.html|alerts.html$', 'trif_feeds.views.home'),
    url(r'^alerts.dev.html$', 'trif_feeds.views.alerts_dev',
        name='alerts_dev'),
    url(r'^alerts.xml', 'trif_feeds.views.alerts_atom', name='alerts_atom'),
    url(r'^alerts.json', 'trif_feeds.views.alerts_json', name='alerts_json'),
    url(r'^alerts/incidents.html$', 'trif_feeds.views.incidents',
        name='incidents'),
    url(r'^alerts/incidents.dev.html', 'trif_feeds.views.incidents_dev',
        name='incidents_dev'),
    url(r'^alerts/incidents.xml', 'trif_feeds.views.incidents_atom', 
        name='incidents_atom'),
    url(r'^alerts/incidents.json', 'trif_feeds.views.incidents_json', 
        name='incidents_json'),
    url(r'^alerts/closures.html$', 'trif_feeds.views.closures',
        name='closures'),
    url(r'^alerts/closures.dev.html', 'trif_feeds.views.closures_dev',
        name='closures_dev'),
    url(r'^alerts/closures.xml', 'trif_feeds.views.closures_atom', 
        name='closures_atom'),
    url(r'^alerts/closures.json', 'trif_feeds.views.closures_json', 
        name='closures_json'),
    #url(r'^versions.html', 'trif_feeds.views.versions', name='versions'),

    # Uncomment the admin/doc line below to enable admin documentation:
    url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),
)
