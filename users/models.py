from django.db import models
from django.contrib.auth.models import AbstractUser, BaseUserManager
from django.contrib.comments.models import Comment

TYPE_USER = (
    ('drinkizy', 'Drinkizy'),
    ('bar', 'Bar'),
    ('user', 'User'),
)
 
class CustomUser(AbstractUser):

	pseudo = models.CharField(max_length=200)
	avatar = models.ImageField(upload_to='avatars/', default='avatars/avatar_placeholder.jpg')
	type = models.CharField(choices=TYPE_USER, max_length=20, default='user')

	#objects = BaseUserManager()
	#USERNAME_FIELD  = 'pseudo'
	#REQUIRED_FIELDS = ['type']

	def getComments(self):
		comments = Comment.objects.filter(user__pseudo=self.pseudo)	
		return comments
