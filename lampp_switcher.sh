#!/bin/bash

# This script will switch existing symlinks to version param, but will not check to make sure files exist, use version number correctly with existing files to avoid broken symlinks

# Execute ./this/script/ 7.0.1 to remove all default symlinks linking to files existing in what should be master /opt/lampp/bin, after any new versions copied, after naming master back to original

# As an example of why the master is assumed using paths below, consider latest versions of form x.x.x to be numerically increasing, and ./lampp_copier.sh run against it directly after installation


# As a further advisement, this suggests that after updating PHP versioning using these two scripts, by example, master named to original sits at /opt/lampp, versions of the form /opt/lamppx but,


# As a further advisement, ./lampp_copier.sh expects these numerical increases, using form x of parameter 2 which can be of form x.x.x, so versions could/should be of form /opt/lampx.x.x by now

# et al this script was intended to be run from within that master /bin, using assumed paths below at /opt/lampp/bin for symlink removal, parameter of form x.x.x for files that should exist at version

LAMPP_VERSION=$1

PHPEXE="/opt/lampp/bin/php"
PHPCGI="/opt/lampp/bin/php-cgi"
PHPCFG="/opt/lampp/bin/php-config"
PHPIZE="/opt/lampp/bin/phpize"


if [[ -L "$PHPEXE" && -f "$PHPEXE" ]];
	then
echo "php binary symlink exists, switching to "$LAMPP_VERSION
sudo rm -f $PHPEXE
cd /opt/lampp/bin
sudo ln -s "php-$LAMPP_VERSION" "php"
	else
echo "php binary symlink not found, and this script did not remove it, broken?"

echo "creating symlink anyway, will attempt removal, using "$LAMPP_VERSION

sudo rm -f $PHPEXE
cd /opt/lampp/bin
sudo ln -s "php-$LAMPP_VERSION" "php"

echo "created symlink anyway after existing at master /bin removed";

# For reference, this can happen, and be a net positive, improving sub sequently

	exit 1
fi

if [[ -L "$PHPCGI" && -f "$PHPCGI" ]];
	then
echo "php cli symlink exists, switching to "$LAMPP_VERSION
sudo rm -f $PHPCGI
cd /opt/lampp/bin
sudo ln -s "php-cgi-$LAMPP_VERSION" "php-cgi"
	else
echo "php cli symlink not found, and this script did not remove it, broken?"

echo "creating symlink anyway, will attempt removal, using "$LAMPP_VERSION

sudo rm -f $PHPCGI
cd /opt/lampp/bin
sudo ln -s "php-cgi-$LAMPP_VERSION" "php-cgi"

echo "created symlink anyway after existing at master /bin removed";

# For reference, this can happen, and be a net positive, improving sub sequently

	exit 1
fi

if [[ -L "$PHPCFG" && -f "$PHPCFG" ]];
	then
echo "php config symlink exists, switching to "$LAMPP_VERSION
sudo rm -f $PHPCFG
cd /opt/lampp/bin
sudo ln -s "php-config-$LAMPP_VERSION" "php-config"
	else
echo "php config symlink not found, and this script did not remove it"

echo "creating symlink anyway, will attempt removal, using "$LAMPP_VERSION

sudo rm -f $PHPCFG
cd /opt/lampp/bin
sudo ln -s "php-config-$LAMPP_VERSION" "php-config"

echo "created symlink anyway after existing at master /bin removed";

# For reference, this can happen, and be a net positive, improving sub sequently

	exit 1
fi

if [[ -L "$PHPIZE" && -f "$PHPIZE" ]];
	then
echo "phpize symlink exists, switching to "$LAMPP_VERSION
sudo rm -f $PHPIZE
cd /opt/lampp/bin
sudo ln -s "phpize-$LAMPP_VERSION" "phpize"
	else
echo "phpize symlink not found, and this script did not remove it"

echo "creating symlink anyway, will attempt removal, using "$LAMPP_VERSION

sudo rm -f $PHPIZE
cd /opt/lampp/bin
sudo ln -s "phpize-$LAMPP_VERSION" "phpize"

echo "created symlink anyway after existing at master /bin removed";

# For reference, this can happen, and be a net positive, improving sub sequently, and finally, as long as version files exist!

	exit 1
fi

LIBPHP4SO="/opt/lampp/modules/libphp4.so"
LIBPHP5SO="/opt/lampp/modules/libphp5.so"
LIBPHP7SO="/opt/lampp/modules/libphp7.so"

if [[ -f "$LIBPHP4SO" || -f "$LIBPHP5SO" || -f "$LIBPHP7SO" ]]
	then
echo "script found module, switching to "$LAMPP_VERSION
echo "may require changes to /opt/lampp/etc/extra/ conf"
echo "use the single digit php module at "$LAMPP_VERSION
echo " httpd-xampp.conf (add LoadModule"
echo " php#_module modules/libphp#.so ) "
	else
echo "script found missing or no module for php 4,5, or 7, error?"
	exit 1
fi

echo "All symlinks updated to version $LAMPP_VERSION, no i/o errors,  Done..."
exit 0



