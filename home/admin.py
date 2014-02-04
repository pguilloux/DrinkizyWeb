from django.contrib import admin
from home.models import *

class SliderAdmin(admin.ModelAdmin):
	model = Slider


admin.site.register(Slider, SliderAdmin)
