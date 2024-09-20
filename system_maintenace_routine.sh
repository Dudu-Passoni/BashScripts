#!/bin/bash

# This code is in testing and improvement, please send any suggstions.
# @author: Luis Eduardo Passoni
#


clear

echo ""
echo -e "\e[1;33;3mMaintainence routine script for\e[0m \e[36mArch Linux.\e[0m"
echo -e "\e[1;33mAuthor: Luis Eduardo Passoni\e[0m"
echo""


echo "Performing system maintaining routine, please make a backup of important files before continuing."
echo "Do you want to continue? [Y/n]"
read continue_option


if [[ $continue_option == "Y" || $continue_option == "y" ]]; then
	echo "Proceeding..."
else
	echo "Bye"
	exit
fi

echo "Updating system and cleaning non used dependencies..."
sudo pacman -Syu
sudo pacman -Rns $(pacman -Qdtq)

echo ""

clear_logs() {
echo "Cleaning logs."
echo "Up to how many days do you want to clean?"
echo "Write a number: [0-30]"
read cleaning_days_number

if [[ $cleaning_days_number > 30 || $cleaning_days_number < 0 ]]; then
	echo "number out of ranges!"
	clear_logs
else
journalctl --vacuum-time=10d
fi
}
clear_logs

echo ""
echo "Checking the disk space..."

echo -ne '#####                     (33%)\r'
sleep 1
echo -ne '#############             (66%)\r'
sleep 1
echo -ne '#######################   (100%)\r'
echo -ne '\n'

echo ""
df -h /

echo ""
sleep 1

echo "Executing security tests with Lynis..."

if ! command -v lynis &> /dev/null; then
	echo "Lynis is not installed, do you want to install now? [Y/n]"
	read continue_option2

	if [[ $continue_option2 = "Y" && $continue_option2 = "y" ]]; then
		sudo pacman -Sy --noconfirm lynis | sudo lynis audit system
	else
		echo "ok, skipping..."
	fi
else
	echo "Executing lynis..."
	sudo lynis audit system
fi

echo ""
echo "Auditing security logs..."
echo ""
sleep 1

grep "Failed password" /var/log/auth.log

echo ""
echo "Listing all the installed packages (only not-default packages), if there is a package with no usage, its recommended to remove it."
echo ""
sleep 1

pacman -Qe

echo ""
echo -e "\e[1;33mOtimization sucessed, its recommended to check old passwords and credentials.\e[0m"
echo -e "\e[1;33mSee you next month ...\e[0m"
echo -e "\e[1;33mBye\e[0m"
