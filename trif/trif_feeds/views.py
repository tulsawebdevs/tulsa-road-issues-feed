from django.http import HttpResponse
from django.shortcuts import render_to_response
from django.views.decorators.http import require_http_methods

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
def alerts_atom(request):
    return to_do(request)

@require_http_methods(['GET'])
def alerts_json(request):
    return to_do(request)

@require_http_methods(['GET'])
def incidents(request):
    return to_do(request)

@require_http_methods(['GET'])
def incidents_dev(request):
    return to_do(request)

@require_http_methods(['GET'])
def incidents_atom(request):
    return to_do(request)

@require_http_methods(['GET'])
def incidents_json(request):
    return to_do(request)

@require_http_methods(['GET'])
def closures(request):
    return to_do(request)

@require_http_methods(['GET'])
def closures_dev(request):
    return to_do(request)

@require_http_methods(['GET'])
def closures_atom(request):
    return to_do(request)

@require_http_methods(['GET'])
def closures_json(request):
    return to_do(request)

