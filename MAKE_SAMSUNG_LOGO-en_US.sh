#!/usr/bin/env bash

# chmod a+x *
# chmod a+x scripts/*

mkdir /sdcard/#LOGO;cd /sdcard/#LOGO;clear

x="teste"
menu ()
{
while true $x != "teste"
do
echo ""
echo ""
echo "#==============================================#"
echo "#                   = Menu =                   #"
echo "#==============================================#"
echo "# LOGO CREATOR FOR SAMSUNG M62/F62 DEVICES     #"
echo "# TOOL ONLY FOR USE ON ANDROID MOBILE PHONE    #"
echo "# Made by @allexwin50                          #"
echo "#==============================================#"
echo "# [1] Extract system LOGO                      #"
echo "# [2] Unpack LOGO                              #"
echo "# [3] Unpack LOGO from another LOGO            #"
echo "# [4] Compress LOGO                            #"
echo "# [5] Replace system LOGO                      #"
echo "# [6] Reboot System                            #"
echo "# [7] Clear (Delete all subfolders of '#LOGO') #"
echo "# [8] Exit                                     #"
echo "#==============================================#"
echo "# Enter the desired option:                    #"
echo "#==============================================#"
read x
echo "# Option entered ($x)"

case "$x" in

1) clear;echo 1;mkdir /sdcard/#LOGO/logo_backup;cat /dev/block/by-name/up_param > /sdcard/#LOGO/logo_backup/logo.img;echo "Backup performed!";;
2) clear;echo 2;[ ! -e "logo_backup" ] && echo "Run command '1' first." && menu;cd /sdcard/#LOGO;mkdir /sdcard/#LOGO/logo_extracted;cd /sdcard/#LOGO/logo_extracted;mv /sdcard/#LOGO/logo_backup/logo.img /sdcard/#LOGO/logo_extracted/logo.bin;tar xf /sdcard/#LOGO/logo_extracted/logo.bin;mv /sdcard/#LOGO/logo_extracted/logo.bin /sdcard/#LOGO/logo_backup/logo.img;echo "LOGO extracted in internal memory in the /#LOGO/logo_extracted folder, replace the images you want, the replaced image should not exceed +-400kb";;
3) clear;echo 3;[ ! -e "logo.img" ] && echo "The logo.img file is missing, rename your LOGO to 'logo.img' and add it to the '#LOGO' folder which is located in the internal memory of the device, so we can proceed..." && menu;cd /sdcard/#LOGO;mkdir /sdcard/#LOGO/logo_backup;mkdir /sdcard/#LOGO/logo_extracted;cd /sdcard/#LOGO/logo_extracted;mv /sdcard/#LOGO/logo.img /sdcard/#LOGO/logo_extracted/logo.bin;tar xf /sdcard/#LOGO/logo_extracted/logo.bin;mv /sdcard/#LOGO/logo_extracted/logo.bin /sdcard/#LOGO/logo_backup/logo.img;echo "Logo extracted in internal memory in /#LOGO/logo_extracted folder, replace the images you want, the replaced image should not exceed +-400kb";;
4) clear;echo 4;[ ! -e "logo_extracted" ] && echo "You must have an extracted logo to run this command." && menu;cd /sdcard/#LOGO/logo_extracted;tar cf - `ls | sort -t.` > /sdcard/#LOGO/logo_extracted/logo.bin;mv /sdcard/#LOGO/logo_extracted/logo.bin /sdcard/#LOGO/logo.img;cd /sdcard/#LOGO;echo "Logo recreated successfully in internal memory in folder /#LOGO!";;
5) clear;echo 5;[ ! -e "logo.img" ] && echo "The 'logo.img' file must be in the #LOGO folder in the internal memory to proceed." && menu;cat /sdcard/#LOGO/logo.img > /dev/block/by-name/up_param;echo "Updated logo!";;
6) clear;echo 6;echo "Rebootting...";reboot;;
7) clear;echo 7;rm -rf /sdcard/#LOGO/logo_backup;rm -rf /sdcard/#LOGO/logo_extracted;echo "All clean!";;
8) clear;echo "Leaving...";clear;exit;;
*) clear;echo "Invalid option!";esac done };menu

