# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2.

EAPI=7

DESCRIPTION="Jasper Lake Image Processing Unit firmware binary"
SRC_URI="gs://chromeos-localmirror/distfiles/intel-ipu6se-firmware-${PV}.tbz2"

LICENSE="BSD-Intel+patent-grant"
SLOT="0"
KEYWORDS="-* amd64"

S="${WORKDIR}"

FW_FILE_NAME="ipu6se_fw_20201008.bin"
FW_FILE_PATH="/lib/firmware/intel"

src_install() {
	insinto "${FW_FILE_PATH}"
	doins "${FW_FILE_NAME}"
	dosym "${FW_FILE_NAME}" "${FW_FILE_PATH}"/ipu6se_fw.bin
}
