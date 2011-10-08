from django.conf.urls.defaults import patterns, include, url

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    url(r'^$', 'trif_feeds.views.home', name='home'),
    url(r'^index.html|alerts.html|alerts$', 'trif_feeds.views.home'),
    url(r'^alerts.(?P<file_type>xml|json)$', 'trif_feeds.views.alerts_feed',
        name='alerts_feed'),
    url(r'^about.html$', 'trif_feeds.views.about', name='about'),
    url(r'^alerts/incidents.html$', 'trif_feeds.views.incidents',
        name='incidents'),
    url(r'^alerts/incidents$', 'trif_feeds.views.incidents'),
    url(r'^alerts/incidents.(?P<file_type>xml|json)$',
        'trif_feeds.views.incidents_feed', name='incidents_feed'),
    url(r'^alerts/incidents/in(?P<id>[0-9]+).html$',
        'trif_feeds.views.incident_details', name='incident_details'),
    url(r'^alerts/closures.html$', 'trif_feeds.views.closures',
        name='closures'),
    url(r'^alerts/closures$', 'trif_feeds.views.closures'),
    url(r'^alerts/closures.(?P<file_type>xml|json)$',
        'trif_feeds.views.closures_feed',  name='closures_feed'),
    url(r'^alerts/closures/cl(?P<id>[0-9]+).html$',
        'trif_feeds.views.closure_details', name='closure_details'),
    url(r'^alerts/closures/dot_cl(?P<id>[0-9]+).html$',
        'trif_feeds.views.dot_closure_details', name='dot_closure_details'),
    
    #url(r'^versions.html', 'trif_feeds.views.versions', name='versions'),

    # Uncomment the admin/doc line below to enable admin documentation:
    url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),
)
