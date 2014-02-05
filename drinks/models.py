from django.db import models
from bars.models import *

class Drink(models.Model):
	slug = models.SlugField(max_length=200)
	name = models.CharField(max_length=200)
	description = models.CharField(max_length=3000)

	subcategory = models.ForeignKey('DrinkSubCategory')
	creator = models.ForeignKey('users.CustomUser', blank=True, null=True)

	def __unicode__(self):
		return "%s %s %s" % (self.name, self.description, self.subcategory)

	#def getImgUrl(self):
	#	return "%s%s" % (settings.MEDIA_URL, self.picture)

class DrinkCategory(models.Model):
	slug = models.SlugField(max_length=200)
	name = models.CharField(max_length=200)
	description = models.CharField(max_length=2000)

	def __unicode__(self):
		return "%s" % (self.name)


class DrinkSubCategory(models.Model):
	slug = models.SlugField(max_length=200)
	name = models.CharField(max_length=200)
	description = models.CharField(max_length=2000)
	category = models.ForeignKey('DrinkCategory')

	def __unicode__(self):
		return "%s" % (self.name)


class DrinkBar(models.Model):

	price = models.FloatField()
	price_happy_hour = models.FloatField()

	drink = models.ForeignKey('Drink')
	bar = models.ForeignKey('bars.Bar')

	approval = models.IntegerField(default=0)
	disapproval = models.IntegerField(default=0)

	def __unicode__(self):
		return "%s %s %s" % (self.drink.name, self.bar.name, self.price)