#!/bin/bash

# Set up the environment
dbus-uuidgen > /var/lib/dbus/machine-id
dpkg-divert --local --rename --add /sbin/initctl
ln -s /bin/true /sbin/initctl
mount -t proc none /proc
mount -t sysfs none /sys
mount -t devpts none /dev/pts
export HOME=/root
export LC_ALL=C
KERNEL=$(ls -Art /lib/modules | tail -n 1)
mv "/boot/initrd.fromiso" "/boot/initrd.img-$KERNEL"
mv "/boot/vmlinuz.fromiso" "/boot/vmlinuz-$KERNEL"
cd /build/

# Remve GNOME stuff
sudo apt-get purge -y adwaita-icon-theme gedit-common gir1.2-gdm-1.0 \
gir1.2-gnomebluetooth-1.0 gir1.2-gnomedesktop-3.0 gir1.2-goa-1.0 \
gnome-accessibility-themes gnome-bluetooth gnome-calculator gnome-calendar \
gnome-characters gnome-control-center gnome-control-center-data \
gnome-control-center-faces gnome-desktop3-data \
gnome-font-viewer gnome-getting-started-docs gnome-getting-started-docs-ru \
gnome-initial-setup gnome-keyring gnome-keyring-pkcs11 gnome-logs \
gnome-mahjongg gnome-menus gnome-mines gnome-online-accounts \
gnome-power-manager gnome-screenshot gnome-session-bin gnome-session-canberra \
gnome-session-common gnome-settings-daemon gnome-settings-daemon-common \
gnome-shell gnome-shell-common gnome-shell-extension-appindicator \
gnome-shell-extension-desktop-icons gnome-shell-extension-ubuntu-dock \
gnome-startup-applications gnome-sudoku gnome-system-monitor gnome-terminal \
gnome-terminal-data gnome-themes-extra gnome-themes-extra-data gnome-todo \
gnome-todo-common gnome-user-docs gnome-user-docs-ru gnome-video-effects \
language-pack-gnome-en language-pack-gnome-en-base language-pack-gnome-ru \
language-pack-gnome-ru-base language-selector-gnome libgail18 libgail18 \
libgail-common libgail-common libgnome-autoar-0-0 libgnome-bluetooth13 \
libgnome-desktop-3-19 libgnome-games-support-1-3 libgnome-games-support-common \
libgnomekbd8 libgnomekbd-common libgnome-menu-3-0 libgnome-todo libgoa-1.0-0b \
libgoa-1.0-common libpam-gnome-keyring libsoup-gnome2.4-1 libsoup-gnome2.4-1 \
nautilus-extension-gnome-terminal pinentry-gnome3 yaru-theme-gnome-shell

# Run the remix script
bash remix.sh

# Clean up
update-initramfs -k all -u
apt-get clean
rm -f /var/lib/apt/lists/*_Packages
rm -f /var/lib/apt/lists/*_Sources
rm -f /var/lib/apt/lists/*_Translation-*
rm -rf /tmp/* ~/.bash_history
echo -n > /etc/machine-id
rm -f /var/lib/dbus/machine-id
rm /sbin/initctl
dpkg-divert --rename --remove /sbin/initctl
umount /proc || umount -lf /proc
umount /sys
umount /dev/pts
