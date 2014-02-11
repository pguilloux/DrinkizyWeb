# -*- coding: utf-8 -*-

import autocomplete_light
from drinks.models import *
from bars.models import *


class AutocompleteTaggableItems(autocomplete_light.AutocompleteGenericBase):
    choices = (
        Drink.objects.all(),
        DrinkCategory.objects.all(),
        DrinkSubCategory.objects.all(),
        Bar.objects.all(),
        Theme.objects.all(),
    )

    search_fields = (
        ('name',),
        ('name',),
        ('name',),
        ('name',),
        ('name',),
    )


autocomplete_light.register(AutocompleteTaggableItems,
    autocomplete_js_attributes={
        'minimum_characters': 0,
        'placeholder': 'Quoi ? Boisson, Bar, Thème...',
    }
)
