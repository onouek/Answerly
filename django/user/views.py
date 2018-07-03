from django.shortcuts import render

# Create your views here.
from django.contrib.auth.forms import UserCreationForm
from django.views.generic.edit import CreateView


class RegisterView(CreateView):
    template_name = 'user/register.html'
    form_class = UserCreationForm