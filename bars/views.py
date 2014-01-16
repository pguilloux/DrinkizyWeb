from django.shortcuts import render

from bars.models import *

import datetime
from django.shortcuts import render_to_response


def home(request):
	foo = "Hello spece di batard !"
	return render_to_response('bars/home.html', {'foo': foo})

