# Copyright 2016 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit arc-build-constants

DESCRIPTION="Install codec configuration for ARC++"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"
IUSE="android-container-nyc"
S="${WORKDIR}"
RDEPEND="!chromeos-base/arc-codec-software"

src_install() {
	arc-build-constants-configure
	insinto "${ARC_CONTAINER_VENDOR_DIR}/etc"

	if use android-container-nyc; then
		ARC_CODEC_DIR="${FILESDIR}/nyc"
	else
		# Adopt for pic and future desserts
		ARC_CODEC_DIR="${FILESDIR}/pic"
	fi

	doins "${ARC_CODEC_DIR}"/*
}
