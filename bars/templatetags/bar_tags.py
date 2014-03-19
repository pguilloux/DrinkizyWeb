from django import template
from bars.models import *
from ranks.models import *

register = template.Library()

@register.filter
def keyvalue(dict, key):    
	return dict[key]

@register.filter
def nb_bars(dict):
	bars = []
	for result in dict:
		if result.object.bar not in bars:
			bars.append(result.object.bar)
	return len(bars)

@register.assignment_tag
def get_themes():
	return Theme.objects.all()

@register.assignment_tag
def get_bars_for_theme(theme_slug):
	return Bar.objects.filter(themes__slug=theme_slug).order_by('?')[:1]

@register.assignment_tag
def get_ranks(bar_slug):
	return RankBar.objects.filter(bar__slug=bar_slug)

@register.assignment_tag
def get_average_rank(bar_slug):
	ranks = RankBar.objects.filter(bar__slug=bar_slug)
	ranks_sum = 0
	if ranks.__len__() > 0:
		for rank in ranks:
			ranks_sum += rank.rank
		return ranks_sum/ranks.__len__()
	else:
		return 0
	
@register.assignment_tag
def get_prices(bar_slug):
	return PriceBar.objects.filter(bar__slug=bar_slug)

@register.assignment_tag
def get_average_price(bar_slug):
	prices = PriceBar.objects.filter(bar__slug=bar_slug)
	prices_sum = 0
	if prices.__len__() > 0:
		for price in prices:
			prices_sum += price.price
		return prices_sum/prices.__len__()
	else:
		return 0