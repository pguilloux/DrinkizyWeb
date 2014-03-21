# -*- coding: utf-8 -*-
from django import forms
from drinks.models import *
from django.forms.widgets import *

from bars.models import *
import logging, operator

 
logger = logging.getLogger(__name__)

class RankBarForm(forms.Form):
    rank = forms.FloatField()
