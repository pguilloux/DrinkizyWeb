from django import forms
from haystack.forms import FacetedSearchForm
from drinks.models import *
from django.forms.widgets import *
from django.http import HttpResponse
from haystack.query import SearchQuerySet
import logging

   
logger = logging.getLogger(__name__)


def get_categories():
    categoriesList = DrinkCategory.objects.all()
    return [(category.slug, category.name) for category in categoriesList] 

def get_themes():
    themesList = Theme.objects.all()
    return [(theme.slug, theme.name) for theme in themesList] 


class MultiFacetedSearchForm(FacetedSearchForm):
   
    start_price = forms.FloatField(required=False)
    end_price = forms.FloatField(required=False)
    categories = forms.MultipleChoiceField(required=False, widget=CheckboxSelectMultiple, choices=get_categories())
    subcategories = forms.MultipleChoiceField(required=False, widget=CheckboxSelectMultiple, choices=get_categories())
    themes = forms.MultipleChoiceField(required=False, widget=CheckboxSelectMultiple, choices=get_themes())

    def __init__(self, *args, **kwargs):
        self.selected_facets = kwargs.pop("selected_facets", [])
        super(MultiFacetedSearchForm, self).__init__(*args, **kwargs)

    def search(self):
        sqs = super(MultiFacetedSearchForm, self).search()
        
        no_filter_selected = True

        if not self.is_valid():
            #return self.no_query_found()
            sqs = SearchQuerySet()
            return sqs

        # Check to see if a start_date was chosen.
        if self.cleaned_data['start_price']:
            sqs = sqs.filter(price__gte=self.cleaned_data['start_price'])
            no_filter_selected = False


        # Check to see if an end_date was chosen.
        if self.cleaned_data['end_price']:
            sqs = sqs.filter(price__lte=self.cleaned_data['end_price'])
            no_filter_selected = False

        
        if self.cleaned_data['categories']:
            categories_utf8 = [category.encode("utf8") for category in self.cleaned_data['categories']]
            sqs = sqs.filter(category__slug__in=categories_utf8)
            no_filter_selected = False


        if self.cleaned_data['themes']:
            logger.warning(self.cleaned_data)
            themes_utf8 = [theme.encode("utf8") for theme in self.cleaned_data['themes']]
            sqs = sqs.filter(theme__slug__in=themes_utf8)
            no_filter_selected = False
        

            # logger.warning('tata1')
            # logger.warning(categories_utf8)
            # logger.warning('tata2')


        # We need to process each facet to ensure that the field name and the
        # value are quoted correctly and separately:

        # for facet in self.selected_facets:
        #     if ":" not in facet:
        #         continue

        #     field, value = facet.split(":", 1)

        #     if value:
        #         sqs = sqs.narrow(u'%s:"%s"' % (field, sqs.query.clean(value)))

        if no_filter_selected:
            sqs = SearchQuerySet()

        return sqs

