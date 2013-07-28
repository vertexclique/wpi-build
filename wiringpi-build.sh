#!/usr/bin/env sh

if [ "$(id -u)" != "0" ]; then
   echo "Builder must be run as root. Exiting..." 1>&2
   exit 1
fi

git clone git://git.drogon.net/wiringPi

do_build(){
	echo "Select build type: " && echo "Static(s)" && echo "Dynamic(D) ?" && echo
	read r
	if [ $r = "D" ]; then
		echo "Wiring pi lib build starting..."
		echo "===================================="
		echo && echo
		cd wiringPi && ./build
	else
		if [ $r = "s" ]; then
			echo "Wiring pi lib build starting..."
			echo "===================================="
			echo && echo
			cd wiringPi && cd wiringPi
			make static
			sudo make install-static
		else
			do_build
		fi
	fi
}

do_build
	
if [ $? = 0 ]; then
	echo "Successfully installed."
else
	echo "An error occured during the installation."
fi
