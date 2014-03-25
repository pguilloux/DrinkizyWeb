from django.shortcuts import render_to_response
from django.template import RequestContext
from users.models import CustomUser
from portal.forms import ModifyProfileForm
from django.contrib.auth.decorators import login_required

@login_required
def portal_main_page(request):

	user = request.user
	if request.method == 'POST': # If the form has been submitted...
		profile_form = ModifyProfileForm(request.POST, request.FILES) # A form bound to the POST data

		if profile_form.is_valid(): # All validation rules pass
			avatar=profile_form.cleaned_data['avatar'], 
			CustomUser.objects.filter(pk=user.pk).update(avatar=avatar)

	else:
		profile_form = ModifyProfileForm() # An unbound form

	initialData = {'profile_form': profile_form}
	csrfContext = RequestContext(request, initialData)

	return render_to_response('portal/index.html', csrfContext)   

