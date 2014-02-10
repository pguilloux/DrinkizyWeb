from django import template

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