# Copyright 2018 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit appid cros-unibuild

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE="hatch-diskswap"
S="${WORKDIR}"

# Add dependencies on other ebuilds from within this board overlay
RDEPEND="
	chromeos-base/sof-binary
	chromeos-base/sof-topology
	chromeos-base/chromeos-bsp-baseboard-hatch
"
DEPEND="
	${RDEPEND}
	chromeos-base/chromeos-config
"

src_install() {
	if use hatch-diskswap; then
		doappid "{6FBDA804-5618-89BA-5D6E-F3804BDE0EF3}" "CHROMEBOOK"
	else
		doappid "{95EE134E-B47F-43FB-9835-32C276865F9A}" "CHROMEBOOK"
	fi

	unibuild_install_audio_files

	# Install Bluetooth ID override
	insinto /etc/bluetooth
	doins "${FILESDIR}"/main.conf
}
