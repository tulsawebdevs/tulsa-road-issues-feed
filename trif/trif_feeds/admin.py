from django.contrib import admin
from models import Incident, LocalClosure


class IncidentAdmin(admin.ModelAdmin):
    model = Incident

class LocalClosureAdmin(admin.ModelAdmin):
    model = LocalClosure


admin.site.register(Incident, IncidentAdmin)
admin.site.register(LocalClosure, LocalClosureAdmin)
