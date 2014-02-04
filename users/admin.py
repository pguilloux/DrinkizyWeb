from django.contrib import admin
from drinks.models import *

class CustomUserAdmin(admin.ModelAdmin):
	model = CustomUser


admin.site.register(CustomUser, CustomUserAdmin)