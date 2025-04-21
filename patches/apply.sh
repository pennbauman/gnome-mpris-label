#!/bin/sh
# Apply patches based on current gnome-shell version

if [ $# -eq 0 ]; then
	echo "Apply Patches Based on gnome-shell Version

Usage:
  $0 TARGET_DIRECTORY
"

	exit 1
fi
DIR="$1"
if [ ! -d "$DIR" ]; then
	echo "Directory '$DIR' missing"
	exit 1
fi

GNOME_VERSION="$(gnome-shell --version | awk -F'[ .]' '{print $3}')"

if [ "$GNOME_VERSION" -eq 45 ] || [ "$GNOME_VERSION" -eq 46 ]; then
	echo APPLY patches/gnome-45-46-compatibility.patch
	patch -s -V never -d "$DIR" < patches/gnome-45-46-compatibility.patch
elif [ "$GNOME_VERSION" -eq 43 ] || [ "$GNOME_VERSION" -eq 44 ]; then
	echo APPLY patches/gnome-43-44-compatibility.patch
	patch -s -V never -d "$DIR" < patches/gnome-43-44-compatibility.patch
elif [ "$GNOME_VERSION" -lt 43 ]; then
	echo "GNOME versions below 43 not supported"
	exit 1
fi

