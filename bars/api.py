from tastypie import fields
from tastypie.resources import ModelResource
from django.conf.urls.defaults import *
from django.core.paginator import Paginator, InvalidPage
from django.http import Http404
from haystack.query import SearchQuerySet
from tastypie.utils import trailing_slash
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


class DrinkResource(ModelResource):

	class Meta:
		queryset = Drink.objects.all()
		resource_name = 'Drink'



from django.conf.urls.defaults import *
from tastypie.paginator import Paginator
from tastypie.exceptions import BadRequest
from tastypie.resources import ModelResource
from tastypie.utils import trailing_slash
 
from haystack.query import SearchQuerySet, EmptySearchQuerySet
 

 
class DrinkBarResource(ModelResource):
	bar = fields.ForeignKey(BarResource, 'bar')
 	drink = fields.ForeignKey(DrinkResource, 'drink')
	class Meta:
		queryset = DrinkBar.objects.all()
		resource_name = 'drinkbar'
	 
	# Custom search endpoint
	def override_urls(self):
		return [
			url(r"^(?P<resource_name>%s)/search/?$" % (self._meta.resource_name), self.wrap_view('get_search'), name="api_get_search"),
		]
	 
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
