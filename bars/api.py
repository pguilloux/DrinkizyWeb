from tastypie import fields
from tastypie.resources import ModelResource
from bars.models import *

class ThemeResource(ModelResource):
	class Meta:
		queryset = Theme.objects.all()
		resource_name = 'theme'


class BarResource(ModelResource):
	theme = fields.ForeignKey(ThemeResource, 'theme')
	class Meta:
		queryset = Bar.objects.all()
		resource_name = 'bar'
