"""
WSGI config for djangotest project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/1.7/howto/deployment/wsgi/
"""

import os
import sys
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "djangotest.settings")
reload(sys)
sys.setdefaultencoding('utf8')
from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()
