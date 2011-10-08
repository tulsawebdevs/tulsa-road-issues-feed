from datetime import datetime
from django.conf import settings
from trif_feeds.models import Incident, LocalClosure
from xml.dom import minidom
import re

INCIDENT_URL = getattr(settings, 'INCIDENT_URL',
                       'http://www.cityoftulsa.org/rss/accident.aspx')
LOCAL_CLOSURE_URL = getattr(
    settings, 'LOCAL_CLOSURE_URL',
    'http://www.cityoftulsa.org/road-closure-map/map.aspx')


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
            new_incident.ensure_geo()
            new_incident.save()
        except:
            'now what?'


def fetch_local_closures():
    try:
        feed = urllib2.urlopen(LOCAL_CLOSURE_URL).read()
    except:
        'now what?'

    LocalClosure.objects.filter(end__isnull=True).update(end=datetime.now())

    closures = re.findall(
        'addPoint\((?P<lat>[^\,]+),(?P<lng>[^\,]+),(?:\")(?P<title>.*?)(?:\"),'
        '(?:\")(?P<description>.*?)(?:\"),(?:\")(?P<type>.*?)(?:\"),(?:\")'
        '(?P<color>.*?)(?:\"),(?:\")(?P<link>.*?)(?:\")', feed)
    for closure in closures:
        try:
            latitude = closure[0]
            longitude = closure[1]
            title = closure[2]
            description = closure[3]
            category = closure[4]
            link = closure[6]

            new_closure, created = LocalClosure.objects.get_or_create(
                title=title, link=link, latitude=latitude, longitude=longitude,
                category=category)

            new_closure.description = description
            new_closure.end = None

            if created:
                new_closure.start = datetime.now()

            new_closure.save()
        except:
            'now what?'
