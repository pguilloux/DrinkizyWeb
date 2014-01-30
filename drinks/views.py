from django.shortcuts import render

from drinks.models import *
from search.forms import MultiFacetedSearchForm

import datetime
from django.shortcuts import render_to_response


def categories(request):
	categories = DrinkCategory.objects.all()
	return render_to_response('drinks/categories.html', {'categories': categories})


def category(request, slug):
	category = DrinkCategory.objects.get(slug=slug)
	subcategories = category.drinksubcategory_set.all()
	return render_to_response('drinks/drink_category.html', {'category': category, 'subcategories': subcategories})


def subcategory(request, slug): 
	subcategory = DrinkSubCategory.objects.get(slug=slug)
	drinks = subcategory.drink_set.all()
	return render_to_response('drinks/drink_subcategory.html', {'subcategory' : subcategory, 'drinks' : drinks})


def drink(request, slug): 
	drink = Drink.objects.get(slug=slug)
	return render_to_response('drinks/drink.html', {'drink' : drink})




