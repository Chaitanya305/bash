#!/bin/bash

#chcking if process is runnign or not\
i=0

while [ $i -lt 3 ]; do 
	
	if  ps -ef| grep -i nginx |grep -v grep  &> /dev/null ;then 

		echo "process is running"
	else

		echo "process is not running"

	fi	
	((i=$i+1))
done 	
