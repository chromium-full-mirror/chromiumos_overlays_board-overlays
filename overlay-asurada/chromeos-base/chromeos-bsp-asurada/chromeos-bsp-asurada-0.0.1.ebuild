# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=5

inherit appid cros-unibuild

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* arm64 arm"
IUSE=""
S="${WORKDIR}"

# Add dependencies on other ebuilds from within this board overlay
RDEPEND="
  chromeos-base/chromeos-config
  chromeos-base/chromeos-bsp-baseboard-asurada
"
DEPEND="${RDEPEND}"

src_install() {
	doappid "{08F65CC8-BCFB-414F-9B49-DAB2996D2E71}" "CHROMEBOOK"

	# Install audio config
	unibuild_install_files audio-files

	# Install DFD scripts
	dosbin "${FILESDIR}"/dump_dfd
	insinto /etc/init
	doins "${FILESDIR}"/dump_dfd.conf
}
