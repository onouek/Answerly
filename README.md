# Answerly
> A Stack Overflow clone

Users who register for Answerly will be able to ask and answer questions. A question's asker will also be able to accept answers to mark them as useful.


## Installation

Install [Docker Compose](https://docs.docker.com/compose/install/)

List the variables in `.env` file.

```
# Django settings
DJANGO_SETTINGS_MODULE=config.production_settings
DJANGO_SECRET_KEY=#put your secret key here
DJANGO_LOG_LEVEL=INFO
DJANGO_LOG_FILE=/var/log/answerly/answerly.log
DJANGO_ALLOWED_HOSTS=# put your domain here

DJANGO_DB_NAME=answerly
DJANGO_DB_USER=answerly
DJANGO_DB_PASSWORD=#put your password here
DJANGO_DB_HOST=db
DJANGO_DB_PORT=5432

DJANGO_ES_INDEX=answerly
DJANGO_ES_HOST=es
DJANGO_ES_PORT=9200

# Postgres settings
POSTGRES_PASSWORD=# put your postgress admin password here
```

To start containers locally, run the following command:

```sh
$ docker-compose up -d
```

To migrate database,, run the following command:

```sh
$ docker-compose exec web /answerly/venv/bin/python /answerly/django/manage.py migrate
```

To create an index in ElasticSearch, run the following command:

```sh
$ curl -XPUT "localhost:9200/answerly?pretty"
```
