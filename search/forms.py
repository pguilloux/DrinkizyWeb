from django import forms
from haystack.forms import SearchForm
from drinks.models import *
from django.forms.widgets import *
from django.db.models import Q
from django.http import HttpResponse
from haystack.query import SearchQuerySet
import logging, operator

import floppyforms as forms

   
logger = logging.getLogger(__name__)

TRANSPORT_LINES = ['1', '2', '3', '3B', '4', '5', '6', '7', '7B', '8', '9', '10',
 '11', '12', '13', '14', 'A', 'B', 'C', 'D', 'E', 'T1', 'T2', 'T3A', 'T3B']


def get_categories():
    categoriesList = DrinkCategory.objects.all()
    return [(category.slug, category.name) for category in categoriesList] 

def get_themes():
    themesList = Theme.objects.all()
    return [(theme.slug, theme.name) for theme in themesList] 

def get_stations():
    stationsList = Station.objects.all()
    return [(station.name, station.name) for station in stationsList] 

def get_stations_by_lines():
    stationsList = Station.objects.all()
    #return [(station.name, line+"-"+station.name) for line in TRANSPORT_LINES for station in stationsList if line in station.get_lines()]
    stations_by_lines = []

    for line in TRANSPORT_LINES:
        for station in stationsList:
            if line in station.get_lines():
                stations_by_lines.append((station.name, line+"-"+station.name))

    return stations_by_lines


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




class Slider(forms.RangeInput):
    min = 0
    max = 1500
    step = 50
    template_name = '../templates/search/slider_distance.html'

    class Media:
        js = (
            '..'+settings.STATIC_URL+'js/jquery.min.js',
            '..'+settings.STATIC_URL+'js/jquery-ui-1.10.4.custom.min.js',
        )
        css = {
            'all': (
                '..'+settings.STATIC_URL+'css/ui-lightness/jquery-ui-1.10.4.custom.css',
            )
        }
 

class CustomSearchForm(SearchForm):

   
    distance = forms.IntegerField(required=False, widget=Slider(attrs={'id': 'slider-range-min'}))
    q = forms.CharField(label='search', widget=forms.TextInput(attrs={'placeholder': 'Search', 'class':'inputSearch-result'}))
    start_price = forms.FloatField(required=False)
    end_price = forms.FloatField(required=False)
    categories = forms.MultipleChoiceField(required=False, widget=CheckboxSelectMultiple, choices=get_categories(), )
    subcategories = forms.MultipleChoiceField(required=False, widget=CheckboxSelectMultiple, choices=get_categories())
    themes = forms.MultipleChoiceField(required=False, widget=CheckboxSelectMultiple, choices=get_themes())
    stations = forms.ChoiceField(required=False, widget=Select, choices=get_stations_by_lines())
    districts = forms.MultipleChoiceField(required=False, widget=SelectMultiple(attrs={'class':'inputSearch-result'}), choices=DISTRICTS)


    def __init__(self, *args, **kwargs):
        #self.selected_facets = kwargs.pop("selected_facets", [])
        super(CustomSearchForm, self).__init__(*args, **kwargs)


    def clean_num(self):
        num = self.cleaned_data['distance']
        if not 5 <= num <= 20:
            raise forms.ValidationError("Enter a value between 5 and 20")

        if not num % 5 == 0:
            raise forms.ValidationError("Enter a multiple of 5")
        return num


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
            logger.warning('tata1')


        if self.cleaned_data['themes']:
            themes_utf8 = [theme.encode("utf8") for theme in self.cleaned_data['themes']]
            sqs = sqs.filter(theme__slug__in=themes_utf8)
            no_filter_selected = False


        if self.cleaned_data['districts']:
            districts_utf8 = [district.encode("utf8") for district in self.cleaned_data['districts']]
            sqs = sqs.filter(reduce(operator.or_, (Q(address__contains=district) for district in districts_utf8)))
            no_filter_selected = False

        if self.cleaned_data['distance']:
            logger.warning(self.cleaned_data['distance'])
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

