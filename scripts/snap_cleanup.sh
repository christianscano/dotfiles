#!/bin/bash
#
#  ____                       ____ _
# / ___| _ __   __ _ _ __    / ___| | ___  __ _ _ __  _   _ _ __
# \___ \| '_ \ / _` | '_ \  | |   | |/ _ \/ _` | '_ \| | | | '_ \
#  ___) | | | | (_| | |_) | | |___| |  __/ (_| | | | | |_| | |_) |
# |____/|_| |_|\__,_| .__/   \____|_|\___|\__,_|_| |_|\__,_| .__/
#                   |_|                                    |_|
#
# ------------------------------------------------------
# Removes old revisions of snaps
# ------------------------------------------------------

sleep 1
clear
figlet "Snap Cleanup"

set -eu

snap list --all | awk '/disabled/{print $1, $3}' |
  while read -r snapname revision; do
    snap remove "$snapname" --revision="$revision"
  done
