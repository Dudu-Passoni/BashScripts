#!/bin/bash

# This code is in testing and improvement, please send any suggstions.
# @author: Luis Eduardo Passoni
#

clear

arch_linux_script () {
echo -e "\e[1;33mMaintenance routine script for\e[0m \e[36mArch Linux.\e[0m"
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
echo "Do you want to update your system? [Y/n]"
read option1
if [[ $option1 == "Y" || $option1 == "y" ]]; then
  echo "Updating you system."
  sudo pacman -Syu
fi
echo "Do you want to remove unsused dependencies? (Be careful, this may remove some packages you use) [Y/n]"
read option2
if [[ $option2 == "Y" || $option2 == "y" ]]; then
  echo "Removindo unwanted packages..."
  sudo pacman -Rns $(pacman -Qdtq)
fi
echo ""

echo "Cleaning logs."
clear_logs() {
echo "Up to how many days do you want to clean?"
echo "Write a number: [0-30]"
read cleaning_days_number

if [[ $cleaning_days_number > 30 || $cleaning_days_number < 0 ]]; then
	echo "number out of ranges!"
	clear_logs
else
	sudo journalctl --vacuum-time=${cleaning_days_number}d

	echo -ne '#####                     (33%)\r'
	sleep 1
	echo -ne '#############             (66%)\r'
	sleep 1
	echo -ne '#######################   (100%)\r'
	echo -ne '\n'


fi
}
clear_logs

echo ""
echo "Checking the disk space..."

sleep 1

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
echo "This script now will list all installed packages, do you want to continue?[Y/n]"
read continue_variable

if [[ $continue_variable == "Y" || $continue_variable == "y" ]]; then
	echo "Listing all the installed packages (only not-default packages), if there is a package with no usage, its recommended to remove it."
	echo ""
	sleep 1

	pacman -Qe
fi
sleep 1


echo ""
echo -e "\e[1;33mOtimization sucessed, its recommended to check old passwords and credentials.\e[0m"
echo -e "\e[1;33mSee you next month ...\e[0m"
echo -e "\e[1;33mBye\e[0m"
}

# ------------------------------------------------------------------------------

debian_script () {
echo -e "\e[1;33mMaintenance routine script for\e[0m \e[1;31mDebian.\e[0m"
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

echo "Do you want to update your system? [Y/n]"
read option1
if [[ $option1 == "Y" || $option1 == "y" ]]; then
  echo "Updating you system."
  sudo apt update
  sudo apt upgrade
fi
echo "Do you want to remove unsused dependencies? (Be careful, this may remove some packages you use)"
read option2
if [[ $option2 == "Y" || $option2 == "y" ]]; then
  echo "Removindo unwanted packages..."
  sudo apt autoremove
fi
echo ""

echo "Cleaning logs."
clear_logs() {
echo "Up to how many days do you want to clean?"
echo "Write a number: [0-30]"
read cleaning_days_number

if [[ $cleaning_days_number > 30 || $cleaning_days_number < 0 ]]; then
	echo "number out of ranges!"
	clear_logs
else
	sudo journalctl --vacuum-time=${cleaning_days_number}d

	echo -ne '#####                     (33%)\r'
	sleep 1
	echo -ne '#############             (66%)\r'
	sleep 1
	echo -ne '#######################   (100%)\r'
	echo -ne '\n'


fi
}
clear_logs

echo ""
echo "Checking the disk space..."

sleep 1

echo ""
df -h /

echo ""
sleep 1

echo "Executing security tests with Lynis..."

if ! command -v lynis &> /dev/null; then
	echo "Lynis is not installed, do you want to install now? [Y/n]"
	read continue_option2

	if [[ $continue_option2 = "Y" && $continue_option2 = "y" ]]; then
		sudo apt install lynis | sudo lynis audit system
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
echo "This script now will list all installed packages, do you want to continue?[Y/n]"
read continue_variable

if [[ $continue_variable == "Y" || $continue_variable == "y" ]]; then
	echo "Listing all the installed packages (only not-default packages), if there is a package with no usage, its recommended to remove it."
	echo ""
	sleep 1

	apt list --installed
fi
sleep 1


echo ""
echo -e "\e[1;33mOtimization sucessed, its recommended to check old passwords and credentials.\e[0m"
echo -e "\e[1;33mSee you next month ...\e[0m"
echo -e "\e[1;33mBye\e[0m"
}

# ------------------------------------------------------------------------------

fedora_script () {
echo -e "\e[1;33mMaintenance routine script for\e[0m \e[1;34m$NAME.\e[0m"
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
echo "Do you want to update your system? [Y/n]"
read option1
if [[ $option1 == "Y" || $option1 == "y" ]]; then
  echo "Updating you system."
  sudo dnf update
fi
echo "Do you want to remove unsused dependencies? (Be careful, this may remove some packages you use)"
read option2
if [[ $option2 == "Y" || $option2 == "y" ]]; then
  echo "Removindo unwanted packages..."
  sudo dnf autoremove
fi
echo ""

echo "Cleaning logs."
clear_logs() {
echo "Up to how many days do you want to clean?"
echo "Write a number: [0-30]"
read cleaning_days_number

if [[ $cleaning_days_number > 30 || $cleaning_days_number < 0 ]]; then
	echo "number out of ranges!"
	clear_logs
else
	sudo journalctl --vacuum-time=${cleaning_days_number}d

	echo -ne '#####                     (33%)\r'
	sleep 1
	echo -ne '#############             (66%)\r'
	sleep 1
	echo -ne '#######################   (100%)\r'
	echo -ne '\n'


fi
}
clear_logs

echo ""
echo "Checking the disk space..."

sleep 1

echo ""
df -h /

echo ""
sleep 1

echo "Executing security tests with Lynis..."

if ! command -v lynis &> /dev/null; then
	echo "Lynis is not installed, do you want to install now? [Y/n]"
	read continue_option2

	if [[ $continue_option2 = "Y" && $continue_option2 = "y" ]]; then
		sudo dnf install lynis | sudo lynis audit system
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
echo "This script now will list all installed packages, do you want to continue?[Y/n]"
read continue_variable

if [[ $continue_variable == "Y" || $continue_variable == "y" ]]; then
	echo "Listing all the installed packages (only not-default packages), if there is a package with no usage, its recommended to remove it."
	echo ""
	sleep 1

	apt list installed
fi
sleep 1


echo ""
echo -e "\e[1;33mOtimization sucessed, its recommended to check old passwords and credentials.\e[0m"
echo -e "\e[1;33mSee you next month ...\e[0m"
echo -e "\e[1;33mBye\e[0m"
}

echo -e "\e[1;33m _     _                                                   \n \
| |   (_)_ __  _   ___  __                                  \n \
| |   | | '_\\| | | \\ \\/ /                                  \n \
| |___| | | | | |_|  |>  <                                   \n \
|_____|_|_| |_|\\___/_/\\_\\     _                            \n \
|  \\/  | __ _(_)_ __ | |_ __ _(_)_ __   ___ _ __   ___ ___ \n \
| |\\/| |/ _ | | _ \\| __/ _ | | _ \\ / _ \\ _ \\ / __/ _ \\ \n \
| |   | | (_| | | | | | || (_| | | | | |  __/ | | | (_|  __/ \n \
|_|   |_|\\__,_|_|_| |_|\\__\\__,_|_|_| |_|\\___|_| |_|\\___\\___| \e[0m"

echo "Detecting whats your Linux distro..."
echo -ne '#####                     (33%)\r'
sleep 1
echo -ne '#############             (66%)\r'
sleep 1
echo -ne '#######################   (100%)\r'
echo -ne '\n'

if [ -f /etc/os-release ]; then
	. /etc/os-release
	echo "Distro found: $NAME"
	if [[ $ID = "arch" || $ID = "manjaro" ]]; then
		arch_linux_script
	elif [[ $ID = "debian" || $ID = "ubuntu" || $ID = "mint" ]]; then
		debian_script
	elif [[ $ID = "fedora" || $ID = "rhel" ]]; then
		fedora_script
	else
		echo "Sorry, this script does not support your Distro, this will be fixed soon."
	fi

	
else
	echo "Distro not found."
fi

echo ""
