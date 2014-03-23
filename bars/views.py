from django.shortcuts import render
from django.shortcuts import render_to_response
from django.template import RequestContext
from bars.models import *
from bars.forms import *
from drinks.models import *
from haystack.query import SearchQuerySet

import logging, operator
logger = logging.getLogger(__name__)

def fiche_bar(request, slug): 
	bar = Bar.objects.get(slug=slug)
	user = request.user
	drinks_in_bar = DrinkBar.objects.filter(bar__slug=slug)
	current_rank_of_user = RankBar.objects.filter(user=user).filter(bar=bar)

	if request.method == 'POST':
		rank_form = RankBarForm(request.POST) # A form bound to the POST data

		if rank_form.is_valid(): # All validation rules pass

			rank = rank_form.cleaned_data['rank']
			if rank >= 0 and rank <= 10:
				if not current_rank_of_user:
					new_rank = RankBar.objects.create(bar=bar, user=user, rank=rank).save()
				else:
					RankBar.objects.filter(user=user, bar=bar).update(rank=rank)

	else:
		rank_form = RankBarForm() # An unbound form

	return render_to_response('bars/fiche_bar.html', {'rank_form': rank_form, 'bar': bar, 'drinks_in_bar': drinks_in_bar, 'current_rank_of_user': current_rank_of_user}, context_instance=RequestContext(request))


def bars_for_theme(request, slug): 
	theme = Theme.objects.get(slug=slug)
	themes = Theme.objects.all()
	bars_for_theme = Bar.objects.filter(themes__slug=slug)
	return render_to_response('bars/bars_for_theme.html', {'theme': theme, 'themes':themes, 'bars_for_theme': bars_for_theme}, context_instance=RequestContext(request))

