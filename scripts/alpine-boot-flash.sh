#!/bin/bash

ALPINE_TYPE=alpine-extended
ALPINE_ARCH=x86_64
ALPINE_RELEASES_URL=https://dl-cdn.alpinelinux.org/alpine/latest-stable/releases

LATEST_ISO_NAME=$(curl $ALPINE_RELEASES_URL/$ALPINE_ARCH/latest-releases.yaml | grep -o "$ALPINE_TYPE-.*-$ALPINE_ARCH.iso" | head -n -1)

wget --no-check-certificate -O $LATEST_ISO_NAME $ALPINE_RELEASES_URL/$ALPINE_ARCH/$LATEST_ISO_NAME

sudo apt install -f unetbootin
sudo unetbootin installtype=USB method=diskimage isofile="$PWD/$LATEST_ISO_NAME"
