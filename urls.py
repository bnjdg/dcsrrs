from django.conf import settings
from django.conf.urls.defaults import *
from django.views.generic.simple import direct_to_template
from django.contrib.auth.decorators import login_required
from decorator_include import decorator_include

from django.contrib import admin
admin.autodiscover()

from schedule import views

urlpatterns = patterns('',
    url(r'^$', direct_to_template,{"template":"homepage.html"}),
    (r'^schedule/', decorator_include(login_required, 'schedule.urls')),
	(r'^accounts/', include('registration.urls')),
	(r'^search_form_room/$', views.search_form_room),
	(r'^search_by_room/$', views.search_by_room),
	(r'^search_form_date/$', views.search_form_date),
	(r'^search_by_date/$', views.search_by_date),
	(r'^my_reservations/$', views.my_reservations),
	(r'^all_reservations/$', views.all_reservations),
	(r'^reserve_rooms/$', views.reserve_rooms),
	
	url(r'^event/create/(?P<calendar_slug>[-\w]+)/$',
		'schedule.views.create_or_edit_event',
		name='calendar_create_event'),
	url(r'^event/delete/(?P<event_id>\d+)/$',
		'schedule.views.delete_event',
		name="delete_event"),
    url(r'^admin/doc/', include('django.contrib.admindocs.urls')),
    url(r'^admin/', include(admin.site.urls)),
)

if settings.DEBUG:
    urlpatterns += patterns('',
        (r'^site_media/(?P<path>.*)$',
         'django.views.static.serve',
         {'document_root': settings.MEDIA_ROOT, 'show_indexes': True}),
    )

