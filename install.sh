#!/bin/bash
NAME="stdplgin"
LNAME="cockpit-$NAME"
USRDIR="/usr"
CKPTDIR="share/cockpit"
USRLOC="$USRDIR/$CKPTDIR/$NAME"


if [ "$EUID" -ne 0 ]
then
	echo "Please execute as root ('sudo install.sh' or 'sudo make install')"
	exit
fi

if [ "$1" == "-u" ] || [ "$1" == "-U" ]
then
	echo "$LNAME uninstall script"

    echo "Removing files"
	if [ -d "$USRLOC" ]; then
        rm -rf "$USRLOC"
    fi

elif [ "$1" == "-h" ] || [ "$1" == "-H" ]
then
	echo "Usage:"
	echo "  <no argument>: install $NAME"
	echo "  -u/ -U       : uninstall $NAME"
	echo "  -h/ -H       : this help file"
else
	echo "$LNAME install script"
    
    if [ ! -d "$USRLOC" ]; then
        mkdir "$USRLOC"
    fi
    cp "$NAME/"* "$USRLOC/"

    echo "Installation complete"
fi
