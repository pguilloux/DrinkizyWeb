from django.shortcuts import render

from bars.models import *

import datetime
from django.shortcuts import render_to_response


def home(request):
	foo = "Hello spece di batard !"
	return render_to_response('bars/home.html', {'foo': foo})

def fiche_bar(request, slug): 
	bar = Bar.objects.get(slug=slug)
	return render_to_response('bars/fiche_bar.html', {'bar': bar})

