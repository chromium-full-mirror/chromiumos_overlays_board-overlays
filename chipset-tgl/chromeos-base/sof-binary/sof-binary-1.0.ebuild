# Copyright 2018 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2.

EAPI=5

DESCRIPTION="Tiger Lake SOF firmware binary"
SRC_URI="gs://chromeos-localmirror/distfiles/${P}-tgl.tar.bz2"

LICENSE="SOF"
SLOT="0"
KEYWORDS="*"

S=${WORKDIR}/${P}-tgl

src_install() {
	insinto /lib/firmware/intel/sof
	doins sof-tgl.ri
	dodoc README
}
