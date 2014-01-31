from haystack.views import SearchView
from search.forms import CustomSearchForm
from haystack.query import SearchQuerySet

from drinks.models import *
from bars.models import *

from django.shortcuts import render

from django.shortcuts import render_to_response

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
        #q = self.request.GET.get('q')
        #if q:
        #context['categories'] = DrinkCategory.objects.all()
        #context['themes'] = Theme.objects.all()

        return context

    def get_query(self):

        if self.form.is_valid():
            #
            # added the following two lines.
            if not self.form.cleaned_data['q']:
                self.form.cleaned_data['q'] = u'*'

            return self.form.cleaned_data['q']

        return ''


    # def extra_context(self):
    #     '''
    #     Adds details about the facets applied
    #     '''
    #     extra = super(MultiFacetedSearchView, self).extra_context()
  
    #     if hasattr(self.form, 'cleaned_data') and 'selected_facets' in self.form.cleaned_data:
    #         extra['facets_applied'] = []
    #         for f in self.form.cleaned_data['selected_facets'].split("|"):
    #             facet = f.split(":")
    #             extra['facets_applied'].append({
    #                 'facet': facet[0][:-6], # removing the _exact suffix that haystack uses for some reason
    #                 'value' : facet[1].strip('"')
    #             })

    #     #extra['drinkbars'] = SearchQuerySet()
       
    #     return extra




