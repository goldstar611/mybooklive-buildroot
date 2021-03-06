#!/bin/sh
# post-build.sh for MyBookLive taken from CubieBoard's post-build.sh
# 2013, Carlo Caione <carlo.caione@gmail.com>

BOARD_DIR="$(dirname $0)"
MKIMAGE=$HOST_DIR/usr/bin/mkimage
BOOT_CMD=$BOARD_DIR/boot.cmd
BOOT_CMD_H=$BINARIES_DIR/boot.scr

# U-Boot script
$MKIMAGE -C none -A powerpc -T script -a 0 -e 0 -n 'Execute uImage' -d $BOOT_CMD $BOOT_CMD_H
# Copy U-Boot script to rootfs
if [ -d "$TARGET_DIR/boot" ]; then
  cp $BOOT_CMD_H $TARGET_DIR/boot/boot.scr
fi
