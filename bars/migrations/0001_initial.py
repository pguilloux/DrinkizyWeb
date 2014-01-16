# -*- coding: utf-8 -*-
from south.utils import datetime_utils as datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Bar'
        db.create_table(u'bars_bar', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('slug', self.gf('django.db.models.fields.SlugField')(max_length=200)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('address', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('coordinates', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('phone', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('approval', self.gf('django.db.models.fields.IntegerField')()),
            ('disapproval', self.gf('django.db.models.fields.IntegerField')()),
            ('picture', self.gf('django.db.models.fields.files.ImageField')(max_length=100)),
            ('creator', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['users.CustomUser'])),
            ('theme', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['bars.Theme'])),
        ))
        db.send_create_signal(u'bars', ['Bar'])

        # Adding model 'OpeningHours'
        db.create_table(u'bars_openinghours', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('start_hour', self.gf('django.db.models.fields.IntegerField')()),
            ('end_hour', self.gf('django.db.models.fields.IntegerField')()),
            ('start_happy_hour', self.gf('django.db.models.fields.IntegerField')()),
            ('end_happy_hour', self.gf('django.db.models.fields.IntegerField')()),
            ('day', self.gf('django.db.models.fields.IntegerField')()),
        ))
        db.send_create_signal(u'bars', ['OpeningHours'])

        # Adding model 'OpeningHoursBar'
        db.create_table(u'bars_openinghoursbar', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('bar', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['bars.Bar'])),
            ('hours', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['bars.OpeningHours'])),
        ))
        db.send_create_signal(u'bars', ['OpeningHoursBar'])

        # Adding model 'Theme'
        db.create_table(u'bars_theme', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('slug', self.gf('django.db.models.fields.SlugField')(max_length=200)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('description', self.gf('django.db.models.fields.CharField')(max_length=200)),
        ))
        db.send_create_signal(u'bars', ['Theme'])


    def backwards(self, orm):
        # Deleting model 'Bar'
        db.delete_table(u'bars_bar')

        # Deleting model 'OpeningHours'
        db.delete_table(u'bars_openinghours')

        # Deleting model 'OpeningHoursBar'
        db.delete_table(u'bars_openinghoursbar')

        # Deleting model 'Theme'
        db.delete_table(u'bars_theme')


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
            'approval': ('django.db.models.fields.IntegerField', [], {}),
            'coordinates': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'creator': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['users.CustomUser']"}),
            'disapproval': ('django.db.models.fields.IntegerField', [], {}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'phone': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'picture': ('django.db.models.fields.files.ImageField', [], {'max_length': '100'}),
            'slug': ('django.db.models.fields.SlugField', [], {'max_length': '200'}),
            'theme': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['bars.Theme']"})
        },
        u'bars.openinghours': {
            'Meta': {'object_name': 'OpeningHours'},
            'day': ('django.db.models.fields.IntegerField', [], {}),
            'end_happy_hour': ('django.db.models.fields.IntegerField', [], {}),
            'end_hour': ('django.db.models.fields.IntegerField', [], {}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'start_happy_hour': ('django.db.models.fields.IntegerField', [], {}),
            'start_hour': ('django.db.models.fields.IntegerField', [], {})
        },
        u'bars.openinghoursbar': {
            'Meta': {'object_name': 'OpeningHoursBar'},
            'bar': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['bars.Bar']"}),
            'hours': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['bars.OpeningHours']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'})
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

    complete_apps = ['bars']