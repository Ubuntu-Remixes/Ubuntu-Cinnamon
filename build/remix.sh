#!/bin/sh

add-apt-repository -y --no-update universe
add-apt-repository -y multiverse

add-apt-repository -y ppa:ubuntucinnamonremix/all

apt-get install -y casper expect gparted ubuntucinnamon-desktop \
 cifs-utils language-pack-en language-pack-gnome-en \
 xfsprogs jfsutils reiserfsprogs shim-signed shim ntfs-3g lvm2 \
 dmraid wamerican fwupdate mokutil ubuntu-settings \
 zram-tools ubiquity ubiquity-slideshow-ubuntu ubiquity-frontend-gtk

apt-get install -y gnome-shell --no-install-recommends && apt-get purge -y gnome-session ubuntu-session unity-greeter

cat > /usr/share/glib-2.0/schemas/90_ubuntucinnamon-wallpaper.gschema.override <<EOF
[org.gnome.desktop.background]
picture-uri='file:///usr/share/backgrounds/ubuntucinnamon/jammy/ubuntu_cinnamon_jammy_jellyfish.jpg'
EOF

apt-get install -y gdm3 metacity xfwm4

apt-get install -y plymouth-theme-ubuntucinnamon-spinner

glib-compile-schemas /usr/share/glib-2.0/schemas/

apt-get purge -y budgie-core --auto-remove

apt-get -y autoremove
apt-get -y clean
apt-get -y autoclean
