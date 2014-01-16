from django.db import models
from DrinkizyWeb import settings
from users.models import *


class Bar(models.Model):
	slug = models.SlugField(max_length=200)
	name = models.CharField(max_length=200)
	address = models.CharField(max_length=200)
	coordinates = models.CharField(max_length=200)
	phone = models.CharField(max_length=200)

	approval = models.IntegerField()
	disapproval = models.IntegerField()

	picture = models.ImageField(upload_to='img/')

	creator = models.ForeignKey('users.CustomUser')
	theme = models.ForeignKey('Theme')

	def __unicode__(self):
		return "%s %s %s" % (self.title, self.year, self.synopsis)

	#def getImgUrl(self):
	#	return "%s%s" % (settings.MEDIA_URL, self.picture)


DAYS_OF_WEEK = (
    (1, 'Lundi'),
    (2, 'Mardi'),
    (3, 'Mercredi'),
    (4, 'Jeudi'),
    (5, 'Vendredi'),
    (6, 'Samedi'),
    (7, 'Dimanche'),
)


class OpeningHours(models.Model):
	start_hour = models.IntegerField()
	end_hour = models.IntegerField()
	start_happy_hour = models.IntegerField()
	end_happy_hour = models.IntegerField()

	day = models.IntegerField(choices=DAYS_OF_WEEK)

	def __unicode__(self):
		return "%s %s %s" % (self.title, self.year, self)


class OpeningHoursBar(models.Model):
	bar = models.ForeignKey('Bar')
	hours = models.ForeignKey('OpeningHours')

	def __unicode__(self):
		return "%s %s %s" % (self.title, self.year, self)


class Theme(models.Model):
	slug = models.SlugField(max_length=200)
	name = models.CharField(max_length=200)
	description = models.CharField(max_length=200)

	def __unicode__(self):
		return "%s %s %s" % (self.title, self.year, self.synopsis)

	#def getImgUrl(self):
	#	return "%s%s" % (settings.MEDIA_URL, self.picture)