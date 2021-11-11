#!/usr/bin/env bash

cd "$(dirname "$0")"

python manage.py runserver 0:5000 --noreload