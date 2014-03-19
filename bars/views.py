from django.shortcuts import render
from django.shortcuts import render_to_response
from django.template import RequestContext
from bars.models import *
from drinks.models import *
from ranks.models import *
from haystack.query import SearchQuerySet


def fiche_bar(request, slug): 
	bar = Bar.objects.get(slug=slug)
	drinks_in_bar = DrinkBar.objects.filter(bar__slug=slug)

	ranks = RankBar.objects.filter(bar__slug=slug)
	if ranks.__len__() > 0:
		ranks_sum = 0
		for rank in ranks:
			ranks_sum += rank.rank
		average_rank = ranks_sum/ranks.__len__()
	else:
		average_rank = 0

	prices = PriceBar.objects.filter(bar__slug=slug)
	if ranks.__len__() > 0:
		prices_sum = 0
		for price in prices:
			prices_sum += price.price
		average_price = prices_sum/prices.__len__()
	else:
		average_price = 0

	return render_to_response('bars/fiche_bar.html', {'bar': bar, 'drinks_in_bar': drinks_in_bar, 'ranks': ranks, 'average_rank': average_rank, 'prices': prices, 'average_price': average_price}, context_instance=RequestContext(request))


def bars_for_theme(request, slug): 
	theme = Theme.objects.get(slug=slug)
	themes = Theme.objects.all()
	bars_for_theme = Bar.objects.filter(themes__slug=slug)
	return render_to_response('bars/bars_for_theme.html', {'theme': theme, 'themes':themes, 'bars_for_theme': bars_for_theme}, context_instance=RequestContext(request))

