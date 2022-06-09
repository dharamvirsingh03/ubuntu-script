#!/bin/bash
# -------
# Script for installation of apache2, PHP7.2, Composer, Postgresql, Pgadmin3, Zoom, Google Chrome, Postman, Git-Core,  Git-Hub Desktop, VSCode, Nodejs, NPM, Yarn, Slack
# add Postgres version if you don't want to install the latest one.
# Zoom will be downloaded each time when you run this script on same script location.
# Script is for Ubuntu 20.04 Focal Fossa.
# Copyright 2021-22
# -------
# Steps to getting started with this script:
# 1. Install github in newly installed Ubuntu by below commands
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
# sudo apt-add-repository https://cli.github.com/packages
# sudo apt install gh
# 2. login to github thru HTTPS by
# gh auth login
# and follow on screen instructions.
# 3. download git repo by
# gh repo clone dharamvirsingh03/ubuntu-script

sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2

# -------

sudo apt install -y curl wget gnupg2 ca-certificates lsb-release apt-transport-https
sudo apt-add-repository ppa:ondrej/php
echo "Press Enter"
sudo apt update
sudo apt install -y php7.2 php7.2-cli php7.2-common
systemctl restart apache2

sudo apt-get install -y composer

# -------
# in below command, add focal, bionic, xenial or disco according to lsb_release version of os..run (lsb_release -cs)

sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt focal-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install postgresql -y
echo -e "\e[38;5;82mYou need to manually add password to postgres user"
echo -e "\e[38;5;82mso copy and paste below text"
echo -e "\e[38;5;198mALTER USER postgres PASSWORD 'ucreate@123';"
echo -e "\e[38;5;198mPress \q to quit"

sudo -u postgres psql

# -------
sudo apt-get install pgadmin4 -y

# -------

sudo apt-get install git-core git-gui git-doc -y

# -------

wget https://zoom.us/client/latest/zoom_amd64.deb

sudo dpkg -i zoom_amd64.deb
# -------

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo dpkg -i google-chrome-stable_current_amd64.deb

# -------

sudo snap install postman

# -------

sudo snap install code --classic

# -------

sudo apt-get install -y nodejs

sudo apt-get install -y npm

sudo apt-get install -y yarn

# -------
sudo snap install slack --classic
# -------

sudo apt install mysql-server -y

echo "\e[38;5;82mStep-1 To set root password run below command and then press Y"
echo "sudo mysql_secure_installation"
echo "Step-2 It is recommended that authentication method should be changed from auth_socket to mysql_native_password. You can do that by running the following command"
echo "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'very_strong_password';"
echo "FLUSH PRIVILEGES;"
# https://linuxize.com/post/how-to-install-mysql-on-ubuntu-18-04/

# -------

apt --fix-broken install -y

echo "\e[38;5;50mCheck PHP Version"
php -v
git --version
echo "\e[38;5;82mKindly note down PSQL Username is postgres and password is \e[38;5;198mucreate@123"
echo "Thankyou \e[36m"

#sudo snap install -y phpstorm --classic

#sudo snap install -y dbeaver-ce

#sudo apt install -y docker.io
#Start docker and enable it to start after the system reboot: 
#sudo systemctl enable --now docker

#To install Docker Compose
#sudo apt install -y docker-compose

#To install AWS CLI
#curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
#unzip awscliv2.zip
#sudo ./aws/install

#To install Heroku CLI
#sudo snap install --classic heroku

#Python version 2
#sudo apt install python2
#check version (both versions are already installed if you update Ubuntu 20.04)
#python2 -V
#python3 -V
