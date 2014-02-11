# -*- coding: utf-8 -*-
import autocomplete_light
from models import Station

class StationAutocomplete(autocomplete_light.AutocompleteModelBase):
    search_fields = ['name']

autocomplete_light.register(Station, StationAutocomplete, 
	autocomplete_js_attributes={
	        'minimum_characters': 0,
	        'placeholder': 'Station de Métro, RER, Tram',
    }

)