from django.conf import settings
from django.conf.urls.defaults import *
from django.views.generic.simple import direct_to_template
from django.contrib.auth.decorators import login_required
from decorator_include import decorator_include

from project_sample import views
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    url(r'^$', direct_to_template,{"template":"homepage.html"}, name='home'),
    (r'^schedule/', decorator_include(login_required, 'schedule.urls')),
	(r'^accounts/', include('registration.urls')),
	(r'^search_form_room/$', views.search_form_room),
	(r'^search_by_room/$', views.search_by_room),
	(r'^search_form_date/$', views.search_form_date),
	(r'^search_by_date/$', views.search_by_date),
	(r'^my_reservations/$', views.my_reservations),
	(r'^all_reservations/$', views.all_reservations),
	(r'^reserve_rooms/$', views.reserve_rooms),
	(r'^password_change/$', 'django.contrib.auth.views.password_change'),
    (r'^password_change/done/$', 'django.contrib.auth.views.password_change_done'),

	url(r'^event/create/(?P<calendar_slug>[-\w]+)/$',
		'views.create_or_edit_event',
		name='calendar_create_event'),
	url(r'^event/delete/(?P<event_id>\d+)/$',
		'views.delete_event',
		name="delete_event"),
	url(r'^event/edit/(?P<calendar_slug>[-\w]+)/(?P<event_id>\d+)/$','views.create_or_edit_event',name='edit_event'),
    url(r'^admin/doc/', include('django.contrib.admindocs.urls')),
    url(r'^admin/', include(admin.site.urls)),
)

if settings.DEBUG:
    urlpatterns += patterns('',
        (r'^site_media/(?P<path>.*)$',
         'django.views.static.serve',
         {'document_root': settings.MEDIA_ROOT, 'show_indexes': True}),
    )

