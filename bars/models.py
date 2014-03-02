from django.db import models
from DrinkizyWeb import settings
from users.models import *
from django.contrib.auth.models import User

class Theme(models.Model):
	slug = models.SlugField(max_length=200)
	name = models.CharField(max_length=200)
	description = models.CharField(max_length=2000)

	def __unicode__(self):
		return "%s" % (self.name)

class Bar(models.Model):
	slug = models.SlugField(max_length=200)
	name = models.CharField(max_length=200)
	description = models.CharField(max_length=3000, blank=True, null=True)
	address = models.CharField(max_length=200)
	phone = models.CharField(max_length=200, blank=True, null=True)
	website = models.CharField(max_length=200, blank=True, null=True)
	mail = models.CharField(max_length=200, blank=True, null=True)

	latitude = models.FloatField(blank=True, null=True)
	longitude = models.FloatField(blank=True, null=True)

	approval = models.IntegerField(default=0)
	disapproval = models.IntegerField(default=0)

	creator = models.ForeignKey('users.CustomUser')

	themes = models.ManyToManyField(Theme)

	def __unicode__(self):
		return "%s" % (self.name)

	def getImgUrl(self):
		return "%s%s%s" % (settings.MEDIA_URL+'bars/', self.slug, '.jpg')

	def getImgUrlList(self):
		return [image.image for image in self.images.all()]

	# def getThemes(self):
	# 	barThemes = ThemeBar.objects.filter(bar__slug=self.slug)
	# 	thems_of_bar = [themebar.theme for themebar in barThemes]
	# 	return thems_of_bar

class BarImage(models.Model):
    bar = models.ForeignKey(Bar, related_name='images')
    image = models.ImageField(upload_to='bars/')


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



# class ThemeBar(models.Model):
# 	bar = models.ForeignKey('Bar')
# 	theme = models.ForeignKey('Theme')

# 	def __unicode__(self):
# 		return "%s - %s" % (self.bar.name, self.theme.name)



class Station(models.Model):

	name = models.CharField(max_length=200)
	city = models.CharField(max_length=200)
	district = models.CharField(max_length=200)
	type = models.CharField(max_length=200)

	latitude = models.FloatField(blank=True, null=True)
	longitude = models.FloatField(blank=True, null=True)

	lines_numbers = models.CharField(max_length=200)

	def __unicode__(self):
		return "%s" % (self.name)

	def get_lines(self):
		return self.lines_numbers.split(", ")