#!/bin/sh
diff -u config.def.h config.theme.h > patches/00-theme.diff
cat patches/00-theme.diff
sudo pacman -Rns st-git --noconfirm
git clean -dfX
rm -rf src
makepkg -sric --noconfirm
