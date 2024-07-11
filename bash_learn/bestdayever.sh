#!/bin/bash

name=$1 # Parametro
compliment=$2 

user=$(whoami)
whereami=$(pwd)     # Os parenteses são para garantir que a variavel armazene o resuldado do comando
date=$(date)

echo "Good Morning $name!"
sleep 1
echo "You're looking good today $name!!"
sleep 1

if [ -z "$name" ] && [ -z "$compliment" ]; then
	echo "I don't know you so well, but i'm sure your day will be amazing!!"
else
	echo "You have the best $compliment I've ever seen $name!!"
fi

sleep 2
echo "You are currently logged in as $user"
sleep 1
echo "and you are in the directory $whereami."
sleep 1
echo "Also today is $date"


sleep 1
echo "
Here is the weather for your current location" # Descobrir como fazer isso por IP!
curl wttr.in/poços+de+caldas

sleep 2

echo "
Here is your dad joke of the day "
sleep 1
curl -H "Accept: text/plain" https://icanhazdadjoke.com/; echo
