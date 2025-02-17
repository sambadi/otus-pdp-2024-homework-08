#!/bin/sh

# wait for postgres availability
if [ "$SQL_ENGINE" = "django.db.backends.postgresql" ]
then
    echo "Waiting for postgres..."

    while ! nc -z $SQL_HOST $SQL_PORT; do
      sleep 0.1
    done

    echo "PostgreSQL started"
fi


# Collect static files
echo "Collect static files"
uv run python manage.py collectstatic --noinput

# Apply database migrations
echo "Apply database migrations"
uv run python manage.py migrate

# Seed initial data
if [ ! -f /app/staticfiles/seeded.anchor ]; then
  echo "Seed polls data"
  uv run  python manage.py loaddata /app/polls/seeds/seed_polls.json
  touch /app/staticfiles/seeded.anchor
fi
exec "$@"