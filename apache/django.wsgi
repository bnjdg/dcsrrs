import os, sys

mysite = 'C:\\dcsrrs'
if mysite not in sys.path:
	sys.path.insert(0,'C:\\dcsrrs')

mysite = '/dcsrrs'
if mysite not in sys.path:
	sys.path.insert(0,'/dcsrrs')
mysite = 'C:\\'
if mysite not in sys.path:
	sys.path.insert(0,'C:\\')

mysite = '/'
if mysite not in sys.path:
	sys.path.insert(0,'/')

os.environ['DJANGO_SETTINGS_MODULE'] = 'dcsrrs.settings_prod'
import django.core.handlers.wsgi
application = django.core.handlers.wsgi.WSGIHandler()