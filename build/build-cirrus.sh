#!/usr/bin/env bash

# Set CI to true for Jfrog CLI
export CI=true

# Cirrus is python 3, so set and activate a venv
python3 -m venv env
source env/bin/activate
python -m pip install --user --upgrade pip
pip install --upgrade pip
pip install twine
pip install wheel

# Activate using the pre-configured artifactory targets for CI
jfrog rt pip-config --server-id-resolve e84-artifactory --repo-resolve cirrus-geo-python-virtual

# install python reqs
jfrog rt pip-install -r requirements.txt --no-cache-dir --force-reinstall --build-name="$1 :: $2" --build-number=$3

# Collect environment stuff and publish
jfrog rt bce "$1 :: $2" $3
jfrog rt bp "$1 :: $2" $3