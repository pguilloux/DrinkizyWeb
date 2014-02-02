# -*- coding: utf-8 -*-
from south.utils import datetime_utils as datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Slider'
        db.create_table(u'home_slider', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('title', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('subtitle', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('slug_object_linked', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('picture', self.gf('django.db.models.fields.files.ImageField')(max_length=100)),
        ))
        db.send_create_signal(u'home', ['Slider'])


    def backwards(self, orm):
        # Deleting model 'Slider'
        db.delete_table(u'home_slider')


    models = {
        u'home.slider': {
            'Meta': {'object_name': 'Slider'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'picture': ('django.db.models.fields.files.ImageField', [], {'max_length': '100'}),
            'slug_object_linked': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'subtitle': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '200'})
        }
    }

    complete_apps = ['home']