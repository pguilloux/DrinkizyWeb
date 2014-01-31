from django.contrib import admin
from drinks.models import *

class DrinkAdmin(admin.ModelAdmin):
	model = Drink

class DrinkCategoryAdmin(admin.ModelAdmin):
	model = DrinkCategory

class DrinkSubCategoryAdmin(admin.ModelAdmin):
	model = DrinkSubCategory

class DrinkBarAdmin(admin.ModelAdmin):
	model = DrinkBar


admin.site.register(Drink, DrinkAdmin)
admin.site.register(DrinkCategory, DrinkCategoryAdmin)
admin.site.register(DrinkSubCategory, DrinkSubCategoryAdmin)
admin.site.register(DrinkBar, DrinkBarAdmin)