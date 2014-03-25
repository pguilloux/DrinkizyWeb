# -*- coding: utf-8 -*-
from django import forms
from django.forms.widgets import *
from django.db.models import Q
from django.http import HttpResponse
from django.core.files.images import get_image_dimensions


DIFFICULTY_CHOICES=(
    ('facile', 'facile'),
    ('moyen', 'moyen'),
    ('difficile', 'difficile'),
)

PRICE_CHOICES=(
    (1, 'eco'),
    (2, 'abordable'),
    (3, 'cher'),
    (4, 'cresus'),
)

class ModifyProfileForm(forms.Form):

    avatar = forms.ImageField(required=False)

    def clean_avatar(self):
        avatar = self.cleaned_data['avatar']

        try:
            w, h = get_image_dimensions(avatar)

            #validate dimensions
            max_width = max_height = 300
            # if w != max_width or h != max_height:
            #     raise forms.ValidationError(
            #         u'Please use an image that is '
            #          '%s x %s pixels.' % (max_width, max_height))

            #validate content type
            main, sub = avatar.content_type.split('/')
            if not (main == 'image' and sub in ['jpeg', 'pjpeg', 'gif', 'png']):
                raise forms.ValidationError(u'Please use a JPEG, '
                    'GIF or PNG image.')

            #validate file size
            if len(avatar) > (20 * 1024):
                raise forms.ValidationError(
                    u'Avatar file size may not exceed 20k.')

        except AttributeError:
            """
            Handles case when we are updating the user profile
            and do not supply a new avatar
            """
            pass

        return avatar



