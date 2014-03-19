# -*- coding: utf-8 -*-
from django.shortcuts import render
from django.shortcuts import render_to_response
from django.template import RequestContext

from django.http import HttpResponse
from django.http import HttpResponseRedirect

from users.models import CustomUser
from bars.models import *
from home.forms import *
from django.contrib.auth import logout

import logging, operator
logger = logging.getLogger(__name__)

from operator import itemgetter, attrgetter

def home(request):
	bars = Bar.objects.all()

	bars_ranks = []
	for bar in bars:
		bars_ranks.append((bar, bar.getAverageRank()))

	ordered_bars_ranks = sorted(bars_ranks, key=itemgetter(1), reverse=True)[:4]


	return render_to_response('home/home.html', {'famous_bars': ordered_bars_ranks}, context_instance=RequestContext(request))

def faq(request):
	return render_to_response('home/faq.html', context_instance=RequestContext(request))

def mentions(request):
	return render_to_response('home/mentions.html', context_instance=RequestContext(request))

def apropos(request):
	return render_to_response('home/apropos.html', context_instance=RequestContext(request))

def pro(request):
	return render_to_response('home/pro.html', context_instance=RequestContext(request))

def contact(request):
	return render_to_response('home/contact.html', context_instance=RequestContext(request))

def logout_view(request):
    logout(request)
    return HttpResponseRedirect('/')

def registration(request):

	if request.method == 'POST': # If the form has been submitted...
		form = RegistrationForm(request.POST) # A form bound to the POST data
		message = "Tous les champs doivent être complétés"

		if form.is_valid(): # All validation rules pass
			# Process the data in form.cleaned_data
			# ...

			pseudo               = form.cleaned_data['pseudo']
			email                = form.cleaned_data['email']
			emailConfirmation    = form.cleaned_data['emailConfirmation']
			password             = form.cleaned_data['password']
			passwordConfirmation = form.cleaned_data['passwordConfirmation']

			if (password != passwordConfirmation):
				message = "Erreur : les mots de passes ne correspondent pas."
			
			else:
				if (email != emailConfirmation):
					message = "Erreur : les e-mails ne correspondent pas."

				else:
					user = CustomUser.objects.create_user(pseudo, email, password)
					user.save()
					#message = "Merci d'avoir créé votre compte"

				return HttpResponseRedirect('/login') # Redirect after POST
	else:
		message = ""
		form = RegistrationForm() # An unbound form
		

	return render_to_response("registration/registration.html", {"form": form, "message": message}, context_instance=RequestContext(request))

