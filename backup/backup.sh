#!/bin/bash
# Backup Script 1.1
# Changelog:
# 1.2 - Fixed calls to DBus/Sway sockets under root (I think...)
# 1.1 - Configured exclusively for Wayland/Sway.
#     - Condensed much of the restic command into a smaller footprint
# 1.0 - Initial creation/implementation for Xorg/i3
# Ran via backup.service & backup.timer

# To-do: Define UID as a variable.

shopt -s extglob
KERNEL_VERSION=$(uname -r | sed -E 's/....[0-9]-[0-9]//g')
SOCK_DIR="/run/user/1000"
SUFFIXES='@(sock)'

export XDG_CACHE_HOME=/root/.cache

sudo -u \#1000 DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=$SOCK_DIR/bus notify-send -a "<u><b>Restic</b></u>" "Weekly Backup" "Starting backup now for Arch Linux $KERNEL_VERSION"

# Turn off swayidle (Wayland)

pkill swayidle

# Begin backup

restic -r sftp:backupServer:/Linux/PC unlock -p /root/.restic

restic -r sftp:backupServer:/Linux/PC backup \
  --one-file-system \
  --exclude-file '/root/.restic_exclude' \
  --tag "Weekly Backup" \
  --tag "Arch Linux $KERNEL_VERSION" -p /root/.restic / /home &> /var/log/restic.log

if [ $? -eq 0 ]; then
	  sudo -u \#1000 DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=$SOCK_DIR/bus notify-send -a "<u><b>Restic</b></u>" "Weekly Backup" "Backup was successful!"
	  echo "Latest backup was successful!"
	  sleep 20
	  /root/prune.sh
	  sudo -u \#1000 DISPLAY=:0 SWAYSOCK="$SOCK_DIR/sway-ipc."*.$SUFFIXES swaymsg "exec /home/rickie/.config/sway/idle/run.sh"
	  exit 0
else
	  sudo -u \#1000 DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=$SOCK_DIR/bus notify-send -a "<u><b>Restic</b></u>" "Weekly Backup" "Backup has failed. Please check the logs for more details."
	  echo "Latest backup failed! Please check the logs."
	  sudo -u \#1000 DISPLAY=:0 SWAYSOCK="$SOCK_DIR/sway-ipc."*.$SUFFIXES swaymsg "exec /home/rickie/.config/sway/idle/run.sh"
	  exit 1
fi
