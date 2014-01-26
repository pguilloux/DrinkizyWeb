import datetime
from haystack import indexes
from drinks.models import *
from bars.models import *
from haystack.query import SearchQuerySet, SQ
from haystack.inputs import Raw

class DrinkBarIndex(indexes.SearchIndex, indexes.Indexable):
    text = indexes.NgramField(document=True, use_template=True)
    price = indexes.FloatField(model_attr='price', indexed=True)
    bar = indexes.CharField(model_attr='bar')
    bar_name = indexes.CharField(model_attr='bar__name', indexed=True)
    #category = indexes.CharField(model_attr='subcategory.category', faceted=True)
    #subcategory = indexes.DateTimeField(model_attr='pub_date')

    def get_model(self):
        return DrinkBar

    def index_queryset(self, using=None):
        """Used when the entire index for model is updated."""
       	return self.get_model().objects.filter(bar=Raw('SELECT DISTINCT bar_id FROM drinks_drinkbar WHERE 1'))#.order_by('bar__name')#.raw_search(self, 'SELECT * FROM drinks_drinkbar WHERE 1 GROUP BY bar_id')


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