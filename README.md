# st

This is my personal build of the suckless [simple terminal](https://st.suckless.org/), with automatic patching.

[](img/preview01.png)

## Arch Linux install

To customize the installation, you might want to:
- Edit `config.theme.h` to change colors, fonts, etc. Beware that it can break some patches.
- Add/Remove/Modify patches in the directory

You can run `ABS_cleaninstall.sh`, or read it and manually type every line. It will:

- Clean files from previous installations
- Create a diff patch from `config.theme.h` into the patches directory
- Pull st source
- Apply every patch in the directory into the st source
- Build and install

I may provide **pre-compiled binaries** in the releases tab of this repo

`pacman -U [binary package]`


## Other distributions
Some distro may have specific install instruction for building and packaging st.
You can follow those guides and then manually apply all the patches from the patches directory

```
#!/bin/bash
for patch in *.diff; do
    echo "Applying patch $patch"
    patch -s -i "$patch"
done;
```


## Attribution
Patches:
- [w3m](https://st.suckless.org/patches/w3m/)
- [desktopentry](https://st.suckless.org/patches/desktopentry/)
- [font2](https://st.suckless.org/patches/font2/)
- [alpha](https://st.suckless.org/patches/alpha/)
- [scrollback](https://st.suckless.org/patches/scrollback/)
- [ligatures](https://st.suckless.org/patches/ligatures/)
- [anysize](https://st.suckless.org/patches/anysize/)

[LICENSE](LICENSE)