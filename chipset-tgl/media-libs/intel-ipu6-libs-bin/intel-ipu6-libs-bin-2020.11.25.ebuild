# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Intel IPU6 library binaries required by the Intel camera HAL"
SRC_URI="gs://chromeos-localmirror/distfiles/intel-ipu6-libs-bin-${PV}.tbz2"

LICENSE="BSD-Intel+patent-grant"
SLOT="0"
KEYWORDS="-* amd64"

S="${WORKDIR}"

src_install() {
	dolib.so usr/"$(get_libdir)"/*.so
	dolib.a usr/"$(get_libdir)"/*.a

	insinto /usr/"$(get_libdir)"/pkgconfig
	doins usr/"$(get_libdir)"/pkgconfig/*.pc
}
