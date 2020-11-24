# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=7

inherit appid cros-unibuild

DESCRIPTION="dedede board-specific ebuild that pulls in necessary ebuilds as
dependencies or portage actions."

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
S="${WORKDIR}"

RDEPEND="
	chromeos-base/sof-binary
	chromeos-base/sof-topology
	media-libs/ipu6se-firmware
	chromeos-base/touch_updater
"
DEPEND="${RDEPEND}"

src_install() {
	doappid "{E0DD1258-E890-493E-ADA3-0C755240B89C}" "CHROMEBOOK"

	# Install audio config files
	unibuild_install_files audio-files

	# Install the WP script for older revs that can't take a RO FW update.
	insinto /etc/init
	doins "${FILESDIR}/common/dedede-force-wp.conf"
}
