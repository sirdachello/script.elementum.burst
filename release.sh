#!/bin/bash

set -e

TAG=0.0.92

git checkout master

rm -f *.zip

sudo -S true

# Install Python dependencies
pip3 install -r requirements.txt

# Run linting
python3 -m flake8
./scripts/xgettext.sh

# Compile zip artifacts
make

# Run artifact uploads if we are on the tag
if [[ $TAG != *-* ]]
then
	make zip
    make upload
fi
