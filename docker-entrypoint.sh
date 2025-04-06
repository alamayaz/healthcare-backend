#!/bin/bash

set -e

# Apply database migrations
echo "Applying database migrations..."
python manage.py migrate

# Create superuser if needed
if [ "$DJANGO_SUPERUSER_USERNAME" ] && [ "$DJANGO_SUPERUSER_PASSWORD" ] && [ "$DJANGO_SUPERUSER_EMAIL" ]; then
    echo "Checking if superuser exists..."
    # Check if superuser exists
    python -c "
import django
django.setup()
from django.contrib.auth import get_user_model
User = get_user_model()
exists = User.objects.filter(username='$DJANGO_SUPERUSER_USERNAME').exists()
if not exists:
    print('Creating superuser...')
    User.objects.create_superuser('$DJANGO_SUPERUSER_USERNAME', '$DJANGO_SUPERUSER_EMAIL', '$DJANGO_SUPERUSER_PASSWORD')
    print('Superuser created successfully')
else:
    print('Superuser already exists')
"
fi

# Collect static files if needed
if [ "$COLLECT_STATIC" = "true" ]; then
    echo "Collecting static files..."
    python manage.py collectstatic --noinput
fi

# Execute the command passed to docker
exec "$@" 