from django import forms
from django.utils.translation import ugettext_lazy as _
import datetime
import time

class SearchDateForm(forms.Form):
	date = forms.DateTimeField()

class SearchRoomForm(forms.Form):
    room = forms.CharField();