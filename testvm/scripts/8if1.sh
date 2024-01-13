#!/bin/bash

echo "ENTER:"

read NUM
echo "Var=$NUM"

if [ $NUM -gt 100 ]
then
	echo "ABove 100"
	sleep 3
	date
	echo "Done"
fi

echo "Done"
