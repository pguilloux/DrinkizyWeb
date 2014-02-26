from tastypie import fields
from tastypie.resources import ModelResource
from tastypie.paginator import Paginator
from tastypie.exceptions import BadRequest
from tastypie.utils import trailing_slash

from django.http import Http404
from haystack.query import SearchQuerySet, EmptySearchQuerySet
from django.conf.urls import patterns, url, include
from bars.models import *
from drinks.models import *

class ThemeResource(ModelResource):
	class Meta:
		queryset = Theme.objects.all()
		resource_name = 'theme'


class BarResource(ModelResource):
	themes = fields.ToManyField(ThemeResource, 'themes')
	class Meta:
		queryset = Bar.objects.all()
		resource_name = 'bar'



 

 

 
