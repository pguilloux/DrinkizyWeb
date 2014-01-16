from django.db import models
from users.models import *

class Comment(models.Model):
	slug = models.SlugField(max_length=200)

	text = models.CharField(max_length=200)

	author = models.ForeignKey('users.User')
	bar = models.ForeignKey('bars.Bar')

	def __unicode__(self):
		return "%s : %s" % (self.pseudo, self.comment)
