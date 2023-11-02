#!/bin/bash

display(){

	echo "Usage: $0 [options]"
        echo -e "options: \n-c, --create Create New user account.\n-d ,--delete Delete and existing user\n-r, --reset Reset password for exisitng user\n-l, --list List all user accounts\n-h, --Help Dispplay help and exit."

}

user_create(){

	read -p "Enter new user name: " user_name

	if id $user_name &> /dev/null ; then 
		echo "user with $user_name already exist"

	else 

        	# read -p "Enter password for $user_name: " password
        	sudo useradd -m $user_name
		sudo passwd $user_name
		echo "User account $user_name craeted"
	fi 

}


del_user(){

	read -p "Enter the name of user: " deluser
	
	if id $deluser &> /dev/null ; then 
		sudo userdel -r $deluser
		echo "user $deluser is deleted"
	else
		echo "$deluser does not exist"	
	fi 
}

pass_reset(){

	read -p "Enter user name to reset password: " reset_user

	if id $reset_user &> /dev/null ; then
                sudo passwd $reset_user
                echo "User $reset_user  password rested"

        else

                echo "User account $reset_user is not exist"
        fi


}

list_user(){

	cat /etc/passwd | awk -F : '{print "-" $1 " (UID: "$3" )"}'

}

if [ $# -eq 0 ]; then 
	
       display	

elif [ "$1" = "-c" ] || [ "$1" = "--create" ];then
	user_create

elif [ "$1" = "-d" ] || [ "$1" = "--delete" ];then

	del_user

elif [ "$1" = "-r" ] || [ "$1" = "--reset" ];then

	pass_reset

elif [ "$1" = "-l" ] || [ "$1" = "--list" ]; then

	list_user


elif [ "$1" = "-h" ] || [ "$1" = "--help" ]; then 

	display

else 

	echo "invalid choice"

fi 
