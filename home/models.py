from django.db import models

SLIDER_PICTURES_DIR = 'img/slider/'

class Slider(models.Model):
	title = models.CharField(max_length=200)
	subtitle = models.CharField(max_length=200)

	slug_object_linked = models.CharField(max_length=200)
	picture = models.ImageField(upload_to=SLIDER_PICTURES_DIR)

	def __unicode__(self):
		return "%s" % (self.title)

	def getImgUrl(self):
		return "%s%s" % (settings.MEDIA_URL+SLIDER_PICTURES_DIR, self.picture)