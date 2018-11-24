# Lampp-php-switcher
Lampp php versioning by installing Multiple Versions to pull binaries into master /opt/lampp/bin


# Begin by shutdown
End and (ie sudo killall httpd) shut down running Apache, Proftpd, and Mysql and xampp executable.

Example) owner@owner-PC:/opt/lampp$ sudo /opt/lampp/xampp stop
Stopping XAMPP for Linux 5.6.23-0...
XAMPP: Stopping Apache...ok.
XAMPP: Stopping MySQL...ok.
XAMPP: Stopping ProFTPD.../opt/lampp/xampp: line 308: kill: (12936) - No such process
fail.
kill returned 1.

# Name a master dir
Add version suffix by one digit or full x.x.x to a master /opt/lampp5 as in 5.2.63 

# Name a new install
Add new Lampp installations one at a time by default path /opt/lampp, stop after

Once you have a successful install (new php binaries) configure scripts below

# Using lampp_copier.sh
sudo chmod +x, use as "./script param param", by example, "sudo ./lampp_copier.sh 7.0.1 5"

The above example will copy php binary, php-cgi, php-config, phpize to dir /opt/lampp5/bin

The quite similar step copy php modules, is crudely handled at the end for update of conf (libphp#.so) with existing backed up to (libphp#.so_)

The conf change you may make upgrading or downgrading versions is the 1 manual step for a
module version
This can't be helped, could be done by the script, but is a one digit change to httpd-xampp
at /etc/extra

Verify your       LoadModule php#_module modules/libphp#.so
 version
 
# Using lampp_switcher.sh
sudo chmod +x, use as "./script param", by example, "sudo ./lampp_switcher.sh 7.0.1"

Do this ONLY after new install has been version labeled, by example, /opt/lampp7.0.1

Do this ONLY after the master install is named back to /opt/lampp by "sudo mv /path"

The above example will remove and recreate appropriate symlinks, then start xampp

As you normally would, by example "sudo /opt/lampp/xampp start" and enjoy version

# Final thoughts

There is a similar method of versioning on Github with a similar bash script of sorts
that attempts to symlink the default Lampp install directory path while new installs
are basically directly "version" named. I just didn't like this method, I like mine.
With the scripts I have created you only need worry about binary versions matching
and compatible with say, your web server, other web services, etc. of one primary and
the key here is, logged, web server. Sure install new versions at default paths "mv"
the master install temporarily copy new version binaries but don't finish up by sym
linking the whole default Lampp install. Use my scripts and version your binaries and
create, manage, and maintain an essentially supported and well documented and custom
Lampp stack.
