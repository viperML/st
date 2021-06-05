#!/bin/sh
diff -u config.def.h config.theme.h > patches/00-theme.diff
cat patches/00-theme.diff
