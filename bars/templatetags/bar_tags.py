from django import template
from bars.models import *

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
