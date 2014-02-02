from django.shortcuts import render
from django.shortcuts import render_to_response
from bars.models import *
from haystack.query import SearchQuerySet


def fiche_bar(request, slug): 
	bar = Bar.objects.get(slug=slug)
	drinks_in_bar = SearchQuerySet().filter(bar__slug=slug)
	return render_to_response('bars/fiche_bar.html', {'bar': bar, 'drinks_in_bar': drinks_in_bar})

