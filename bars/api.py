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
            #'user': ALL_WITH_RELATIONS,
            #'created': ['exact', 'range', 'gt', 'gte', 'lt', 'lte'],
        }

