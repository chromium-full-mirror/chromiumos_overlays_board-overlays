# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="ADLCS35l41 DSM firmware and tuning files"
SRC_URI="
gs://chromeos-localmirror/distfiles/dsm-param-vell-${PV}.tar.bz2
"

LICENSE="LICENSE.dsm"
SLOT="0"
KEYWORDS="-* x86 amd64"

S="${WORKDIR}"

src_install() {
	insinto /lib/firmware/cirrus

	# The TL, TR speakers share a same calibration value
	doins cs35l41-dsp1-spk-cali-tl.bin
	dosym ./cs35l41-dsp1-spk-cali-tl.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-tr.bin

	# The WL, WR speakers share a same calibration value
	doins cs35l41-dsp1-spk-cali-wl.bin
	dosym ./cs35l41-dsp1-spk-cali-wl.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-wr.bin

	# TL TR share protect firmware
	doins cs35l41-dsp1-spk-prot-tl.bin
	dosym ./cs35l41-dsp1-spk-prot-tl.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-tr.bin

	# WL WR share protect firmware
	doins cs35l41-dsp1-spk-prot-wl.bin
	dosym ./cs35l41-dsp1-spk-prot-wl.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-wr.bin

	doins cs35l41-dsp1-spk-cali-tl.wmfw
	# All speakers share the same extended firmware file (.wmfw)
	dosym ./cs35l41-dsp1-spk-cali-tl.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-tr.wmfw
	dosym ./cs35l41-dsp1-spk-cali-tl.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-wl.wmfw
	dosym ./cs35l41-dsp1-spk-cali-tl.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-wr.wmfw
	dosym ./cs35l41-dsp1-spk-cali-tl.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-tl.wmfw
	dosym ./cs35l41-dsp1-spk-cali-tl.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-tr.wmfw
	dosym ./cs35l41-dsp1-spk-cali-tl.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-wl.wmfw
	dosym ./cs35l41-dsp1-spk-cali-tl.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-wr.wmfw
}
