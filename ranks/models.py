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
		return "%f %s" % (self.rank, self.user.pseudo)


class RankBar(models.Model):

	bar = models.ForeignKey('bars.Bar')
	user = models.ForeignKey('users.CustomUser')

	rank = models.FloatField(validators=[MinValueValidator(0.0), MaxValueValidator(10.0)])

	def __unicode__(self):
		return "%f %s" % (self.rank, self.user.pseudo)


class PriceBar(models.Model):

	bar = models.ForeignKey('bars.Bar')
	user = models.ForeignKey('users.CustomUser')

	price = models.FloatField(validators=[MinValueValidator(0.0), MaxValueValidator(3.0)])

	def __unicode__(self):
		return "%f %s" % (self.price, self.user.pseudo)
