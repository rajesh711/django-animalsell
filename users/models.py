from django.db import models
from django.contrib.auth.models import User


class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    user_contact = models.CharField(max_length=100)
    user_late = models.CharField(max_length=100)
    user_long = models.CharField(max_length=100)
    user_village = models.CharField(max_length=100)
    user_address = models.TextField()
    user_teh = models.CharField(max_length=100)
    user_dist = models.CharField(max_length=100)
    user_state = models.CharField(max_length=100)
    user_country = models.CharField(max_length=100)
    user_state_id = models.CharField(max_length=100)
    user_country_id = models.CharField(max_length=100)

    def __str__(self):
        return f'{self.user.username} Profile'
