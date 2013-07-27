#!/usr/bin/env sh

if [ "$(id -u)" != "0" ]; then
   echo "Builder must be run as root. Exiting..." 1>&2
   exit 1
fi

echo "Wiring pi lib build starting..."
echo "===================================="
echo

git clone git://git.drogon.net/wiringPi
echo && echo
cd wiringPi && ./build

if [ $? == 0 ]; then
	echo "Successfully installed."
else
	echo "An error occured during the installation."
fi
