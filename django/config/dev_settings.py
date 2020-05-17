from config.common_settings import *

DEBUG = True

SECRET_KEY = 'z)9x=&o5-zw_$bnxz)r)&(ib3#e4wk6rxc$pp^kl!h^nfzv6=4'

DATABASES['default']['NAME'] = 'answerly'
DATABASES['default']['USER'] = 'answerly'
DATABASES['default']['PASSWORD'] = 'development'
DATABASES['default']['PORT'] = 5432
DATABASES['default']['HOST'] = 'db'

ES_INDEX = 'answerly'
ES_HOST = 'es'
ES_PORT = '9200'

TEMPLATES[0]['OPTIONS']['context_processors'] += [
    'django.template.context_processors.debug',
]

CHROMEDRIVER = os.path.join(BASE_DIR, '../chromedriver/chromedriver')