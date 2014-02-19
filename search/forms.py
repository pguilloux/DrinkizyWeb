# -*- coding: utf-8 -*-
from django import forms
from haystack.forms import SearchForm
from drinks.models import *
from django.forms.widgets import *
from django.db.models import Q
from django.http import HttpResponse
from haystack.query import SearchQuerySet
import logging, operator

import floppyforms as forms
import simplejson, urllib

import autocomplete_light
autocomplete_light.autodiscover()


   
logger = logging.getLogger(__name__)

TRANSPORT_LINES = ['1', '2', '3', '3B', '4', '5', '6', '7', '7B', '8', '9', '10',
 '11', '12', '13', '14', 'A', 'B', 'C', 'D', 'E', 'T1', 'T2', 'T3A', 'T3B']


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
    stations_by_lines.append(('', '---Station de Metro---'))
    for line in TRANSPORT_LINES:
        for station in stationsList:
            if line in station.get_lines():
                stations_by_lines.append((station.name, line+"-"+station.name))

    return stations_by_lines


DISTRICTS = [
    ('75001', '1er'),
    ('75002', '2e'),
    ('75003', '3e'),
    ('75004', '4e'),
    ('75005', '5e'),
    ('75006', '6e'),
    ('75007', '7e'),
    ('75008', '8e'),
    ('75009', '9e'),
    ('75010', '10e'),
    ('75011', '11e'),
    ('75012', '12e'),
    ('75013', '13e'),
    ('75014', '14e'),
    ('75015', '15e'),
    ('75016', '16e'),
    ('75017', '17e'),
    ('75018', '18e'),
    ('75019', '19e'),
    ('75020', '20e'),
]




class Slider(forms.RangeInput):
    min = 0
    max = 2000
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

   
    
    q = forms.CharField(required=False, label='search', widget=autocomplete_light.TextWidget('AutocompleteTaggableItems', attrs={'class':'inputSearch-result form-control'}))

    categories = forms.ModelMultipleChoiceField(required=False, queryset=DrinkCategory.objects.all(), widget=CheckboxSelectMultiple, to_field_name='name')
    subcategories = forms.ModelMultipleChoiceField(required=False, queryset=DrinkSubCategory.objects.all(), widget=CheckboxSelectMultiple, to_field_name='name')
    
    address = forms.CharField(required=False, label='search', widget=forms.TextInput(attrs={'placeholder':'Où ? Adresse, Rue...', 'class':'inputLocalisation inputSearch-result form-control'}))
    station = forms.CharField(required=False, label='search', widget=autocomplete_light.TextWidget('StationAutocomplete', attrs={'class':'inputLocalisation inputSearch-result form-control'}))
    districts = forms.MultipleChoiceField(required=False, widget=CheckboxSelectMultiple, choices=DISTRICTS)
    distance = forms.IntegerField(required=False, widget=Slider(attrs={'id': 'slider-range-min'}))

    themes = forms.MultipleChoiceField(required=False, widget=CheckboxSelectMultiple, choices=get_themes())

    # start_price = forms.FloatField(required=False)
    # end_price = forms.FloatField(required=False)
    

    bar_distances = {}




    def __init__(self, *args, **kwargs):
        #self.selected_facets = kwargs.pop("selected_facets", [])
        super(CustomSearchForm, self).__init__(*args, **kwargs)


    def get_bar_distances(self):
        return self.bar_distances

    def search(self):
        sqs = super(CustomSearchForm, self).search()


        no_filter_selected = True

        if not self.is_valid():
            #return self.no_query_found()
            sqs = SearchQuerySet().filter(price__gte=-1)
            return sqs

        # # Check to see if a start_date was chosen.
        # if self.cleaned_data['start_price']:
        #     sqs = sqs.filter(price__gte=self.cleaned_data['start_price'])
        #     no_filter_selected = False


        # # Check to see if an end_date was chosen.
        # if self.cleaned_data['end_price']:
        #     sqs = sqs.filter(price__lte=self.cleaned_data['end_price'])
        #     no_filter_selected = False

        
        if self.cleaned_data['categories']:
            categories_list = [category.slug for category in self.cleaned_data['categories']]
            sqs = sqs.filter(category__slug__in=categories_list)
            no_filter_selected = False

        if self.cleaned_data['subcategories']:
            subcategories_list = [subcategory.slug for subcategory in self.cleaned_data['subcategories']]
            sqs = sqs.filter(subcategory__slug__in=subcategories_list)
            no_filter_selected = False


        if self.cleaned_data['themes']:
            themes_utf8 = [theme.encode("utf8") for theme in self.cleaned_data['themes']]
            sqs = sqs.filter(theme__slug__in=themes_utf8)
            no_filter_selected = False


        if self.cleaned_data['districts']:
            districts_utf8 = [district.encode("utf8") for district in self.cleaned_data['districts']]
            sqs = sqs.filter(reduce(operator.or_, (Q(address__contains=district) for district in districts_utf8)))
            no_filter_selected = False

        if no_filter_selected and self.cleaned_data['q']=="*":
            sqs = sqs.filter(price__gte=-1)
            
        if self.cleaned_data['station'] or self.cleaned_data['address']:
            
                orig_coord=""
                distance_setted=0

                bars_query_results = [result.object.bar.name for result in sqs]
                bars = Bar.objects.filter(name__in=bars_query_results)

                chosen_station = Station.objects.filter(name__exact=self.cleaned_data['station'])
                if self.cleaned_data['station']:
                    orig_coord = chosen_station[0].latitude, chosen_station[0].longitude
                elif self.cleaned_data['address']:
                    orig_coord = self.cleaned_data['address']

                if self.cleaned_data['distance']:
                    if self.cleaned_data['distance'] == 0:
                        distance_setted = 1000
                    else:
                        distance_setted = self.cleaned_data['distance']
                else:
                    distance_setted = 1000


                for bar in bars:

                    dest_coord = bar.latitude, bar.longitude
                    url = "http://maps.googleapis.com/maps/api/distancematrix/json?origins={0}&destinations={1}&mode=walking&language=en-EN&sensor=false".format(str(orig_coord),str(dest_coord))
                    result= simplejson.load(urllib.urlopen(url))
                    
                    distance = result['rows'][0]['elements'][0]['distance']['value']

                    if distance > distance_setted:
                        sqs = sqs.exclude(bar__name__exact=bar.name)
                    else:
                        self.bar_distances[bar.name] = distance
                no_filter_selected = False

                # foursquareUrl = "https://api.foursquare.com/v2/venues/search?near=Paris&categoryId=4d4b7105d754a06376d81259&oauth_token=GRXPRZGMJCONKHAQKDSQUAPTPKAIFP4OGQXE12RPWGWSALNT&v=20140209"
                # foursquareResult= simplejson.load(urllib.urlopen(foursquareUrl))
                # import json
                # with open('foursquareResult.txt', 'w') as outfile:
                #     json.dump(foursquareResult, outfile)
                # logger.warning(foursquareResult)


            # logger.warning('tata1')
            # logger.warning(categories_utf8)
            # logger.warning('tata2')
        
        
        if not self.cleaned_data['q']:
            sqs = sqs.filter(price__gte=-1)

       
        return sqs

