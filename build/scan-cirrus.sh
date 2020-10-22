#!/usr/bin/env bash

# Set CI to true for Jfrog CLI
export CI=true

# Cirrus is python 3, so activate the venv
source env/bin/activate

# scan build
jfrog rt bs --fail=false "$1 :: $2" $3