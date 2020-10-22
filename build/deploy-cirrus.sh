#!/usr/bin/env bash

# Set CI to true for Jfrog CLI
export CI=true

# Cirrus is python 3, so activate the venv
source env/bin/activate

# Build the cirrus lib and publish
python3 setup.py sdist bdist_wheel
twine upload -r artifactory-cirrus-geo dist/*
