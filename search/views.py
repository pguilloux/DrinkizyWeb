from haystack.views import SearchView
from search.forms import CustomSearchForm
from haystack.query import SearchQuerySet

from drinks.models import *
from bars.models import *

import logging

from django.shortcuts import render

from django.shortcuts import render_to_response

logger = logging.getLogger(__name__)

class CustomSearchView(SearchView):
    """
    Search view for multifaceted searches
    """
    template = 'search/search.html'
  
    def __call__(self, request, *args, **kwargs):
        """
        Generates the actual response to the search.
  
        Relies on internal, overridable methods to construct the response.
        """
        return super(CustomSearchView, self).__call__(request, *args, **kwargs)
  
    @property
    def __name__(self):
        return "CustomSearchView"
  

    def get_context_data(self, **kwargs):
        context = super(CustomSearchView, self).get_context_data(**kwargs)
        return context

    def get_query(self):

        if self.form.is_valid():
            #
            # added the following two lines.
            if not self.form.cleaned_data['q']:
                self.form.cleaned_data['q'] = u'*'

            return self.form.cleaned_data['q']

        return ''


    def extra_context(self):
        '''
        Adds details about the facets applied
        '''
        extra = super(CustomSearchView, self).extra_context()
        

        if self.form.is_valid():
            if self.form.cleaned_data['station']:
                if self.form.cleaned_data['distance']:
                    extra['bar_distances'] = self.form.get_bar_distances()
        return extra




