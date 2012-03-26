#!/bin/sh
# Adds acl option to /

aclcount=$(grep -c acl /etc/fstab 2>&1)

if [ $aclcount -eq 0 ]; then
    cp /etc/fstab /etc/fstab.orig
    awk '$2~"^/$"{$4="acl,"$4}1' OFS="\t" /etc/fstab > /etc/fstab.tmp && mv /etc/fstab.tmp /etc/fstab
    mount -o remount /
else
    echo "String 'acl' found in /etc/fstab. No action taken."
fi
