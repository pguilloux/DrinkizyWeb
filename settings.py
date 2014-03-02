"""
Django settings for DrinkizyWeb project.

For more information on this file, see
https://docs.djangoproject.com/en/1.6/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.6/ref/settings/
"""
from django.conf.global_settings import TEMPLATE_CONTEXT_PROCESSORS as TCP
import site
site.addsitedir("/home/drinkizy/modules")

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import os
BASE_DIR = os.path.dirname(os.path.dirname(__file__))
PROJECT_PATH = os.path.join(os.path.dirname(os.path.abspath(__file__)),'../')

# HAYSTACK_CONNECTIONS = {
#     'default': {
#         'ENGINE': 'haystack.backends.whoosh_backend.WhooshEngine',
#         'PATH': os.path.join(os.path.dirname(__file__), 'whoosh_index'),
#     },
# }


HAYSTACK_CONNECTIONS = {
    'default': {
        'ENGINE': 'haystack.backends.whoosh_backend.WhooshEngine',
        # 'PATH': 'bottlenews.whoosh_index',
        'PATH': os.path.join(PROJECT_PATH, 'public/whoosh_index/'),
    },
}

HAYSTACK_SEARCH_RESULTS_PER_PAGE = 50

# HAYSTACK_CONNECTIONS = {
#     'default': {
#         'ENGINE': 'haystack.backends.elasticsearch_backend.ElasticsearchSearchEngine',
#         'URL': 'http://127.0.0.1:9200/',
#         'INDEX_NAME': 'haystack',
#     },
# }


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.6/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'l4-wx$kslzg136iihbgzlsrmmcb3#(s245t#9ehyijqfxjaqx7'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

TEMPLATE_DEBUG = True

ALLOWED_HOSTS = ['drinkizy.alwaysdata.net']

AUTH_USER_MODEL = 'users.CustomUser'


# Application definition

INSTALLED_APPS = (
    'suit',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',

    #added packages
    'south',
    'haystack',
    'floppyforms',
    #'endless_pagination',
    'autocomplete_light',
    'tastypie',
    'sorl.thumbnail',

    #apps
    'home',
    'bars',
    'drinks',
    'search',
    'users',
)

MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
)

ROOT_URLCONF = 'DrinkizyWeb.urls'

WSGI_APPLICATION = 'DrinkizyWeb.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.6/ref/settings/#databases

# DATABASES = {
#     'default': {
#         'ENGINE': 'django.db.backends.sqlite3',
#         'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
#     }
# }

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql', # Add 'postgresql_psycopg2', 'mysql', 'sqlite3' or 'oracle'.
        'NAME': 'drinkizy_bdd',                      # Or path to database file if using sqlite3.
        # The following settings are not used with sqlite3:
        'USER': 'drinkizy',
        'PASSWORD': 'poperpolpol',
        'HOST': 'mysql1.alwaysdata.com',                      # Empty for localhost through domain sockets or '127.0.0.1' for localhost through TCP.
    }
}

# Internationalization
# https://docs.djangoproject.com/en/1.6/topics/i18n/

LANGUAGE_CODE = 'fr-fr'

TIME_ZONE = 'Europe/Paris'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.6/howto/static-files/


STATICFILES_FINDERS = (
  "django.contrib.staticfiles.finders.FileSystemFinder",
  "django.contrib.staticfiles.finders.AppDirectoriesFinder",
)
STATIC_URL = "/static/"
MEDIA_URL = "/static/medias/"
STATIC_ROOT = os.path.join(PROJECT_PATH, "public", "static")
#STATIC_ROOT = "/home/www/DrinkizyWeb/public/static"
MEDIA_ROOT = os.path.join(PROJECT_PATH, "public", "static", "medias")
#MEDIA_ROOT = "/home/www/DrinkizyWeb/public/static/medias"


# STATIC_ROOT = '/home/www/DrinkizyWeb/public/static/' 
# STATIC_URL = '/static/'# if DEBUG else STATIC_URL = 'http://drinkizy.alwaysdata.net/static'
# MEDIA_ROOT = '/home/www/DrinkizyWeb/public/static/medias' 
# MEDIA_URL = '/static/medias/'# if DEBUG else MEDIA_URL = 'http://drinkizy.alwaysdata.net/static/medias'


# # Additional locations of static files
# STATICFILES_DIRS = (
#     os.path.join(PROJECT_PATH, 'static/'),
#     # Put strings here, like "/home/html/static" or "C:/www/django/static".
#     # Always use forward slashes, even on Windows.
#     # Don't forget to use absolute paths, not relative paths.
# )

TEMPLATE_DIRS = (
    os.path.join(PROJECT_PATH, 'templates'),
    # Put strings here, like "/home/html/django_templates" or "C:/www/django/templates".
    # Always use forward slashes, even on Windows.
    # Don't forget to use absolute paths, not relative paths.
)

TEMPLATE_CONTEXT_PROCESSORS = TCP + (
    'django.core.context_processors.request',
)

def get_cache(): 
    import os 
    try: 
        os.environ['MEMCACHE_SERVERS'] = os.environ['MEMCACHIER_SERVERS'].replace(',', ';') 
        os.environ['MEMCACHE_USERNAME'] = os.environ['MEMCACHIER_USERNAME'] 
        os.environ['MEMCACHE_PASSWORD'] = os.environ['MEMCACHIER_PASSWORD'] 
        return {
            'default': {
                'BACKEND': 'django.core.cache.backends.memcached.MemcachedCache', 
                'TIMEOUT': 500, 
                'BINARY': True, 
                'OPTIONS': { 'tcp_nodelay': True }
            }
        } 
    except: 
        return { 
            'default': { 
                'BACKEND': 'django.core.cache.backends.locmem.LocMemCache' 
            } 
        } 
        CACHES = get_cache() 
        SESSION_SERIALIZER = 'django.contrib.sessions.serializers.JSONSerializer' 
        SESSION_ENGINE = 'django.contrib.sessions.backends.cache'

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'filters': {
        'require_debug_false': {
            '()': 'django.utils.log.RequireDebugFalse'
        }
    },

    'handlers': {
        'mail_admins': {
            'level': 'ERROR',
            'filters': ['require_debug_false'],
            'class': 'django.utils.log.AdminEmailHandler'
        },
     'console':{
            'level': 'DEBUG',
            'class': 'logging.StreamHandler',
        },
    },
    'loggers': {
        'django.request': {
            'handlers': ['mail_admins'],
            'level': 'ERROR',
            'propagate': True,
        },
    }
}