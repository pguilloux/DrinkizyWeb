from tastypie import fields

from django.conf.urls import patterns, url, include
from tastypie.paginator import Paginator
from tastypie.exceptions import BadRequest
from tastypie.resources import ModelResource
from tastypie.utils import trailing_slash
from tastypie.resources import ModelResource, ALL, ALL_WITH_RELATIONS

from django.http import Http404
from haystack.query import SearchQuerySet, EmptySearchQuerySet

from bars.models import *
from drinks.models import *

import simplejson, urllib

import logging, operator
logger = logging.getLogger(__name__)

class BarImageResource(ModelResource):
	class Meta:
		queryset = BarImage.objects.all()
		resource_name = 'image'

class ThemeResource(ModelResource):
	class Meta:
		queryset = Theme.objects.all()
		resource_name = 'theme'


class BarResource(ModelResource):
	images = fields.ToManyField(BarImageResource, 'images', full=True)
	themes = fields.ToManyField(ThemeResource, 'themes', full=True)
	class Meta:
		queryset = Bar.objects.all()
		resource_name = 'bar'
		filtering = {
			'slug': ALL_WITH_RELATIONS,
			# 'user': ALL_WITH_RELATIONS,
			# 'created': ['exact', 'range', 'gt', 'gte', 'lt', 'lte'],
			# 'distance': ALL_WITH_RELATIONS,
		}

	def apply_sorting(self, objects, options=None):


		if options and "distance" in options and "longitud" in options and "latitud" in options:
			
			
			latitud = float(options['latitud'])
			longitud = float(options['longitud'])
			orig_coord = latitud, longitud
			
			for bar in Bar.objects.all():
				
				dest_coord = bar.latitude, bar.longitude
				
				url = "http://maps.googleapis.com/maps/api/distancematrix/json?origins={0}&destinations={1}&mode=walking&language=en-EN&sensor=false".format(str(orig_coord),str(dest_coord))
				result= simplejson.load(urllib.urlopen(url))
				
				distance = result['rows'][0]['elements'][0]['distance']['value']

				if distance > int(options['distance']):
					logger.warning('toto')
					objects = objects.exclude(name__exact=bar.name)
				#else:
					#self.bar_distances[bar.name] = distance

			return objects
 
		return super(BarResource, self).apply_sorting(objects, options)

