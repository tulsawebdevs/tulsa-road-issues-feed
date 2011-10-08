from datetime import datetime
from django.conf import settings
from json import loads
from trif_feeds.models import Incident, LocalClosure
from xml.dom import minidom
import urllib2

INCIDENT_URL = getattr(settings, 'INCIDENT_URL',
                       'http://www.cityoftulsa.org/rss/accident.aspx')
LOCAL_CLOSURE_URL = getattr(
    settings, 'LOCAL_CLOSURE_URL',
    'http://www.cityoftulsa.org/road-closure-map/map.aspx')


def geocode(address):
    url = ('http://maps.google.com/maps/api/geocode/json' +
           '?sensor=false&address=%s' % urllib2.quote(address))
    resp = urllib2.urlopen(url)
    data = loads(resp.read())
    geo = {'latitude': data['results'][0]['geometry']['location']['lat'],
           'longitude': data['results'][0]['geometry']['location']['lat']}
    return geo


def fetch_incidents():
    try:
        feed = urllib2.urlopen(INCIDENT_URL).read()
    except:
        'now what?'

    feed_data = minidom.parseString(feed)

    incidents = feed_data.getElementsByTagName('Incident')

    # Set existing items to ended, items still open will be "un-ended"
    Incident.objects.filter(end__isnull=True).update(end=datetime.now())

    for incident in incidents:
        try:
            category = incident.getElementsByTagName('Type')[0].firstChild.data
            description = incident.getElementsByTagName(
                'Description')[0].firstChild.data
            date = incident.getElementsByTagName('Date')[0].firstChild.data
            time = incident.getElementsByTagName('Time')[0].firstChild.data
            location = incident.getElementsByTagName(
                'Location')[0].firstChild.data

            start_date = datetime.strptime('%s %s' % (date, time),
                                         '%m/%d/%y %I:%M:%S %p')

            new_incident, created = Incident.objects.get_or_create(
                category=category, start=start_date, location=location)

            new_incident.description = description
            new_incident.end = None

            if created:
                address = '%s, Tulsa, OK' % location.split(';')[0]
                geo = geocode(address)
                if geo:
                    new_incident.latitude = geo['latitude']
                    new_incident.longitude = geo['longitude']

            new_incident.save()
        except:
            'now what?'


#def def_local_closures():
#    pass
