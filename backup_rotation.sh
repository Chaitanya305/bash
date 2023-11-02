#!/bin/bash

#take backup of /home/chaitanya/backup this directory to the 
Dir=$1

#chck wether provided input is directory or not 


if [ $# -eq 0 ] || [ ! -d $1 ];then

	echo "Error: please provide valid directory"

	exit 1
fi

createdirectory(){

	i=0
	time=$(date +%Y-%m-%d_-%H-%M-%S)
	cd $Dir

	if [ $(ls backup* | wc -l) -eq 0 ]; then 

		while [ $i -lt 3 ]; do
			time=$(date +%Y-%m-%d_-%H-%M-%S)

			mkdir $Dir/backup_$time
			
			echo "Backup created: $Dir/backup_$time"

			((i= $i+1))
			sleep 5
		done
	else
		mkdir $Dir/backup_$time

		echo "Backup created: $Dir/backup_$time"
	fi 
}


#cp -r $Dir/* $Dir/backup_$(date +%Y-%m-%d_-%H:%M:%S)/


Rotation(){

	backups=($(ls -dt $Dir/backup*))    #ls -dt --here -d is flag to only show directory 

	
	remove=${backups[@]:3}


        for backup in ${remove[@]}; do

		rm -r $backup

	done	

}

createdirectory

Rotation

