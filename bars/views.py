from django.shortcuts import render
from django.shortcuts import render_to_response
from bars.models import *
from haystack.query import SearchQuerySet


def fiche_bar(request, slug): 
	bar = Bar.objects.get(slug=slug)
	drinks_in_bar = SearchQuerySet().filter(bar__slug=slug)
	return render_to_response('bars/fiche_bar.html', {'bar': bar, 'drinks_in_bar': drinks_in_bar})


def bars_for_theme(request, slug): 
	theme = Theme.objects.get(slug=slug)
	themes = Theme.objects.all()
	bars_for_theme = SearchQuerySet().filter(theme__slug=slug)
	return render_to_response('bars/bars_for_theme.html', {'theme': theme, 'themes':themes, 'bars_for_theme': bars_for_theme})



