from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from django.core.validators import RegexValidator

from animal.forms import load_state
from .models import Profile


class UserRegisterForm(UserCreationForm):
    phone_regex = RegexValidator(regex=r'^\+?1?\d{10,15}$',
                                 message="Phone number must be entered in the format: '999999999'. Up to 15 digits "
                                         "allowed.")
    password_valid = RegexValidator(regex=r'^\d{4}$',
                                    message="Password must be entered 4 digits: '9999' allowed.")
    username = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'}),
                               validators=[phone_regex], max_length=15, label='Enter Mobile No')
    password1 = forms.CharField(widget=forms.PasswordInput(attrs={'class': 'password'}),
                                validators=[password_valid], max_length=4, label='Enter password')
    password2 = forms.CharField(widget=forms.PasswordInput(),
                                validators=[password_valid], max_length=4, label='Re-enter password')

    class Meta:
        model = User
        fields = ['username', 'password1', 'password2']


class UserUpdateForm(forms.ModelForm):
    # email = forms.EmailField()
    first_name = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'})
                                 , max_length=15, label='First Name', required=False)
    last_name = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'})
                                , max_length=15, label='last Name', required=False)

    class Meta:
        model = User
        fields = ('first_name', 'last_name')


class ProfileUpdateForm(forms.ModelForm):
    phone_regex = RegexValidator(regex=r'^\+?1?\d{10,15}$',
                                 message="Phone number must be entered in the format: '999999999'. Up to 15 digits "
                                         "allowed.")
    user_contact = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'}),
                                   validators=[phone_regex], max_length=15, label='Enter Mobile No', required=False)
    user_village = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'})
                                   , max_length=15, label='Village', required=False)
    user_address = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'})
                                   , label='Address', required=False)
    user_teh = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'})
                               , label='Tehsil (Block)', required=False)
    user_dist = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'})
                                , label='District', required=False)
    user_late = forms.CharField(widget=forms.HiddenInput(attrs={'class': 'form-control'})
                                , label='user late', required=False)
    user_long = forms.CharField(widget=forms.HiddenInput(attrs={'class': 'form-control'})
                                , label='user long', required=False)
    CHOICES_COUNTRY = (
        ('', 'Select one'),
        ('1', 'India'),
    )
    user_state_id = forms.ChoiceField(widget=forms.Select(attrs={'class': 'form-control'}),
                                      choices=[(state.id, str(state.name)) for state in load_state()],
                                      required=False, initial='4')
    user_country_id = forms.ChoiceField(widget=forms.Select(attrs={'class': 'form-control'}),
                                        choices=CHOICES_COUNTRY, required=False)

    class Meta:
        model = Profile
        fields = ['user_contact', 'user_late', 'user_long',  'user_village', 'user_address', 'user_dist', 'user_teh',
                  'user_state_id', 'user_country_id']
