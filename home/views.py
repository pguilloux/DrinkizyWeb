from django.shortcuts import render
from django.shortcuts import render_to_response

def home(request):
	foo = "Resultat de la methode home de home.views"
	return render_to_response('home/home.html', {'foo': foo})

def faq(request):
	return render_to_response('home/faq.html')