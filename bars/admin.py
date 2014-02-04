from django.contrib import admin
from drinks.models import *

class BarAdmin(admin.ModelAdmin):
	model = Bar

class OpeningHoursAdmin(admin.ModelAdmin):
	model = OpeningHours

class OpeningHoursBarAdmin(admin.ModelAdmin):
	model = OpeningHoursBar

class ThemeAdmin(admin.ModelAdmin):
	model = Theme

class StationAdmin(admin.ModelAdmin):
	model = Station

admin.site.register(Bar, BarAdmin)
admin.site.register(OpeningHours, OpeningHoursAdmin)
admin.site.register(OpeningHoursBar, OpeningHoursBarAdmin)
admin.site.register(Theme, ThemeAdmin)
admin.site.register(Station, StationAdmin)
