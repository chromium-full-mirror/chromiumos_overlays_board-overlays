# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="MediaTek config files required by the MediaTek camera HAL"

LICENSE="LICENCE.mediatek"
SLOT="0"
KEYWORDS="-* arm arm64"

S="${WORKDIR}"

src_install() {
	local CONFIG_DIR="/etc/camera"
	insinto "${CONFIG_DIR}"
	doins "${FILESDIR}"/*
}
