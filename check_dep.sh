#!/bin/bash

# @Author: Luis Eduardo Contini Passoni

RESET="\033[37m"
RED="\033[1;31m"
LIGHT_GREEN="\033[1;92m"
YELLOW="\033[1;33m"

echo -e "${YELLOW}Check_dep -> ${RESET}Verify which dependencies are missing on the package you want to install."

echo "Package to Search: "
read -e pacote

if [ -f /etc/os-release ]; then
	. /etc/os-release
fi

case $ID in

  debian | ubuntu)
for dep in $(apt-cache depends $pacote | grep "Depends:" | cut -d: -f2); do
  if dpkg -l "$dep" &>/dev/null; then
    echo -e "${LIGHT_GREEN}[INSTALADO]${RESET}  $dep"
  else
    echo -e "${RED}[FALTANTE]${RESET}  $dep"
  fi
done
  ;;
  arch)
    for dep in $(pactree -l "$PACOTE"); do
  if pacman -Q "$dep" &>/dev/null; then
    echo -e "${LIGHT_GREEN}[INSTALADO]${RESET}  $dep"
  else
    echo -e "${RED}[FALTANTE]${RESET}  $dep"
  fi
done
    ;;
esac
