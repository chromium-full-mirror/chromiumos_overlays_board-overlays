# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit appid cros-unibuild udev

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* amd64 x86"
S="${WORKDIR}"
IUSE="volteer-kernelnext"

# Add dependencies on other ebuilds from within this board overlay
RDEPEND="
	chromeos-base/chromeos-bsp-baseboard-volteer
	chromeos-base/sof-binary
	chromeos-base/sof-topology
	!<chromeos-base/chromeos-bsp-volteer-private-0.0.2
	media-libs/ipu6-firmware
	chromeos-base/touch_updater
	media-sound/sound_card_init
"
DEPEND="
	${RDEPEND}
	chromeos-base/chromeos-config
"

src_install() {
	if use volteer-kernelnext; then
		doappid "{716105F8-A2C3-11EA-A044-33E3EAAD1A23}" "CHROMEBOOK"
	else
		doappid "{77BE25D7-AFB8-4E3C-A7D2-1FACE1B186E3}" "CHROMEBOOK"
	fi

	# Install platform-specific internal keyboard keymap.
	# It should probbaly go into /lib/udev/hwdb.d but
	# unfortunately udevadm on 64 bit boxes does not check
	# that directory (it wants to look in /lib64/udev).
	insinto "${EPREFIX}/etc/udev/hwdb.d"
	doins "${FILESDIR}/81-halvor-keyboard.hwdb"

	unibuild_install_files audio-files

	udev_dorules "${FILESDIR}"/udev/*.rules
}
