from tastypie import fields
from tastypie.resources import ModelResource
from bars.models import *

class ThemeResource(ModelResource):
	class Meta:
		queryset = Theme.objects.all()
		resource_name = 'theme'


class BarResource(ModelResource):
	themes = fields.ToManyField(ThemeResource, 'themes')
	class Meta:
		queryset = Bar.objects.all()
		resource_name = 'bar'
