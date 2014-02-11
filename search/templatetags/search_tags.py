from django import template
from search.forms import CustomSearchForm

register = template.Library()

def get_search_bar():
    return {'form': CustomSearchForm()}

register.inclusion_tag('search/search_bar.html')(get_search_bar)