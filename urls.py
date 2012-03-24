from django.conf import settings
from django.conf.urls.defaults import *
from django.views.generic.simple import direct_to_template
from django.contrib.auth.decorators import login_required
from decorator_include import decorator_include

from dcsrrs import views
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
	url(r'^$', 'django.contrib.auth.views.login', name='home'),
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
    (r'^site_media/(?P<path>.*)$', 'django.views.static.serve',
        {'document_root': '/home/bjdag/dcsrrs/site_media'}),
    (r'^site_media/img/(?P<path>.*)$', 'django.views.static.serve',
        {'document_root': '/home/bjdag/dcsrrs/site_media/img'}),


	url(r'^reservation/create/(?P<room_slug>[-\w]+)/$',
		'views.create_or_edit_reservation',
		name='room_create_reservation'),
	url(r'^reservation/delete/(?P<reservation_id>\d+)/$',
		'views.delete_reservation',
		name="delete_reservation"),
	url(r'^reservation/edit/(?P<room_slug>[-\w]+)/(?P<reservation_id>\d+)/$','views.create_or_edit_reservation',name='edit_reservation'),
	url(r'^admin/doc/', include('django.contrib.admindocs.urls')),
	url(r'^admin/', include(admin.site.urls)),
)

if settings.DEBUG:
	urlpatterns += patterns('',
		(r'^site_media/(?P<path>.*)$',
		 'django.views.static.serve',
		 {'document_root': settings.MEDIA_ROOT, 'show_indexes': True}),
	)

from django.contrib.staticfiles.urls import staticfiles_urlpatterns
urlpatterns += staticfiles_urlpatterns()