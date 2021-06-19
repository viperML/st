# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Static_Rocket
# Contributor: Jose Riha <jose1711 gmail com>
# Contributor: Sebastian J. Bronner <waschtl@sbronner.com>
# Contributor: Patrick Jackson <PatrickSJackson gmail com>
# Contributor: Christoph Vigano <mail@cvigano.de>
groups=('modified')
pkgname=st-git
pkgver=0.8.4.r4.g4536f46
pkgrel=1
pkgdesc='A simple virtual terminal emulator for X.'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=('libxft-bgra' 'lib32-libxft-bgra')
makedepends=('ncurses' 'libxext' 'git')
provides=(st)
conflicts=(st)
url=https://st.suckless.org
source=(git://git.suckless.org/st
	README.terminfo.rst)
sha256sums=('SKIP'
            '0ebcbba881832adf9c98ce9fe7667c851d3cc3345077cb8ebe32702698665be2')
_gitname="st"	    
_sourcedir="$_gitname"
_makeopts="--directory=$_sourcedir"
_gitdir=${pkgname%'-git'}
_startdir=$PWD

pkgver() {
    cd "${srcdir}/st"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cp $BUILDDIR/patches/* $_sourcedir
  cd $_sourcedir
  for patch in *.diff; do
      echo "Applying patch $patch"
      patch -s -i "$patch"
  done;
}

build() {
  make $_makeopts X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  local installopts='--mode 0644 -D --target-directory'
  local shrdir="$pkgdir/usr/share"
  local licdir="$shrdir/licenses/$pkgname"
  local docdir="$shrdir/doc/$pkgname"
  make $_makeopts PREFIX=/usr DESTDIR="$pkgdir" install
  install $installopts "$licdir" "$_sourcedir/LICENSE"
  install $installopts "$docdir" "$_sourcedir/README"
  install $installopts "$docdir" README.terminfo.rst
  install $installopts "$shrdir/$pkgname" "$_sourcedir/st.info"
}
