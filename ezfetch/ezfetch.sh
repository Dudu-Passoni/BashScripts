#!/bin/bash

#@Author: Luis Eduardo Contini Passoni

BLUE_LIGHT="\033[1;36m"
RESET="\033[37m"
RED="\033[1;31m"
ORANGE="\033[38;5;208m"
LIGHT_GREEN="\033[1;92m"
BLUE="\033[1;34m"
PURPLE="\033[1;35m"


logo_display() {
if [ -f /etc/os-release ]; then
	. /etc/os-release
fi

case $ID in

	arch)
echo -e "${BLUE_LIGHT}      /\\"
echo -e "     /  \\"
echo -e "    /    \\"
echo -e "   /      \\"
echo -e "  /   ,,   \\"
echo -e " /   |  |   \\"
echo -e "/_-''    ''-_\\"
echo -e "${RESET}"
COR=${BLUE_LIGHT}
PACOTES=$(pacman -Q | wc -l)

		;;
	debian)
echo -e "${RED}  _____"
echo -e " /  __ \\"
echo -e "|  /    |"
echo -e "|  \\___-"
echo -e "-_"
echo -e "  --_"
echo -e "${RESET}"
COR=${RED}
PACOTES=$(dpkg -l | wc -l)
		;;
	ubuntu)
echo -e "${ORANGE}  ..;,; .,;,."
echo -e "    .,lool: .ooooo,"
echo -e "   ;oo;:    .coool."
echo -e " ....         ''' ,l;"
echo -e ":oooo,            'oo."
echo -e "looooc            :oo'"
echo -e " '::'             ,oo:"
echo -e "   ,.,       .... co,"
echo -e "    lo:;.   :oooo; ."
echo -e "     ':ooo; cooooc"
echo -e "        '''  ''''"
echo -e "${RESET}"
COR=${ORANGE}
PACOTES=$(dpkg -l | wc -l)
		;;
	mint)
echo -e "${LIGHT_GREEN} __________"
echo -e "|_          \\"
echo -e "  |   | _____   |"
echo -e "  |   | | | |   |"
echo -e "  |   | | | |   |"
echo -e "  |   \\_____/  |"
echo -e "  \\_________/"
echo -e "${RESET}"
COR=${LIGHT_GREEN}
PACOTES=$(dpkg -l | wc -l)
		;;
	fedora)
echo -e "${BLUE}   ,'''''."
echo -e "       |   ,.  |"
echo -e "       |  |  '_'"
echo -e "  ,....|  |.."
echo -e ".'  ,_;|   ..'"
echo -e "|  |   |  |"
echo -e "|  ',_,'  |"
echo -e " '.     ,'"
echo -e "   '''''"
echo -e "${RESET}"
COR=${BLUE}

if [[ $VERSION_ID == 22 || $VERSION_ID > 22 ]]; then
	PACOTES=$(dnf list installed | wc -l)
else
	PACOTES=$(yum list installed | wc -l)
fi
		;;
	rhel)
echo -e "${RED}            .MMM..:MMMMMMM"
echo -e "          MMMMMMMMMMMMMMMMMM"
echo -e "          MMMMMMMMMMMMMMMMMMMM."
echo -e "         MMMMMMMMMMMMMMMMMMMMMM"
echo -e "        ,MMMMMMMMMMMMMMMMMMMMMM:"
echo -e "        MMMMMMMMMMMMMMMMMMMMMMMM"
echo -e "  .MMMM'  MMMMMMMMMMMMMMMMMMMMMM"
echo -e " MMMMMM    \MMMMMMMMMMMMMMMMMMMM."
echo -e "MMMMMMMM      MMMMMMMMMMMMMMMMMM ."
echo -e "MMMMMMMMM.       \MMMMMMMMMMMMM' MM."
echo -e "MMMMMMMMMMM.                     MMMM"
echo -e "\MMMMMMMMMMMMM.                 ,MMMMM."
echo -e " \MMMMMMMMMMMMMMMMM.          ,MMMMMMMM."
echo -e "    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
echo -e "      MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM:"
echo -e "         MMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
echo -e "            \MMMMMMMMMMMMMMMMMMMMMMMM:"
echo -e "                \MMMMMMMMMMMMMMMMM"
echo -e "${RESET}"
if [[ $VERSION_ID == 8 || $VERSION_ID > 8 ]]; then
	PACOTES=$(dnf list installed | wc -l)
else
	PACOTES=$(yum list installed | wc -l)
fi
		;;
	centos)
echo -e "${PURPLE}____^____"
echo -e "|\  |  /|"
echo -e "| \ | / |"
echo -e "<-------->"
echo -e "| / | \ |"
echo -e "|/__|__\|"
echo -e "    v"
echo -e "${RESET}"
if [[ $VERSION_ID == 8 || $VERSION_ID > 8 ]]; then
	PACOTES=$(dnf list installed | wc -l)
else
	PACOTES=$(yum list installed | wc -l)
fi
		;;
esac
}

KERNEL_VERSION=$(uname -r)
UPTIME=$(uptime -p)
USER_NAME=$(whoami)
HOSTNAME=$(hostname)
SHELL_NAME=$(basename $SHELL)

logo_display
echo "$USER_NAME@$HOSTNAME"
echo -e "${COR}----------${RESET}o${COR}-----------${RESET}"
echo "OS: $NAME"
echo "Kernel version: $KERNEL_VERSION"
echo "Packages: $PACOTES"
echo "Shell: $SHELL_NAME"
echo "Terminal: $TERM"

