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


def search_form_date(request):
	return render_to_response('search_form_date.html', context_instance=RequestContext(request))

def search_by_date(request):
    errors = []
    if 'q' in request.GET:
        q = request.GET['q']
        if not q:
            errors.append('Enter date in year-month-date format.')
        elif len(q) > 10:
            errors.append('Please enter at most 10 characters.')
        else:
            events = Event.objects.filter(start__icontains=q)
            return render_to_response('search_results_date.html',{'events': events, 'query': q}, context_instance=RequestContext(request))
    return render_to_response('search_form_date.html',{'errors': errors}, context_instance=RequestContext(request))
		
def search_form_room(request):
    return render_to_response('search_form_room.html', context_instance=RequestContext(request))

def search_by_room(request):
	errors = []
	if 'q' in request.GET:
		q = request.GET['q']
		if not q:
			errors.append('Enter a room name.')
		elif len(q) > 20:
			errors.append('Please enter at most 20 characters.')
		else:
			rooms = Event.objects.filter(calendar__name__icontains=q).filter(start__gte=datetime.datetime.now)
			return render_to_response('search_results_room.html',
				{'rooms': rooms, 'query': q}, context_instance=RequestContext(request))
	return render_to_response('search_form_room.html',{'errors': errors}, context_instance=RequestContext(request))
		
def my_reservations(request):
	reservations = Event.objects.filter(creator=request.user).filter(start__gte=datetime.datetime.now)
	return render_to_response('my_reservations.html',{'reservations': reservations}, context_instance=RequestContext(request))
		
def all_reservations(request):
	reservations = Event.objects.filter(start__gte=datetime.datetime.now).order_by('calendar__name')
	return render_to_response('all_reservations.html',{'reservations': reservations}, context_instance=RequestContext(request))