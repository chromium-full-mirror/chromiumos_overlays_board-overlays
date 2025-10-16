# Copyright 2025 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="MT8189 CS35L51G DSM firmware and tuning files"
SRC_URI="
gs://chromeos-localmirror/distfiles/dsm-param-padme-${PV}.tar.xz
"

LICENSE="LICENSE.dsm"
SLOT="0"
KEYWORDS="-* arm64 arm"

S="${WORKDIR}"

src_install() {
	insinto /lib/firmware/cirrus

	doins 10430000_250918_V0_A0.bin
	doins 10430000_250918_V0_A0_cal.bin
	doins 10430000_250918_V0_A1.bin
	doins 10430000_250918_V0_A1_cal.bin
	doins 10430000_250918_V0_A0.wmfw
	# All speakers share the same extended firmware file (.wmfw)
	dosym ./10430000_250918_V0_A0.wmfw /lib/firmware/cirrus/10430000_250918_V0_A1.wmfw
}
