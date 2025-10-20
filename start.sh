#!/bin/bash

# 1. Run Migrations (Must succeed before starting)
echo "Applying database migrations..."
python manage.py migrate --noinput

# 2. Start the Gunicorn web server
echo "Starting Gunicorn server..."
# Note: The `string_analyzer_project` folder is implicitly in the path
gunicorn string_analyzer_project.wsgi