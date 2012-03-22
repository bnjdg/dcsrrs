from urllib import quote
from django.shortcuts import render_to_response, get_object_or_404
from django.views.generic.create_update import delete_object
from django.http import HttpResponseRedirect, Http404, HttpResponse
from django.template import RequestContext
from django.core.urlresolvers import reverse
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from django.views.generic.create_update import delete_object
import datetime

from schedule.conf.settings import GET_EVENTS_FUNC, OCCURRENCE_CANCEL_REDIRECT
from schedule.forms import EventForm, OccurrenceForm
from schedule.models import *
from schedule.periods import weekday_names
from schedule.utils import check_event_permissions, coerce_date_dict


def search_form(request):
    return render_to_response('search_form.html', context_instance=RequestContext(request))
	
def search_by_room(request):
    errors = []
    if 'q' in request.GET:
        q = request.GET['q']
        if not q:
            errors.append('Enter a search term.')
        elif len(q) > 20:
            errors.append('Please enter at most 20 characters.')
        else:
            rooms = Calendar.objects.filter(name__icontains=q)
            return render_to_response('search_results.html',
                {'rooms': rooms, 'query': q},context_instance=RequestContext(request))
    return render_to_response('search_form.html',
        {'errors': errors}, context_instance=RequestContext(request))
