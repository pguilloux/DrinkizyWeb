# -*- coding: utf-8 -*-
from south.utils import datetime_utils as datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Deleting field 'DrinkBar.slug'
        db.delete_column(u'drinks_drinkbar', 'slug')

        # Adding field 'DrinkBar.approval'
        db.add_column(u'drinks_drinkbar', 'approval',
                      self.gf('django.db.models.fields.IntegerField')(default=0),
                      keep_default=False)

        # Adding field 'DrinkBar.disapproval'
        db.add_column(u'drinks_drinkbar', 'disapproval',
                      self.gf('django.db.models.fields.IntegerField')(default=0),
                      keep_default=False)

        # Deleting field 'Drink.approval'
        db.delete_column(u'drinks_drink', 'approval')

        # Deleting field 'Drink.disapproval'
        db.delete_column(u'drinks_drink', 'disapproval')

        # Adding field 'Drink.creator'
        db.add_column(u'drinks_drink', 'creator',
                      self.gf('django.db.models.fields.related.ForeignKey')(to=orm['users.CustomUser'], null=True, blank=True),
                      keep_default=False)


    def backwards(self, orm):

        # User chose to not deal with backwards NULL issues for 'DrinkBar.slug'
        raise RuntimeError("Cannot reverse this migration. 'DrinkBar.slug' and its values cannot be restored.")
        
        # The following code is provided here to aid in writing a correct migration        # Adding field 'DrinkBar.slug'
        db.add_column(u'drinks_drinkbar', 'slug',
                      self.gf('django.db.models.fields.SlugField')(max_length=200),
                      keep_default=False)

        # Deleting field 'DrinkBar.approval'
        db.delete_column(u'drinks_drinkbar', 'approval')

        # Deleting field 'DrinkBar.disapproval'
        db.delete_column(u'drinks_drinkbar', 'disapproval')


        # User chose to not deal with backwards NULL issues for 'Drink.approval'
        raise RuntimeError("Cannot reverse this migration. 'Drink.approval' and its values cannot be restored.")
        
        # The following code is provided here to aid in writing a correct migration        # Adding field 'Drink.approval'
        db.add_column(u'drinks_drink', 'approval',
                      self.gf('django.db.models.fields.IntegerField')(),
                      keep_default=False)


        # User chose to not deal with backwards NULL issues for 'Drink.disapproval'
        raise RuntimeError("Cannot reverse this migration. 'Drink.disapproval' and its values cannot be restored.")
        
        # The following code is provided here to aid in writing a correct migration        # Adding field 'Drink.disapproval'
        db.add_column(u'drinks_drink', 'disapproval',
                      self.gf('django.db.models.fields.IntegerField')(),
                      keep_default=False)

        # Deleting field 'Drink.creator'
        db.delete_column(u'drinks_drink', 'creator_id')


    models = {
        u'auth.group': {
            'Meta': {'object_name': 'Group'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '80'}),
            'permissions': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['auth.Permission']", 'symmetrical': 'False', 'blank': 'True'})
        },
        u'auth.permission': {
            'Meta': {'ordering': "(u'content_type__app_label', u'content_type__model', u'codename')", 'unique_together': "((u'content_type', u'codename'),)", 'object_name': 'Permission'},
            'codename': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'content_type': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['contenttypes.ContentType']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '50'})
        },
        u'bars.bar': {
            'Meta': {'object_name': 'Bar'},
            'address': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'approval': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            'creator': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['users.CustomUser']"}),
            'disapproval': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'latitude': ('django.db.models.fields.FloatField', [], {'null': 'True', 'blank': 'True'}),
            'longitude': ('django.db.models.fields.FloatField', [], {'null': 'True', 'blank': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'nb_pictures': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            'phone': ('django.db.models.fields.CharField', [], {'max_length': '200', 'null': 'True', 'blank': 'True'}),
            'slug': ('django.db.models.fields.SlugField', [], {'max_length': '200'}),
            'theme': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['bars.Theme']"}),
            'website': ('django.db.models.fields.CharField', [], {'max_length': '200', 'null': 'True', 'blank': 'True'})
        },
        u'bars.theme': {
            'Meta': {'object_name': 'Theme'},
            'description': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'slug': ('django.db.models.fields.SlugField', [], {'max_length': '200'})
        },
        u'contenttypes.contenttype': {
            'Meta': {'ordering': "('name',)", 'unique_together': "(('app_label', 'model'),)", 'object_name': 'ContentType', 'db_table': "'django_content_type'"},
            'app_label': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'model': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        u'drinks.drink': {
            'Meta': {'object_name': 'Drink'},
            'creator': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['users.CustomUser']", 'null': 'True', 'blank': 'True'}),
            'description': ('django.db.models.fields.CharField', [], {'max_length': '2000'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'slug': ('django.db.models.fields.SlugField', [], {'max_length': '200'}),
            'subcategory': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['drinks.DrinkSubCategory']"})
        },
        u'drinks.drinkbar': {
            'Meta': {'object_name': 'DrinkBar'},
            'approval': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            'bar': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['bars.Bar']"}),
            'disapproval': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            'drink': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['drinks.Drink']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'price': ('django.db.models.fields.FloatField', [], {}),
            'price_happy_hour': ('django.db.models.fields.FloatField', [], {})
        },
        u'drinks.drinkcategory': {
            'Meta': {'object_name': 'DrinkCategory'},
            'description': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'slug': ('django.db.models.fields.SlugField', [], {'max_length': '200'})
        },
        u'drinks.drinksubcategory': {
            'Meta': {'object_name': 'DrinkSubCategory'},
            'category': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['drinks.DrinkCategory']"}),
            'description': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'slug': ('django.db.models.fields.SlugField', [], {'max_length': '200'})
        },
        u'users.customuser': {
            'Meta': {'object_name': 'CustomUser'},
            'avatar_url': ('django.db.models.fields.files.ImageField', [], {'max_length': '100'}),
            'date_joined': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'email': ('django.db.models.fields.EmailField', [], {'max_length': '75', 'blank': 'True'}),
            'first_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'groups': ('django.db.models.fields.related.ManyToManyField', [], {'symmetrical': 'False', 'related_name': "u'user_set'", 'blank': 'True', 'to': u"orm['auth.Group']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'is_active': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'is_staff': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'is_superuser': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'last_login': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'last_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'password': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            'pseudo': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'type': ('django.db.models.fields.CharField', [], {'default': "'user'", 'max_length': '20'}),
            'user_permissions': ('django.db.models.fields.related.ManyToManyField', [], {'symmetrical': 'False', 'related_name': "u'user_set'", 'blank': 'True', 'to': u"orm['auth.Permission']"}),
            'username': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '30'})
        }
    }

    complete_apps = ['drinks']