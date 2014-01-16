from django.db import models
from bars.models import *

class Drink(models.Model):
	slug = models.SlugField(max_length=200)
	name = models.CharField(max_length=200)
	description = models.CharField(max_length=2000)

	approval = models.IntegerField()
	disapproval = models.IntegerField()

	subcategory = models.ForeignKey('DrinkSubCategory')

	def __unicode__(self):
		return "%s %s %s" % (self.name, self.description, self.subcategory)

	#def getImgUrl(self):
	#	return "%s%s" % (settings.MEDIA_URL, self.picture)

class DrinkCategory(models.Model):
	slug = models.SlugField(max_length=200)
	name = models.CharField(max_length=200)
	description = models.CharField(max_length=200)

	def __unicode__(self):
		return "%s %s" % (self.name, self.description)


class DrinkSubCategory(models.Model):
	slug = models.SlugField(max_length=200)
	name = models.CharField(max_length=200)
	description = models.CharField(max_length=200)
	category = models.ForeignKey('DrinkCategory')

	def __unicode__(self):
		return "%s %s %s" % (self.name, self.category, self.description)


class DrinkBar(models.Model):
	slug = models.SlugField(max_length=200)

	price = models.FloatField()
	price_happy_hour = models.FloatField()

	drink = models.ForeignKey('Drink')
	bar = models.ForeignKey('bars.Bar')

	def __unicode__(self):
		return "%s %s %s" % (self.title, self.year, self)