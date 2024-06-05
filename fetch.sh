#! /usr/bin/bash

echo "User:" $USER
echo "Shell:" $SHELL
echo "Distro:"
head --lines=2 /etc/os-release
echo "CPU Model:"
lscpu | grep "Model name"
