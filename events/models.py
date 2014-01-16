from django.db import models
from users.models import *
from bars.models import *

class Event(models.Model):
	slug = models.SlugField(max_length=200)

	name = models.CharField(max_length=200)
	description = models.CharField(max_length=200)

	start_date = models.DateTimeField()
	end_date = models.DateTimeField()

	user = models.ForeignKey('users.User')
	bar = models.ForeignKey('bars.Bar')

	def __unicode__(self):
		return "%s : %s" % (self.pseudo, self.comment)
