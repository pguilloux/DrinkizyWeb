from django.shortcuts import render
from django.shortcuts import render_to_response
from django.template import RequestContext
from bars.models import *
from bars.forms import *
from drinks.models import *
from haystack.query import SearchQuerySet


def fiche_bar(request, slug): 
	bar = Bar.objects.get(slug=slug)
	drinks_in_bar = DrinkBar.objects.filter(bar__slug=slug)

	if request.method == 'POST':
		rank_form = RankBarForm(request.POST) # A form bound to the POST data

		if rank_form.is_valid(): # All validation rules pass
			rank = rank_form.save()

	else:
		rank_form = RankBarForm() # An unbound form

	return render_to_response('bars/fiche_bar.html', {'bar': bar, 'drinks_in_bar': drinks_in_bar}, context_instance=RequestContext(request))


def bars_for_theme(request, slug): 
	theme = Theme.objects.get(slug=slug)
	themes = Theme.objects.all()
	bars_for_theme = Bar.objects.filter(themes__slug=slug)
	return render_to_response('bars/bars_for_theme.html', {'theme': theme, 'themes':themes, 'bars_for_theme': bars_for_theme}, context_instance=RequestContext(request))

