#!/bin/bash

# This script will copy over the php files from a latest /opt/lampp/bin, installed for versioning of php

LAMPP_VERSION=$1
LAMPP_UPDATE=$2

PHPBIN="/opt/lampp"$LAMPP_UPDATE

PHPCPY=$PHPBIN"/bin"

PHPEXE="/opt/lampp/bin/php-"$LAMPP_VERSION
PHPCGI="/opt/lampp/bin/php-cgi-"$LAMPP_VERSION
PHPCFG="/opt/lampp/bin/php-config-"$LAMPP_VERSION
PHPIZE="/opt/lampp/bin/phpize-"$LAMPP_VERSION

if [[ -f "$PHPEXE" && -d "$PHPCPY" ]]
	then
echo "attempting php binary copy to "$PHPCPY
sudo cp $PHPEXE $PHPCPY -rf
	else
echo "input output error, exiting now"
	exit 1
fi

if [[ -f "$PHPCGI" && -d "$PHPCPY" ]]
	then
echo "attempting php cli copy to "$PHPCPY
sudo cp $PHPCGI $PHPCPY -rf
	else
echo "input output error, exiting now"
	exit 1
fi

if [[ -f "$PHPCFG" && -d "$PHPCPY" ]]
	then
echo "attempting php config copy to "$PHPCPY
sudo cp $PHPCFG $PHPCPY -rf
	else
echo "input output error, exiting now"
	exit 1
fi

if [[ -f "$PHPIZE" && -d "$PHPCPY" ]]
	then
echo "attempting phpize copy to "$PHPCPY
sudo cp $PHPIZE $PHPCPY -rf
	else
echo "input output error, exiting now"
	exit 1
fi

echo "Files copied successfully, no i/o errors,  Done..."
exit 0
