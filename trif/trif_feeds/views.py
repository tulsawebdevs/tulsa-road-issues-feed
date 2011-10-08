from django.contrib.sites.models import Site
from django.http import HttpResponse
from django.shortcuts import render_to_response
from django.template import RequestContext
from django.views.decorators.http import require_http_methods
from trif_feeds.models import Incident, LocalClosure


def to_do(request):
    return HttpResponse('This view needs to be written.',
        mimetype="text/plain")


@require_http_methods(['GET'])
def home(request):
    return render_to_response('home.html')


@require_http_methods(['GET'])
def alerts_dev(request):
    return render_to_response('alerts.dev.html')


@require_http_methods(['GET'])
def alerts_feed(request, file_type='json'):
    return HttpResponse(file_type)


@require_http_methods(['GET'])
def incidents(request):
    return to_do(request)


@require_http_methods(['GET'])
def incidents_dev(request):
    return to_do(request)


@require_http_methods(['GET'])
def incidents_feed(request, file_type='json'):
    incidents = Incident.objects.filter(end__isnull=True).order_by('-start')

    template = 'feeds/incidents.%s' % file_type

    c = RequestContext(request, {'alerts': incidents,
                                 'domain': Site.objects.get_current().domain})
    return render_to_response(template, context_instance=c)


@require_http_methods(['GET'])
def incident_details(request, id):
    return HttpResponse(id)


@require_http_methods(['GET'])
def closures(request):
    return to_do(request)


@require_http_methods(['GET'])
def closures_dev(request):
    return to_do(request)


@require_http_methods(['GET'])
def closures_feed(request, file_type='json'):
    closures = LocalClosure.objects.filter(end__isnull=True).order_by('-start')

    template = 'feeds/closures.%s' % file_type

    c = RequestContext(request, {'alerts': closures,
                                 'domain': Site.objects.get_current().domain})
    return render_to_response(template, context_instance=c)


@require_http_methods(['GET'])
def closure_details(request, id):
    return HttpResponse(id)
