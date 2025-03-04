#!/bin/sh

umount /dev/sda1

mkfs.ext4 /dev/sda1

mount /dev/sda1 /media/hdd