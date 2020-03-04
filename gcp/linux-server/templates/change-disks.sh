#!/usr/bin/env bash
uuid=$(blkid -s UUID -o value ${device})
umount ${device}
grep -v "$uuid" /etc/fstab > /tmp/new-fstab
mv /tmp/new-fstab /etc/fstab
mount -a