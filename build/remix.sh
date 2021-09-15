#!/bin/sh

add-apt-repository -y --no-update universe
add-apt-repository -y multiverse

add-apt-repository -y ppa:ubuntucinnamonremix/unstable

apt-get install -y casper expect gparted ubuntucinnamon-desktop \
 cifs-utils lupin-casper language-pack-en language-pack-gnome-en \
 xfsprogs jfsutils reiserfsprogs shim-signed shim ntfs-3g lvm2 \
 dmraid wamerican fwupdate mokutil \
 zram-config ubiquity ubiquity-slideshow-ubuntu ubiquity-frontend-gtk

apt-get purge -y unity-greeter

cat > /usr/share/glib-2.0/schemas/90_ubuntucinnamon-wallpaper.gschema.override <<EOF
[org.gnome.desktop.background]
picture-uri='file:///usr/share/backgrounds/ubuntucinnamon/Ubuntu_Cinnamon_Ubuntu.jpg'
EOF

glib-compile-schemas /usr/share/glib-2.0/schemas/
