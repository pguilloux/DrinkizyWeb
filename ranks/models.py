from django.db import models
from users.models import *
from bars.models import *
from drinks.models import *

class RankDrink(models.Model):
	slug = models.SlugField(max_length=200)

	drink_bar = models.ForeignKey('drinks.DrinkBar')
	user = models.ForeignKey('users.User')

	rank = models.FloatField(min=0.0, max=5.0)

	def __unicode__(self):
		return "%s %s %s" % (self.title, self.year, self)


class RankBar(models.Model):
	slug = models.SlugField(max_length=200)

	bar = models.ForeignKey('bars.Bar')
	user = models.ForeignKey('users.User')

	rank = models.FloatField(min=0.0, max=5.0)

	def __unicode__(self):
		return "%s %s %s" % (self.title, self.year, self)
