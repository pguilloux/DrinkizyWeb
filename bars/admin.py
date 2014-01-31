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


admin.site.register(Bar, BarAdmin)
admin.site.register(OpeningHours, OpeningHoursAdmin)
admin.site.register(OpeningHoursBar, OpeningHoursBarAdmin)
admin.site.register(Theme, ThemeAdmin)
