#!/bin/sh

export PKG_CONFIG_PATH="$(opam config var prefix)/lib/pkgconfig"

# Bridge through $XEN_CFLAGS from the environment into Oasis' world.
#
XEN_CFLAGS="disabled"
grep -q '^xen="true"' setup.data && XEN_CFLAGS="$(pkg-config --static mirage-xen --cflags)"
echo "XEN_CFLAGS=\"${XEN_CFLAGS}\"" >> setup.data

# Bridge through $FREESTANDING_CFLAGS from the environment into Oasis' world.
#
FREESTANDING_CFLAGS="disabled"
grep -q '^freestanding="true"' setup.data && FREESTANDING_CFLAGS="$(pkg-config --static mirage-solo5 --cflags)"
echo "FREESTANDING_CFLAGS=\"${FREESTANDING_CFLAGS}\"" >> setup.data
