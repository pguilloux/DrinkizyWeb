from django.shortcuts import render

from drinks.models import *

import datetime
from django.shortcuts import render_to_response


def drinks(request):
	drinks = Drink.objects.all()
	return render_to_response('drinks/drinks.html', {'drinks': drinks})