#!/usr/bin/env bash

help(){

	RED='\033[0;31m'
	NC='\033[0m' # No Color
	Black='\033[0;30m'     
	DarkGray='\033[1;30m'
	Red='\033[0;31m'     
	LightRed='\033[1;31m'
	Green='\033[0;32m'     
	LightGreen='\033[1;32m'
	BrownOrange='\033[0;33m'     
	Yellow='\033[1;33m'
	Blue='\033[0;34m'     
	LightBlue='\033[1;34m'
	Purple='\033[0;35m'     
	LightPurple='\033[1;35m'
	Cyan='\033[0;36m'     
	LightPATH_COLOUR='\033[1;36m'
	LightGray='\033[0;37m'     
	White='\033[1;37m'

	BGBLACK='\033[1;40m'
	BGDEFAULT='\033[0;49m'

	BOLD='\033[0;1m'
	UNDERLINED='\033[0;4m'
	BLINK='\033[0;5m'

	SHORTCUT_COLOUR=$LightPurple
	PATH_COLOUR=$Cyan

	echo -e "			$SHORTCUT_COLOUR  v: ${PATH_COLOUR}/media/veracrypt1 \n\
			$SHORTCUT_COLOUR  d: ${PATH_COLOUR}~/Downloads \n\
			$SHORTCUT_COLOUR  t: ${PATH_COLOUR}/tmp \n\
			$SHORTCUT_COLOUR tt: ${PATH_COLOUR}/temp \n\
			$SHORTCUT_COLOUR  s: ${PATH_COLOUR}~/scrips \n\
			$SHORTCUT_COLOUR  v: ${PATH_COLOUR}/media/veracrypt1 \n\
			$SHORTCUT_COLOUR  g: ${PATH_COLOUR}/media/veracrypt1/GIT \n\
			$SHORTCUT_COLOUR  k: ${PATH_COLOUR}/media/veracrypt1/Klusters \n\
			$SHORTCUT_COLOUR  1: ${PATH_COLOUR}/media/1tbssd \n\
			$SHORTCUT_COLOUR  2: ${PATH_COLOUR}/media/2tbssd \n\
			$SHORTCUT_COLOUR  m: ${PATH_COLOUR}/nas/nfs-movies \n\
			$SHORTCUT_COLOUR ms: ${PATH_COLOUR}/nas/nfs-movies/new_series \n\
			$SHORTCUT_COLOUR mu: ${PATH_COLOUR}/nas/nfs-music/Music \n\
			$SHORTCUT_COLOUR  a: ${PATH_COLOUR}/nas/nfs-android \n\
			$SHORTCUT_COLOUR dd: ${PATH_COLOUR}/nas/nfs-dump \n\
			$SHORTCUT_COLOUR pp: ${PATH_COLOUR}save current path \n\
			$SHORTCUT_COLOUR  p: ${PATH_COLOUR}saved path: $(cat $change_to_dirfile_cs_sh 2>/dev/null || echo None saved) \n\
			$NC"
}

change_to_dirfile_cs_sh=/tmp/cs.sh.change_to_dir

save_change_to_dir(){
	pwd > $change_to_dirfile_cs_sh
}

load_change_to_dir(){
	change_to_dir=$(cat $change_to_dirfile_cs_sh)
	if [ -d $change_to_dir ]; then
		cd $change_to_dir
	else
		echo Cannot cd into $change_to_dir
	fi
}

case $1 in
	"v")
		cd /media/veracrypt1
		;;
	"d")
		cd ~/Downloads
		;;
	"dd")
		cd /nas/nfs-dump
		;;
	"m")
		cd /nas/nfs-movies
		;;
	"ms")
		cd /nas/nfs-movies/new_series
		;;
	"mu")
		cd /nas/nfs-music/Music
		;;
	"t")
		cd /tmp
		;;
	"tt")		
		cd /temp
		;;
	"s")		
		cd ~/scrips
		;;	
	"g")		
		cd /media/veracrypt1/GIT
		;;	
	"k")		
		cd /media/veracrypt1/Klusters
		;;		
	"1")		
		cd /media/1tbssd
		;;	
	"2")		
		cd /media/2tbssd
		;;	
	"a")		
		cd /nas/nfs-android 
		;;	
	"p")		
		load_change_to_dir
		;;	
	"pp")		
		save_change_to_dir
		;;	
	"h" | "-h" | "--help")		
		help
		;;	
	*)
		cd $1
		;;
esac			
