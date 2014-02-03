from django import forms
from haystack.forms import SearchForm
from drinks.models import *
from django.forms.widgets import *
from django.db.models import Q
from django.http import HttpResponse
from haystack.query import SearchQuerySet
import logging, operator

   
logger = logging.getLogger(__name__)


def get_categories():
    categoriesList = DrinkCategory.objects.all()
    return [(category.slug, category.name) for category in categoriesList] 

def get_themes():
    themesList = Theme.objects.all()
    return [(theme.slug, theme.name) for theme in themesList] 

DISTRICTS = [
    ('75001', '1er'),
    ('75002', '2eme'),
    ('75003', '3eme'),
    ('75004', '4eme'),
    ('75005', '5eme'),
    ('75006', '6eme'),
    ('75007', '7eme'),
    ('75008', '8eme'),
    ('75009', '9eme'),
    ('75010', '10eme'),
    ('75011', '11eme'),
    ('75012', '12eme'),
    ('75013', '13eme'),
    ('75014', '14eme'),
    ('75015', '15eme'),
    ('75016', '16eme'),
    ('75017', '17eme'),
    ('75018', '18eme'),
    ('75019', '19eme'),
    ('75020', '20eme'),
]


class CustomSearchForm(SearchForm):
   
    start_price = forms.FloatField(required=False)
    end_price = forms.FloatField(required=False)
    categories = forms.MultipleChoiceField(required=False, widget=CheckboxSelectMultiple, choices=get_categories())
    subcategories = forms.MultipleChoiceField(required=False, widget=CheckboxSelectMultiple, choices=get_categories())
    themes = forms.MultipleChoiceField(required=False, widget=CheckboxSelectMultiple, choices=get_themes())
    districts = forms.MultipleChoiceField(required=False, widget=SelectMultiple, choices=DISTRICTS)

    def __init__(self, *args, **kwargs):
        #self.selected_facets = kwargs.pop("selected_facets", [])
        super(CustomSearchForm, self).__init__(*args, **kwargs)

    def search(self):
        sqs = super(CustomSearchForm, self).search()


        no_filter_selected = True

        if not self.is_valid():
            #return self.no_query_found()
            sqs = SearchQuerySet().filter(price__gte=-1)
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
            themes_utf8 = [theme.encode("utf8") for theme in self.cleaned_data['themes']]
            sqs = sqs.filter(theme__slug__in=themes_utf8)
            no_filter_selected = False


        if self.cleaned_data['districts']:
            districts_utf8 = [district.encode("utf8") for district in self.cleaned_data['districts']]
            logger.warning(districts_utf8)
            sqs = sqs.filter(reduce(operator.or_, (Q(address__contains=district) for district in districts_utf8)))
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

        if no_filter_selected and self.cleaned_data['q']=="*":
            sqs = sqs.filter(price__gte=-1)


        
        if not self.cleaned_data['q']:
            sqs = sqs.filter(price__gte=-1)

        logger.warning(sqs)
        return sqs

