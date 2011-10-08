from django.db import models
from django_extensions.db.models import TimeStampedModel


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
