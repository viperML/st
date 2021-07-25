#!/bin/sh

echo "WARNING - This script may be broken as I no longer use Arch"

if cat /etc/os-release | grep -q "ID=arch"; then
    diff -b -u config.def.h config.theme.h > patches/00-theme.diff
    cat patches/00-theme.diff
    sudo pacman -Rns st-git --noconfirm
    git clean -dfX
    rm -rf src
    makepkg -sric --noconfirm
else
    echo "This script only works in Arch Linux"
fi
