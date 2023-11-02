#!/bin/bash

echo "Welcome"

#while loop to keep it runing
while true; do 
	echo "$(ls -lh | awk '{print $9,$5}')"

	read -p "Enter a line of text (Press Enter without text to exit):" input

	if [ -z $input ]; then
		echo "Exiting the Interactive Explorer. Goodbye!"
	break 

	fi
       echo "Character Count: $(echo -n $input | wc -m)"
done
