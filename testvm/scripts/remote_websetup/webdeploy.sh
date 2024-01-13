#!/bin/bash

USR='devops'
for host in `cat remhosts`
do
	echo "#############"
	echo "connecting to $host"
	scp multiossetup.sh $USR@$host:/tmp/
	ssh $USR@$host sudo /tmp/multiossetup.sh
	ssh $USR@$host sudo rm -rf /tmp/multiossetup.sh
done


