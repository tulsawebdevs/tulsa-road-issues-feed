from django.db import models
from django_extensions.db.models import TimeStampedModel
from django.core.urlresolvers import reverse
import urllib2
from json import loads

def geocode(address):
    url = ('http://maps.google.com/maps/api/geocode/json' +
           '?sensor=false&address=%s' % urllib2.quote(address))
    resp = urllib2.urlopen(url)
    data = loads(resp.read())
    geo = {'latitude': data['results'][0]['geometry']['location']['lat'],
           'longitude': data['results'][0]['geometry']['location']['lng']}
    return geo

class Incident(TimeStampedModel):
    category = models.CharField(max_length=100, blank=True, db_index=True)
    location = models.CharField(max_length=255, blank=True)
    description = models.TextField(blank=True)
    start = models.DateTimeField(null=True, blank=True)
    end = models.DateTimeField(null=True, blank=True)
    latitude = models.DecimalField(max_digits=13, decimal_places=8, null=True,
                                   blank=True)
    longitude = models.DecimalField(max_digits=13, decimal_places=8, null=True,
                                    blank=True)

    def __unicode__(self):
        return u'%s - %s - %s' % (self.category, self.location, self.start)

    def get_absolute_url(self):
        return reverse('incident_details', args=[self.id])

    def ensure_geo(self, refresh=False):
        '''Return True if the geo-tagging changed'''
        unset = (not self.latitude or not self.latitude)
        wrong = (str(self.latitude) == str(self.longitude))
        if refresh or unset or wrong:
            address = '%s, Tulsa, OK' % self.location.split(';')[0]
            geo = geocode(address)
            if geo:
                self.latitude = str(geo['latitude'])
                self.longitude = str(geo['longitude'])
                return True


class LocalClosure(TimeStampedModel):
    category = models.CharField(max_length=100, blank=True, db_index=True)
    title = models.CharField(max_length=100, blank=True)
    description = models.TextField(blank=True)
    start = models.DateTimeField(null=True, blank=True)
    end = models.DateTimeField(null=True, blank=True)
    latitude = models.DecimalField(max_digits=13, decimal_places=8, null=True,
                                   blank=True)
    longitude = models.DecimalField(max_digits=13, decimal_places=8, null=True,
                                    blank=True)
    link = models.CharField(max_length=500, blank=True)

    def __unicode__(self):
        return u'%s - %s - %s' % (self.category, self.title, self.start)

    def get_absolute_url(self):
        return reverse('closure_details', args=[self.id])


# Not yet implemented
#class DotClosure(TimeStampedModel):
#    category = models.CharField(max_length=100, blank=True, db_index=True)
#    description = models.TextField(blank=True)
#    start = models.DateTimeField(null=True, blank=True)
#    end = models.DateTimeField(null=True, blank=True)
#    latitude = models.DecimalField(max_digits=13, decimal_places=8, null=True,
#                                   blank=True)
#    longitude = models.DecimalField(max_digits=13, decimal_places=8,
#                                    null=True, blank=True)
