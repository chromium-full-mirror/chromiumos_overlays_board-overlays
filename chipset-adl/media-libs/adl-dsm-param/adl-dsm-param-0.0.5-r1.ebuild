# Copyright 2018 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="tgl tuning DSM Param"
SRC_URI="gs://chromeos-localmirror/distfiles/adl-dsm-param-brya-${PV}.tar.bz2"

LICENSE="LICENSE.dsm"
SLOT="0"
KEYWORDS="-* x86 amd64"

S="${WORKDIR}"

src_install() {
	insinto /opt/google/dsm
	doins ./*.bin
}
