from urllib import quote
from django.shortcuts import render_to_response, get_object_or_404
from django.views.generic.create_update import delete_object
from django.http import HttpResponseRedirect, Http404, HttpResponse
from django.template import RequestContext
from django.core.urlresolvers import reverse
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from django.views.generic.create_update import delete_object
from datetime import datetime

from schedule.conf.settings import GET_EVENTS_FUNC, OCCURRENCE_CANCEL_REDIRECT
from schedule.forms import EventForm, OccurrenceForm
from schedule.models import *
from schedule.periods import weekday_names
from schedule.utils import check_event_permissions, coerce_date_dict
import datetime
import time

from project_sample.forms import SearchDateForm, SearchRoomForm

def create_or_edit_event(request, calendar_slug, event_id=None, next=None,
    template_name='schedule/create_event.html', form_class = EventForm, extra_context=None):
    extra_context = extra_context or {}
    date = coerce_date_dict(request.GET)
    initial_data = None
    if date:
        try:
            start = datetime.datetime(**date)
            initial_data = {
                "start": start,
                "end": start + datetime.timedelta(minutes=30)
            }
        except TypeError:
            raise Http404
        except ValueError:
            raise Http404

    instance = None
    conflict = False

    if event_id is not None:
        instance = get_object_or_404(Event, id=event_id)

    calendar = get_object_or_404(Calendar, slug=calendar_slug)

    form = form_class(data=request.POST or None, instance=instance,
        hour24=True, initial=initial_data)

    if form.is_valid():
        d = form.cleaned_data
        start_time = d['start']
        end_time = d['end']

        start_conflict = calendar.event_set.filter(start__gt=start_time, start__lt=end_time).exclude(id=event_id)
        end_conflict = calendar.event_set.filter(end__gt=start_time, end__lt=end_time).exclude(id=event_id)
        during_conflict = calendar.event_set.filter(start__lt=start_time, end__gt=end_time).exclude(id=event_id)
        start_end_conflict = calendar.event_set.filter(start=start_time, end=end_time)

        if(start_conflict or end_conflict or during_conflict or start_end_conflict):
            conflict = True

        now = datetime.datetime.now()
        if(start_time < now):
            return render_to_response('restrict_reserve.html', context_instance=RequestContext(request))

        if(conflict):
            return render_to_response('schedule_conflict.html', context_instance=RequestContext(request))
        else:
            event = form.save(commit=False)
            if instance is None:
                event.creator = request.user
                event.calendar = calendar
            event.save()
            next = next or reverse('event', args=[event.id])
            next = get_next_url(request, next)
            return HttpResponseRedirect(next)

    next = get_next_url(request, next)
    context = {
        "form": form,
        "calendar": calendar,
        "next":next
    }
    context.update(extra_context)
    return render_to_response(template_name, context, context_instance=RequestContext(request))


@check_event_permissions
def delete_event(request, event_id, next=None, login_required=True, extra_context=None):
    """
    After the event is deleted there are three options for redirect, tried in
    this order:

    # Try to find a 'next' GET variable
    # If the key word argument redirect is set
    # Lastly redirect to the event detail of the recently create event
    """
    extra_context = extra_context or {}
    event = get_object_or_404(Event, id=event_id)
    next = next or reverse('day_calendar', args=[event.calendar.slug])
    next = get_next_url(request, next)
    extra_context['next'] = next
    if event.creator == request.user:
        return delete_object(request, model = Event, object_id = event_id, post_delete_redirect = next, template_name = "schedule/delete_event.html", extra_context = extra_context, login_required = login_required)
    else:
        return render_to_response('cannot_delete.html')

	
def check_next_url(next):
    """
    Checks to make sure the next url is not redirecting to another page.
    Basically it is a minimal security check.
    """
    if not next or '://' in next:
        return None
    return next

def get_next_url(request, default):
    next = default
    if OCCURRENCE_CANCEL_REDIRECT:
        next = OCCURRENCE_CANCEL_REDIRECT
    if 'next' in request.REQUEST and check_next_url(request.REQUEST['next']) is not None:
        next = request.REQUEST['next']
    return next

@login_required
def search_form_date(request):
	form = SearchDateForm()
	return render_to_response('search_form_date.html', {'form': form},context_instance=RequestContext(request))

@login_required
def search_by_date(request):
    if request.method == 'POST':
        form = SearchDateForm(request.POST)
        if form.is_valid(): 
			date = form.cleaned_data['date']
			query = date.strftime("%B %d,%Y - %A")
			events = Event.objects.filter(start__gte=date)
			return render_to_response('search_results_date.html',{'events': events, 'query': query}, context_instance=RequestContext(request))
    else:
        form = SearchDateForm()
	return render_to_response('search_form_date.html', {'form': form},context_instance=RequestContext(request))
		
@login_required
def search_form_room(request):
	form = SearchRoomForm()
	return render_to_response('search_form_room.html',
		{'form': form},
		context_instance=RequestContext(request))

@login_required
def search_by_room(request):
	if request.method == 'POST':
		form = SearchRoomForm(request.POST)
		if form.is_valid():
			room = form.cleaned_data['room']
			events = Event.objects.filter(calendar__name__icontains=room).filter(start__gte=datetime.datetime.now)
			return render_to_response('search_results_room.html',
				{'events': events, 'query': room},
				context_instance=RequestContext(request))
	else:
		form = SearchRoomForm()
	return render_to_response('search_form_room.html', {'form': form}, context_instance=RequestContext(request))

@login_required
def my_reservations(request):
	reservations = Event.objects.filter(creator=request.user).filter(start__gte=datetime.datetime.now)
	return render_to_response('my_reservations.html',
		{'reservations': reservations},
		context_instance=RequestContext(request))
		
@login_required
def all_reservations(request):
	reservations = Event.objects.filter(start__gte=datetime.datetime.now).order_by('calendar__name')
	return render_to_response('all_reservations.html',
		{'reservations': reservations},
		context_instance=RequestContext(request))
		
@login_required
def reserve_rooms(request):
	rooms = Calendar.objects.all()
	return render_to_response('reserve_rooms.html',
		{'rooms': rooms},
		context_instance=RequestContext(request))