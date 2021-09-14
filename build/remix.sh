#!/bin/sh

add-apt-repository -y --no-update universe
add-apt-repository -y --no-update multiverse

add-apt-repository -y ppa:ubuntucinnamonremix/unstable

apt-get install -y casper expect gparted ubuntucinnamon-desktop \
 cifs-utils lupin-casper language-pack-en language-pack-gnome-en \
 xfsprogs jfsutils reiserfsprogs shim-signed shim ntfs-3g lvm2 \
 dmraid wamerican fwupdate mokutil \
 zram-config ubiquity ubiquity-slideshow-ubuntu ubiquity-frontend-gtk
