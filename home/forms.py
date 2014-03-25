# -*- coding: utf-8 -*-
from django import forms
from drinks.models import *
from django.forms.widgets import *

from bars.models import *
import logging, operator

 
logger = logging.getLogger(__name__)

class RegistrationForm(forms.Form):
    
    pseudo = forms.CharField(max_length=255)

    email = forms.EmailField(max_length=255)
    emailConfirmation = forms.EmailField(max_length=255)

    password = forms.CharField(widget=forms.PasswordInput)
    passwordConfirmation = forms.CharField(widget=forms.PasswordInput)
