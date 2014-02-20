from django.db import models
from users.models import *
from bars.models import *
from drinks.models import *
from django.core.validators import *

class RankDrink(models.Model):

	drink_bar = models.ForeignKey('drinks.DrinkBar')
	user = models.ForeignKey('users.CustomUser')

	rank = models.FloatField(validators=[MinValueValidator(0.0), MaxValueValidator(10.0)])

	def __unicode__(self):
		return "%s %s %s" % (self.title, self.year, self)


class RankBar(models.Model):

	bar = models.ForeignKey('bars.Bar')
	user = models.ForeignKey('users.CustomUser')

	rank = models.FloatField(validators=[MinValueValidator(0.0), MaxValueValidator(10.0)])

	def __unicode__(self):
		return "%s %s %s" % (self.title, self.year, self)


class PriceBar(models.Model):

	bar = models.ForeignKey('bars.Bar')
	user = models.ForeignKey('users.CustomUser')

	price = models.FloatField(validators=[MinValueValidator(0.0), MaxValueValidator(4.0)])

	def __unicode__(self):
		return "%s %s %s" % (self.title, self.year, self)
