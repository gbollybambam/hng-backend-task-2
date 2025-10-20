#!/bin/bash
set -e

# 1. Ensure Migrations Run (Run from the project root)
echo "Applying database migrations..."
python manage.py migrate --noinput

# 2. Change Directory to the inner Django settings folder
# This is CRITICAL for Gunicorn to find the settings module.
cd string_analyzer_project 

# 3. Start the Gunicorn web server
echo "Starting Gunicorn server..."
# Gunicorn now runs from the directory containing wsgi.py
gunicorn string_analyzer_project.wsgi