# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="ADLCS35l41 DSM firmware and tuning files"
SRC_URI="
gs://chromeos-localmirror/distfiles/dsm-param-vell-1.0.tar.bz2
"

LICENSE="LICENSE.dsm"
SLOT="0"
KEYWORDS="-* x86 amd64"

S="${WORKDIR}"

src_install() {
	insinto /lib/firmware/cirrus

	# The TL, TR speakers share a same calibration value
	doins cs35l41-dsp1-spk-cali-TL.bin
	dosym ./cs35l41-dsp1-spk-cali-TL.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-TR.bin

	# The WL, WR speakers share a same calibration value
	doins cs35l41-dsp1-spk-cali-WL.bin
	dosym ./cs35l41-dsp1-spk-cali-WL.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-WR.bin

	# TL TR share protect firmware
	doins cs35l41-dsp1-spk-prot-TL.bin
	dosym ./cs35l41-dsp1-spk-prot-TL.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-TR.bin

	# WL WR share protect firmware
	doins cs35l41-dsp1-spk-prot-WL.bin
	dosym ./cs35l41-dsp1-spk-prot-WL.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-WR.bin

	doins cs35l41-dsp1-spk-cali-TL.wmfw
	# All speakers share the same extended firmware file (.wmfw)
	dosym ./cs35l41-dsp1-spk-cali-TL.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-TR.wmfw
	dosym ./cs35l41-dsp1-spk-cali-TL.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-WL.wmfw
	dosym ./cs35l41-dsp1-spk-cali-TL.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-WR.wmfw
	dosym ./cs35l41-dsp1-spk-cali-TL.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-TL.wmfw
	dosym ./cs35l41-dsp1-spk-cali-TL.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-TR.wmfw
	dosym ./cs35l41-dsp1-spk-cali-TL.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-WL.wmfw
	dosym ./cs35l41-dsp1-spk-cali-TL.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-WR.wmfw
}
