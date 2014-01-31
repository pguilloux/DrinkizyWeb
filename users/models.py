from django.db import models
from django.contrib.auth.models import AbstractUser, BaseUserManager

TYPE_USER = (
    ('drinkizy', 'Drinkizy'),
    ('bar', 'Bar'),
    ('user', 'User'),
)
 
class CustomUser(AbstractUser):

	pseudo = models.CharField(max_length=200)
	avatar_url = models.ImageField(upload_to='avatars/')
	type = models.CharField(choices=TYPE_USER, max_length=20, default='user')

	#objects = BaseUserManager()
	#USERNAME_FIELD  = 'pseudo'
	#REQUIRED_FIELDS = ['type']