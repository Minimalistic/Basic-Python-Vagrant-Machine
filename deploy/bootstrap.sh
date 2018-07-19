#!/bin/bash

set -e

echo
echo "Environment installation started..."

##
#   Install core components
##

echo
echo "Updating package repositories ..."
apt-get update

echo
echo "Installing Ubuntu python/python3 packages "
apt-get install -y python3 \
                   python3-dev \
                   python-pip \
                   python3-pip

echo
echo "Installing python packages ..."
mkdir -p /home/vagrant/.pip_download_cache
export PIP_DOWNLOAD_CACHE=/home/vagrant/.pip_download_cache
export VIRTUALENV=/home/vagrant/env
pip install -U pip virtualenv
virtualenv --system-site-packages $VIRTUALENV
source $VIRTUALENV/bin/activate

# Setup Exercism.io
pip3 install pytest pytest-cache

# Install python requirements.txt
pip install -r /vagrant/deploy/requirements.txt
if [ $? -gt 0 ]; then
    echo 2> 'Unable to install python requirements from requirements.txt'
    exit 1
fi

##
#   Setup complete.
##

echo
echo "The environment has been installed."
echo
echo "You can start the machine by running: vagrant up"
echo "You can ssh to the machine by running: vagrant ssh"
echo "You can stop the machine by running: vagrant halt"
echo "You can delete the machine by running: vagrant destroy"
echo
echo "If this is your first time, you should install the virtual machine guest additions."
echo "To do that, ssh into the machine (vagrant ssh) and run: sudo ./postinstall.sh"
echo
exit 0
