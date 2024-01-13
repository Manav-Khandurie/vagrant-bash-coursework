#!/bin/bash

echo "Script is executing"
date
echo "############"
ls /var/run/httpd/httpd.pid &> /dev/null

if [ $? -eq 0 ]
then
	echo "File is here"
else
	echo "Not here"
	systemctl start httpd
	if [ $? -eq 0 ]
	then
		echo "Process started"
	else
		echo "Contact admin start failed"
	fi
fi

echo "Scriptdone"
