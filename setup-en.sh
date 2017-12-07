#!/bin/bash

echo "Auto Installing MongoDB"
echo "Continue? (Y/n) "

read item
case "$item" in
    y|Y) echo "Adding the MongoDB repository ..."
         sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
         echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
         sudo apt-get update
         echo "Installing MongoDB..."
         sudo apt-get install -y mongodb-org
         echo "Config file configuration..."
         sudo nano /etc/systemd/system/mongodb.service
         sudo systemctl start mongodb
         sudo systemctl status mongodb
         echo "Do you want to add MongoDB to startup?"
         echo "(Y/n) "
         read item
         case "$item" in
             y|Y) echo "Adding MongoDB to Startup..."
                  sudo systemctl enable mongodb
                  ;;
             *) echo "Enter "n", complete the installation..."
                  exit 0
                  ;;
        ;;
    n|N) echo "Enter "n", end..."
        exit 0
        ;;
    *) exit 1
        ;;
esac
