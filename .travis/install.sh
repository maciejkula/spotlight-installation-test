#!/bin/bash

set -e

# Download and install conda
if [[ $TRAVIS_OS_NAME == 'osx' ]]; then
    wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -O ~/miniconda.sh
else
    wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
fi

bash ~/miniconda.sh -b -p $HOME/miniconda
export PATH="$HOME/miniconda/bin:$PATH"
rm ~/miniconda.sh

conda install -y -c maciejkula -c pytorch -c peterjc123 spotlight=0.1.4
