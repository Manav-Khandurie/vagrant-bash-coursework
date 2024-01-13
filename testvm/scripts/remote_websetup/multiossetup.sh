#!/bin/bash

# Variable Declaration
#PACKAGE="httpd wget unzip"
#SVC="httpd"
URL='https://www.tooplate.com/zip-templates/2098_health.zip'
ART_NAME='2098_health'
TEMPDIR="/tmp/webfiles"

yum --help &> /dev/null

if [ $? -eq 0 ]
then
	#Install on centos
	PACKAGE="httpd wget unzip"
	SVC="httpd"
	echo "install on centos"
	# Installing Dependencies
	echo "########################################"
	echo "Installing packages."
	echo "########################################"
	sudo yum install $PACKAGE -y > /dev/null
	echo
	# Start & Enable Service
	echo "########################################"
	echo "Start & Enable HTTPD Service"
	echo "########################################"
	sudo systemctl start $SVC
	sudo systemctl enable $SVC
	echo
	# Creating Temp Directory
	echo "########################################"
	echo "Starting Artifact Deployment"
	echo "########################################"
	mkdir -p $TEMPDIR
	cd $TEMPDIR
	echo
	
	wget $URL > /dev/null
	unzip $ART_NAME.zip > /dev/null
	sudo cp -r $ART_NAME/* /var/www/html/
	echo
	
	# Bounce Service
	echo "########################################"
	echo "Restarting HTTPD service"
	echo "########################################"
	systemctl restart $SVC
	echo

	# Clean Up
	echo "########################################"
	echo "Removing Temporary Files"
	echo "########################################"
	rm -rf $TEMPDIR
	echo

	sudo systemctl status $SVC
	ls /var/www/html/


else
	# Installing Dependencies for ubuntu
	PACKAGE="apache2 wget unzip"
	SVC="apache2"
	echo "Setup on Ubuntu"
	echo "########################################"
	echo "Installing packages."
	echo "########################################"
	sudo apt update -y
	sudo apt install $PACKAGE -y > /dev/null
	echo

	# Start & Enable Service
	echo "########################################"
	echo "Start & Enable HTTPD Service"
	echo "########################################"
	sudo systemctl start $SVC
	sudo systemctl enable $SVC
	echo

	# Creating Temp Directory
	echo "########################################"
	echo "Starting Artifact Deployment"
	echo "########################################"
	mkdir -p $TEMPDIR
	cd $TEMPDIR
	echo

	wget $URL > /dev/null
	unzip $ART_NAME.zip > /dev/null
	sudo cp -r $ART_NAME/* /var/www/html/
	echo

	# Bounce Service
	echo "########################################"
	echo "Restarting HTTPD service"
	echo "########################################"
	systemctl restart $SVC
	echo

	# Clean Up
	echo "########################################"
	echo "Removing Temporary Files"
	echo "########################################"
	rm -rf $TEMPDIR
	echo

	sudo systemctl status $SVC
	ls /var/www/html/
fi
