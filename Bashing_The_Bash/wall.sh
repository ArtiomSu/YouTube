#!/usr/bin/env bash

##############################################################
#															 #
# 							USAGE							 #
#			   Version 1: works only with XFCE4				 #
# wall.sh /image/path	// set image as wallpapers 			 #
# wall.sh -r 			// change random wallaper in array   #
# wall.sh -l 			// loop all wallpapers once in array #
# wall.sh -dead 		// loop fast forever			     #
#															 #
##############################################################


default_wall="/home/xbuntu/Pictures/1.jpg"

wall_list=("/home/xbuntu/Pictures/1.jpg" \
"/home/xbuntu/Pictures/2.jpg" \
"/home/xbuntu/Pictures/3.jpg" \
"/home/xbuntu/Pictures/4.jpg" \
"/home/xbuntu/Pictures/5.jpg")



change(){
	xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorVirtual1/workspace0/last-image -s $1
}

if [[ ! -z $1 ]]; then
	if [[ "$1" == "-r" ]]; then
		
		num=$(( RANDOM % ${#wall_list[@]} ))
		echo changing randomly $num
		change ${wall_list[$num]}
	elif [[ "$1" == "-l" ]]; then
		for img in "${wall_list[@]}"; do
			echo changing to $img
			change $img
			sleep 1
		done
	elif [[ "$1" == "-dead" ]]; then
		while [[ 1 -eq 1 ]]; do 
			for img in "${wall_list[@]}"; do
				echo changing to $img
				change $img
				sleep 0.1
			done
		done
	else
		if [[ -f "$1" ]]; then
			change $1
		else
			echo not a file exiting
		fi
	fi
else
	echo nothing selected so changing to default
	change $default_wall
fi