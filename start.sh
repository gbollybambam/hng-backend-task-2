#!/bin/bash
set -e

# 1. Add current working directory to Python Path
# This is the definitive fix for ModuleNotFoundError in nested Django structures
export PYTHONPATH="$PYTHONPATH:$PWD"

# 2. Run Migrations
echo "Applying database migrations..."
python manage.py migrate --noinput

# 3. Start the Gunicorn web server
echo "Starting Gunicorn server..."
gunicorn string_analyzer_project.wsgi