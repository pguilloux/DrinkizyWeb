from django.db import models
from users.models import *
from bars.models import *

ACTIVITY_TYPE = (
    (0, 'Propose a drink'),
    (1, 'Approve a drink'),
    (2, 'Dispprove a drink'),
    (3, 'Propose a bar'),
    (4, 'Approve a bar'),
    (5, 'Dispprove a bar'),
    (6, 'Comment a bar'),
    (7, 'Rank a bar'),
    (8, 'Rank a drink'),
    (9, 'Create a top'),
    (10, 'Modify a top'),
    (11, 'Delete a top'),
)


class Activity(models.Model):
	slug = models.SlugField(max_length=200)

	name = models.CharField(max_length=200)
	description = models.CharField(max_length=200)

	date = models.DateTimeField()

	user = models.ForeignKey('users.User')
	activity_type = models.ForeignKey('ActivityType')


	#we use a python dictionary to simulate a switch case to define what foreign key has to be setted
	options = {0 : id_drink_bar,
                1 : id_drink_bar,
                2 : id_drink_bar,
                3 : id_bar,
                4 : id_bar,
                5 : id_bar,
                6 : id_comment,
                7 : id_rank_bar,
                8 : id_rank_drink_bar,
                9 : id_top,
                10 : id_top,
                11 : id_top,
	}

	concerned_id = options[activity_type.name]()
 
	def id_drink_bar():
	    return models.ForeignKey('drinks.DrinkBar')
	 
	def id_bar():
	    return models.ForeignKey('bars.Bar')

	def id_commentr():
	    return models.ForeignKey('comments.Comment')
	 
	def id_rank_bar():
	    return models.ForeignKey('ranks.RankBar')
	 
	def id_rank_drink_bar():
	    return models.ForeignKey('ranks.RankDrink')

	def id_top():
	    return models.ForeignKey('tops.Top')

	def __unicode__(self):
		return "%s : %s" % (self.pseudo, self.comment)


class ActivityType(models.Model):
	slug = models.SlugField(max_length=200)

	name = models.IntegerField(min=0, max=10, choices=ACTIVITY_TYPE)
	description = models.CharField(max_length=200)

	concerned_table = models.CharField(max_length=200)

	def __unicode__(self):
		return "%s : %s" % (self.pseudo, self.comment)