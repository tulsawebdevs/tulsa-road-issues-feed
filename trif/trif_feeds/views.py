from django.contrib.sites.models import Site
from django.http import HttpResponse
from django.shortcuts import render_to_response
from django.template import RequestContext
from django.views.decorators.http import require_http_methods
from trif_feeds.models import Incident, LocalClosure, DotClosure


def to_do(request):
    return HttpResponse('This view needs to be written.',
        mimetype="text/plain")


@require_http_methods(['GET'])
def home(request):
    return render_to_response('home.html')


@require_http_methods(['GET'])
def about(request):
    return render_to_response('about.html')


@require_http_methods(['GET'])
def alerts_feed(request, file_type='json'):
    incidents = Incident.objects.filter(end__isnull=True).order_by('-start')
    # Fix some buggy geo-tagging
    for i in incidents:
        if i.ensure_geo():
            assert(i.latitude is not None)
            i.save()
    closures = LocalClosure.objects.filter(end__isnull=True).order_by('-start')
    dot_closures = DotClosure.objects.filter(end__isnull=True).order_by('-start')

    template = 'feeds/alerts.%s' % file_type

    if file_type == 'json':
        mimetype = 'application/json'
    elif file_type == 'xml':
        mimetype = 'application/atom+xml'
    else:
        mimetype = 'text/plain'

    c = RequestContext(request, {'incidents': incidents, 'closures': closures,
                                 'dot_closures': dot_closures,
                                 'domain': Site.objects.get_current().domain})
    return render_to_response(template, context_instance=c, mimetype=mimetype)


@require_http_methods(['GET'])
def incidents(request):
    return render_to_response('incidents.html')


@require_http_methods(['GET'])
def incidents_dev(request):
    return to_do(request)


@require_http_methods(['GET'])
def incidents_feed(request, file_type='json'):
    incidents = Incident.objects.filter(end__isnull=True).order_by('-start')
    # Fix some buggy geo-tagging
    for i in incidents:
        if i.ensure_geo():
            assert(i.latitude is not None)
            i.save()

    template = 'feeds/incidents.%s' % file_type

    if file_type == 'json':
        mimetype = 'application/json'
    elif file_type == 'xml':
        mimetype = 'application/atom+xml'
    else:
        mimetype = 'text/plain'

    c = RequestContext(request, {'incidents': incidents,
                                 'domain': Site.objects.get_current().domain})
    return render_to_response(template, context_instance=c, mimetype=mimetype)


@require_http_methods(['GET'])
def incident_details(request, id):
    return HttpResponse(id)


@require_http_methods(['GET'])
def closures(request):
    return render_to_response('closures.html')


@require_http_methods(['GET'])
def closures_dev(request):
    return to_do(request)


@require_http_methods(['GET'])
def closures_feed(request, file_type='json'):
    closures = LocalClosure.objects.filter(end__isnull=True).order_by('-start')
    dot_closures = DotClosure.objects.filter(end__isnull=True).order_by(
        '-start')

    template = 'feeds/closures.%s' % file_type

    if file_type == 'json':
        mimetype = 'application/json'
    elif file_type == 'xml':
        mimetype = 'application/atom+xml'
    else:
        mimetype = 'text/plain'

    c = RequestContext(request, {'closures': closures,
                                 'dot_closures': dot_closures,
                                 'domain': Site.objects.get_current().domain})
    return render_to_response(template, context_instance=c, mimetype=mimetype)


@require_http_methods(['GET'])
def closure_details(request, id):
    return HttpResponse(id)

@require_http_methods(['GET'])
def dot_closure_details(request, id):
    return HttpResponse(id)

@require_http_methods(['GET'])
def about(request):
    return render_to_response('about.html')
