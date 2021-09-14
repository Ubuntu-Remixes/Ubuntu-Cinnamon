#!/bin/sh

add-apt-repository -y universe
add-apt-repository -y multiverse

apt-get install -y casper expect gparted calamares-settings-cinnamon-remix \
 cifs-utils lupin-casper language-pack-en language-pack-gnome-en \
 xfsprogs jfsutils reiserfsprogs shim-signed shim ntfs-3g lvm2 \
 dmraid wamerican fwupdate mokutil \
 qml-module-qtquick-dialogs qml-module-qtquick-controls \
 qml-module-qtquick-layouts qml-module-qtquick-window2 \
 zram-config ubiquity ubiquity-slideshow-ubuntu ubiquity-frontend-gtk
