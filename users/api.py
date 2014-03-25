from tastypie import fields

from django.conf.urls import patterns, url, include
from tastypie.paginator import Paginator
from tastypie.exceptions import BadRequest
from tastypie.resources import ModelResource
from tastypie.utils import trailing_slash
from tastypie.resources import ModelResource, ALL, ALL_WITH_RELATIONS

from users.models import *


class CustomUserResource(ModelResource):
	class Meta:
		queryset = CustomUser.objects.all()
		resource_name = 'user'

