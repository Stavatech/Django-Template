#!/bin/bash
python3 ./manage.py makemigrations
python3 ./manage.py migrate

# Prepare static files
STATIC_DIR=/tmp/static
mkdir -p $STATIC_DIR
python3 ./manage.py collectstatic --no-input

# Prepare log files and start outputting logs to stdout
LOG_DIR=/tmp/logs
mkdir -p $LOG_DIR
touch $LOG_DIR/gunicorn.log
touch $LOG_DIR/access.log
tail -n 0 -f $LOG_DIR/*.log &

if [ "$STAGE" = "production" ] ; then
    echo "Running production server..."
    exec gunicorn config.wsgi -b 0.0.0.0:8000 \
        --name django-svc
        --workers 3 \
        --log-level=debug \
        --log-file=/srv/logs/gunicorn.log \
        --access-logfile=/srv/logs/access.log
else
    echo "Running development server: $@"
    exec "$@"
fi