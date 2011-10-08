from django.conf.urls.defaults import patterns, include, url

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    url(r'^$', 'trif.views.home', name='home'),
    url(r'^index.html|alerts.html$', 'trif.views.home'),
    url(r'^alerts.dev.html', 'trif.views.alerts_dev', name='alerts_dev'),
    url(r'^alerts.xml', 'trif.views.alerts_atom', name='alerts_atom'),
    url(r'^alerts.json', 'trif.views.alerts_json', name='alerts_json'),
    url(r'^alerts/incidents.html$', 'trif.views.incidents', name='incidents'),
    url(r'^alerts/incidents.dev.html', 'trif.views.incidents_dev',
        name='incidents_dev'),
    url(r'^alerts/incidents.xml', 'trif.views.incidents_atom', 
        name='incidents_atom'),
    url(r'^alerts/incidents.json', 'trif.views.incidents_json', 
        name='incidents_json'),
    url(r'^alerts/closures.html$', 'trif.views.closures', name='closures'),
    url(r'^alerts/closures.dev.html', 'trif.views.closures_dev',
        name='closures_dev'),
    url(r'^alerts/closures.xml', 'trif.views.closures_atom', 
        name='closures_atom'),
    url(r'^alerts/closures.json', 'trif.views.closures_json', 
        name='closures_json'),
    #url(r'^versions.html', 'trif.views.versions', name='versions'),

    # Uncomment the admin/doc line below to enable admin documentation:
    url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),
)
