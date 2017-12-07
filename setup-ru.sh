#!/bin/bash

echo "Установка MongoDB"
echo "Продолжить? (Y/n) "

read item
case "$item" in
    y|Y) echo "Добавление репозитория MongoDB..."
         sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
         echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
         sudo apt-get update
         echo "Установка MongoDB..."
         sudo apt-get install -y mongodb-org
         echo "Настройка Config файла..."
         sudo nano /etc/systemd/system/mongodb.service
         sudo systemctl start mongodb
         sudo systemctl status mongodb
         echo "Добавить MongoDB в автозагрузку?"
         echo "(Y/n) "
         read item
         case "$item" in
             y|Y) echo "Добавление MongoDB в автозагрузку..."
                  sudo systemctl enable mongodb
                  ;;
             *) echo "Ввели «n», завершаем установку..."
                  exit 0
                  ;;
        ;;
    n|N) echo "Ввели «n», завершаем..."
        exit 0
        ;;
    *) exit 1
        ;;
esac
