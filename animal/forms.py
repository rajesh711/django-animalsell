from django.forms.fields import ImageField
from django import forms
from .models import Post, Country, State, Group, Type, Comments
from django.core.validators import RegexValidator


def load_country():
    # country_id = self.GET.get('country')
    country = Country.objects.all()
    return country


def load_state():
    # country_id = self.GET.get('country')
    country_id = 1
    return State.objects.filter(country_id=country_id)


def load_type():
    group_id = 1
    return Type.objects.filter(group_id=group_id)


def load_all_type():
    # group_id = 1
    return Type.objects.all()


def load_group():
    return Group.objects.all()


class PostCreateView(forms.ModelForm):
    phone_regex = RegexValidator(regex=r'^\+?1?\d{10,15}$',
                                 message="Phone number must be entered in the format: '999999999'. Up to 15 digits "
                                         "allowed.")
    animal_child = forms.IntegerField(widget=forms.NumberInput(attrs={'class': 'form-control'})
                                      , label='Child', required=False, initial=1)
    animal_age = forms.IntegerField(widget=forms.NumberInput(attrs={'class': 'form-control'})
                                    , label='Age', required=False, initial=8)
    animal_weight = forms.IntegerField(widget=forms.NumberInput(attrs={'class': 'form-control'})
                                       , label='Weight(KG)', required=False, initial=250)
    animal_info = forms.CharField(
        widget=forms.Textarea(attrs={'class': 'form-control', 'id': 'animal_info', "rows": 2, "cols": 100})
        , label='Information', required=False)
    animal_price = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'})
                                   , label='Price', required=False, initial=25000)
    front_image = ImageField(required=False, label="Front", widget=forms.FileInput(attrs={'class': 'form-control',
                                                                                          'id': 'id_front_image'}))
    back_image = ImageField(required=False, label="Back", widget=forms.FileInput)
    left_image = ImageField(required=False, label="Left", widget=forms.FileInput)
    right_image = ImageField(required=False, label="Right", widget=forms.FileInput)

    user_name = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control', 'id': 'user_name'})
                                , label='Name', required=False)
    user_contact = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control', 'id': 'user_contact'}),
                                   max_length=15, label='Enter Mobile No', required=False)
    user_village = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'})
                                   , max_length=15, label='Village', required=False)
    user_address = forms.CharField(widget=forms.Textarea(attrs={'class': 'form-control', 'id': 'user_address', "rows": 2, "cols": 100})
                                   , label='Information', required=False)
    user_teh = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'})
                               , label='Tehsil (Block)', required=False)
    user_dist = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'})
                                , label='District', required=False)
    user_late = forms.CharField(widget=forms.HiddenInput(attrs={'class': 'form-control'})
                                , label='user late', required=False, initial=22.72473954)
    user_long = forms.CharField(widget=forms.HiddenInput(attrs={'class': 'form-control'})
                                , label='user long', required=False, initial=75.88166449)
    CHOICES = [('1', 'Black White'), ('2', 'White'), ('3', 'Black'), ('4', 'Light Black'), ('5', 'Brown White'),
               ('6', 'Brown')]
    animal_color = forms.ChoiceField(widget=forms.RadioSelect(attrs={'class': 'radio_field'}), choices=CHOICES,
                                     initial=3)

    milk_list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
    animal_group = forms.ChoiceField(widget=forms.Select(attrs={'class': 'form-control animal_group',
                                                                'id': 'animal_group'}),
                                     choices=[(group.id, str(group.en_name)) for group in load_group()],
                                     required=False, initial='1')
    CHOICES_bread = [('', 'Select Bread')]
    animal_breed = forms.ChoiceField(widget=forms.Select(attrs={'class': 'form-control animal_grouptype',
                                                                'id': 'animal_grouptype'}),
                                     choices=[(type.id, str(type.en_type)) for type in load_all_type()],
                                     required=False)
    animal_milk = forms.ChoiceField(widget=forms.Select(attrs={'class': 'form-control milkquantity',
                                                               'id': 'milkquantity'}),
                                    choices=[(milk, str(milk)) for milk in milk_list],
                                    required=False, initial='1')

    user_state_id = forms.ChoiceField(widget=forms.Select(attrs={'class': 'form-control'}),
                                      choices=[(state.id, str(state.name)) for state in load_state()],
                                      required=False, initial='4')
    user_country_id = forms.ChoiceField(widget=forms.Select(attrs={'class': 'form-control'}),
                                        choices=[(country.id, str(country.name)) for country in load_country()],
                                        required=False, initial='1')

    class Meta:
        model = Post

        fields = ['animal_group', 'animal_breed', 'animal_milk', 'animal_color', 'animal_child', 'animal_age',
                  'animal_weight',
                  'animal_info', 'animal_price', 'front_image', 'back_image', 'left_image', 'right_image', 'user_name',
                  'user_contact', 'user_late', 'user_long', 'user_village', 'user_address', 'user_dist', 'user_teh',
                  'user_state_id', 'user_country_id']


class CommentCreateView(forms.ModelForm):
    phone_regex = RegexValidator(regex=r'^\+?1?\d{10,15}$',
                                 message="Phone number must be entered in the format: '999999999'. Up to 15 digits "
                                         "allowed.")
    name = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control', 'id': 'user-name'})
                           , label='Name', required=False)
    user_contact = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control', 'id': 'user-contact'}),
                                   max_length=15, label='Enter Mobile No', required=False)
    comment = forms.CharField(widget=forms.Textarea(attrs={'class': 'form-control', 'id': 'user-comment', "rows": 2,
                                                           "cols": 100}), label='Information', required=False)

    class Meta:
        model = Comments

        fields = ['name', 'user_contact', 'comment']
