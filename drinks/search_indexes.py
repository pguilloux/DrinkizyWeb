import datetime
from haystack import indexes
from drinks.models import *


class DrinkIndex(indexes.SearchIndex, indexes.Indexable):
    text = indexes.NgramField(document=True, use_template=True)
    #description = indexes.CharField(model_attr='description')
    #subcategory = indexes.DateTimeField(model_attr='pub_date')

    def get_model(self):
        return Drink

    def index_queryset(self, using=None):
        """Used when the entire index for model is updated."""
        return self.get_model().objects#.filter(pub_date__lte=datetime.datetime.now())


class DrinkCategoryIndex(indexes.SearchIndex, indexes.Indexable):
    text = indexes.NgramField(document=True, use_template=True)
    #description = indexes.CharField(model_attr='description')
    #subcategory = indexes.DateTimeField(model_attr='pub_date')

    def get_model(self):
        return DrinkCategory

    def index_queryset(self, using=None):
        """Used when the entire index for model is updated."""
        return self.get_model().objects#.filter(pub_date__lte=datetime.datetime.now())