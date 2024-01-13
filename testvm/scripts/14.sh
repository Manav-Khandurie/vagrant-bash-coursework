#!/bin/bash
echo "Bash version ${BASH_VERSION}"

counter=0

while [ $counter -lt 5 ]
do 
	echo "value of \$counter is $counter."
	counter=$(($counter + 1))
done


