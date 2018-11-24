#!/bin/bash

# This script will copy over the php files from a latest /opt/lampp/bin, installed for versioning of php

LAMPP_VERSION=$1
LAMPP_UPDATE=$2

PHPBIN="/opt/lampp"$LAMPP_UPDATE

PHPCPY=$PHPBIN"/bin"
MODCPY=$PHPBIN"/modules"

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

LIBPHP4SO="/opt/lampp/modules/libphp4.so"
LIBPHP5SO="/opt/lampp/modules/libphp5.so"
LIBPHP7SO="/opt/lampp/modules/libphp7.so"

MODCPY4SO=$MODCPY"/libphp4.so"
MODCPY5SO=$MODCPY"/libphp5.so"
MODCPY7SO=$MODCPY"/libphp7.so"

if [[ -f "$MODCPY4SO" || -f "$MODCPY5SO" || -f "$MODCPY7SO" ]]
	then
echo "script found module, backing up existing "
sudo cp $MODCPY4SO $MODCPY"/libphp4.so_" -rf
sudo cp $MODCPY5SO $MODCPY"/libphp5.so_" -rf
sudo cp $MODCPY7SO $MODCPY"/libphp7.so_" -rf
echo "script copying module, versioning now "
sudo cp $LIBPHP4SO $MODCPY -rf
sudo cp $LIBPHP5SO $MODCPY -rf
sudo cp $LIBPHP7SO $MODCPY -rf
echo "script finished module, backup, copy"
echo "no changes to /opt/lampp/etc/extra/"
echo " httpd-xampp.conf (add LoadModule"
echo " php#_module modules/libphp#.so )"
	else
echo "script found missing or no module for php 4,5, or 7, error?"
	exit 1
fi

echo "Files copied successfully, no i/o errors,  Done..."
exit 0

