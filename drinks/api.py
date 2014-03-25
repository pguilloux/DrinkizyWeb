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
from bars.api import *


class DrinkCategoryResource(ModelResource):
	class Meta:
		queryset = DrinkCategory.objects.all()
		resource_name = 'drink-category'
 

class DrinkSubCategoryResource(ModelResource):
	category = fields.ForeignKey(DrinkCategoryResource, 'category', full=True)
	class Meta:
		queryset = DrinkSubCategory.objects.all()
		resource_name = 'drink-subcategory'


class DrinkResource(ModelResource):
	subcategory = fields.ForeignKey(DrinkSubCategoryResource, 'subcategory', full=True)
	class Meta:
		queryset = Drink.objects.all()
		resource_name = 'drink'

 
class DrinkBarResource(ModelResource):
	bar = fields.ForeignKey(BarResource, 'bar')
	drink = fields.ForeignKey(DrinkResource, 'drink', full=True)
	class Meta:
		queryset = DrinkBar.objects.all()
		resource_name = 'drinkbar'
		filtering = {
            'bar': ALL_WITH_RELATIONS,
            #'user': ALL_WITH_RELATIONS,
            #'created': ['exact', 'range', 'gt', 'gte', 'lt', 'lte'],
        }
	 
    # Custom search endpoint
	def prepend_urls(self):
		return [
			url(r"^(?P<resource_name>%s)/search/?$" % (self._meta.resource_name), self.wrap_view('get_search'), name="api_get_search"),
		]


	# # Custom search endpoint
	# def override_urls(self):
	# 	return [
	# 		url(r"^(?P<resource_name>%s)/search/?$" % (self._meta.resource_name), self.wrap_view('get_search'), name="api_get_search"),
	# 	]
	 
	def get_search(self, request, **kwargs):
		'''
		Custom endpoint for search
		'''
		 
		self.method_check(request, allowed=['get'])
		self.is_authenticated(request)
		self.throttle_check(request)
		 
		query = request.GET.get('q', None)

		if not query:
			raise BadRequest('Please supply the search parameter (e.g. "/api/v1/drinkbar/search/?q=css")')
		 
		results = SearchQuerySet().models(DrinkBar).auto_query(query)
		if not results:
			results = EmptySearchQuerySet()

		paginator = Paginator(request.GET, results, resource_uri='/api/v1/drinkbar/search/')
			 
		bundles = []
		for result in paginator.page()['objects']:
			bundle = self.build_bundle(obj=result.object, request=request)
			bundles.append(self.full_dehydrate(bundle))
			 
		object_list = {
			'meta': paginator.page()['meta'],
			'objects': bundles
		}

		object_list['meta']['search_query'] = query
		 
		self.log_throttled_access(request)

		return self.create_response(request, object_list)
