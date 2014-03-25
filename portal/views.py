from django.shortcuts import render_to_response
from django.template import RequestContext
from users.models import CustomUser
from portal.forms import ModifyProfileForm
from django.contrib.auth.decorators import login_required

import os
from django.core.files.storage import default_storage
from django.core.files.base import ContentFile
from django.conf import settings
from sorl.thumbnail import delete

@login_required
def portal_main_page(request):

	user = request.user
	if request.method == 'POST': # If the form has been submitted...
		profile_form = ModifyProfileForm(request.POST, request.FILES) # A form bound to the POST data

		if profile_form.is_valid(): # All validation rules pass
			avatar=profile_form.cleaned_data['avatar']

			main, sub = avatar.content_type.split('/')

			tmp_file = os.path.join('avatars/', user.username+'.'+sub)

			if(os.path.isfile(os.path.join(settings.MEDIA_ROOT, tmp_file))):
				os.remove(os.path.join(settings.MEDIA_ROOT, tmp_file))
				delete(tmp_file)

			path = default_storage.save(tmp_file, ContentFile(avatar.read()))


			CustomUser.objects.filter(pk=user.pk).update(avatar=path)

			

	else:
		profile_form = ModifyProfileForm() # An unbound form

	initialData = {'profile_form': profile_form}
	csrfContext = RequestContext(request, initialData)

	return render_to_response('portal/index.html', csrfContext)   

