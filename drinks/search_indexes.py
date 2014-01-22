import datetime
from haystack import indexes
from drinks.models import *
from bars.models import *


class DrinkBarIndex(indexes.SearchIndex, indexes.Indexable):
    text = indexes.NgramField(document=True, use_template=True)
    #subcategory = indexes.CharField(model_attr='subcategory', faceted=True)
    #category = indexes.CharField(model_attr='subcategory.category', faceted=True)
    #subcategory = indexes.DateTimeField(model_attr='pub_date')

    def get_model(self):
        return DrinkBar

    def index_queryset(self, using=None):
        """Used when the entire index for model is updated."""
       	return self.get_model().objects#.filter(pub_date__lte=datetime.datetime.now())
        #return self.get_model().object.filter_or(content="wheelchair", content="vans")
        #.filter(organization_slug__in=organization_list) 
        #filter_or(content="wheelchair", content="vans")


# class DrinkCategoryIndex(indexes.SearchIndex, indexes.Indexable):
#     text = indexes.NgramField(document=True, use_template=True)
#     #description = indexes.CharField(model_attr='description')
#     #subcategory = indexes.DateTimeField(model_attr='pub_date')

#     def get_model(self):
#         return DrinkCategory

#     def index_queryset(self, using=None):
#         """Used when the entire index for model is updated."""
#         return self.get_model().objects#.filter(pub_date__lte=datetime.datetime.now())