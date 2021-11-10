#!/usr/bin/env bash

set -e

cd "$(dirname "$0")"

ls -alh .

# -----------------------------------------------
# Install admin tools
# -----------------------------------------------

python -m pip install ansible


# -----------------------------------------------
# Django server
# -----------------------------------------------

cd server
pip install -r requirements.txt
python manage.py runserver 0:5000


# -----------------------------------------------
# Finalize
# -----------------------------------------------

# Wait for any process to exit
wait -n

# Exit with status of process that exited first
exit $?