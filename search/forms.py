from django import forms
from haystack.forms import FacetedSearchForm
from drinks.models import *
from django.forms.widgets import *
from django.http import HttpResponse
import logging

categoriesList = DrinkCategory.objects.all()
categoriesNames = [(category.slug, category.name) for category in categoriesList]    

#categoriesNames = list(enumerate(categoriesList, start=1))   

logger = logging.getLogger(__name__)

class MultiFacetedSearchForm(FacetedSearchForm):
   
    start_price = forms.FloatField(required=False)
    end_price = forms.FloatField(required=False)
    categories = forms.MultipleChoiceField(required=False, widget=CheckboxSelectMultiple, choices=categoriesNames)


    def __init__(self, *args, **kwargs):
        self.selected_facets = kwargs.pop("selected_facets", [])
        super(MultiFacetedSearchForm, self).__init__(*args, **kwargs)

    def search(self):
        sqs = super(MultiFacetedSearchForm, self).search()


        if not self.is_valid():
            return self.no_query_found()

        # Check to see if a start_date was chosen.
        if self.cleaned_data['start_price']:
            sqs = sqs.filter(price__gte=self.cleaned_data['start_price'])
            logger.warning('tata')
        # Check to see if an end_date was chosen.
        if self.cleaned_data['end_price']:
            sqs = sqs.filter(price__lte=self.cleaned_data['end_price'])

        
        if self.cleaned_data['categories']:
            categories_utf8 = [category.encode("utf8") for category in self.cleaned_data['categories']]
            sqs = sqs.filter(category__slug__in=categories_utf8)
          
            # logger.warning('tata1')
            # logger.warning(categories_utf8)
            # logger.warning('tata2')

        # We need to process each facet to ensure that the field name and the
        # value are quoted correctly and separately:
        for facet in self.selected_facets:
            if ":" not in facet:
                continue

            field, value = facet.split(":", 1)

            if value:
                sqs = sqs.narrow(u'%s:"%s"' % (field, sqs.query.clean(value)))

        return sqs

