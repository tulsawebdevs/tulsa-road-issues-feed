from django.contrib import admin
from models import Incident, LocalClosure, DotClosure

admin.site.register(Incident)
admin.site.register(LocalClosure)
admin.site.register(DotClosure)
