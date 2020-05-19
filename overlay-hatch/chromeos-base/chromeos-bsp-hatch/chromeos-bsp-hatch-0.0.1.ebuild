# Copyright 2018 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit appid cros-unibuild

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE="hatch-diskswap hatch-kvm palkia hatch-kernelnext"
S="${WORKDIR}"

# Add dependencies on other ebuilds from within this board overlay
RDEPEND="
	chromeos-base/sof-binary
	chromeos-base/sof-topology
"
DEPEND="
	${RDEPEND}
	chromeos-base/chromeos-config
"

src_install() {
	if use hatch-diskswap; then
		doappid "{6FBDA804-5618-89BA-5D6E-F3804BDE0EF3}" "CHROMEBOOK"
	elif use palkia; then
		doappid "{107171EC-2166-414E-9F54-56515C0BE944}" "CHROMEBOOK"
	elif use hatch-kvm; then
		doappid "{4D5CCCEE-A214-4CFD-9A9F-85DFCF7A0CD4}" "CHROMEBOOK"
	elif use hatch-kernelnext; then
		doappid "{9DFA3334-7067-11EA-A862-83D15EF402B8}" "CHROMEBOOK"
	else
		doappid "{95EE134E-B47F-43FB-9835-32C276865F9A}" "CHROMEBOOK"
	fi

	unibuild_install_audio_files

	# Install Bluetooth ID override
	insinto /etc/bluetooth
	doins "${FILESDIR}"/main.conf

	# Install platform-specific internal keyboard keymap.
	# It should probbaly go into /lib/udev/hwdb.d but
	# unfortunately udevadm on 64 bit boxes does not check
	# that directory (it wants to look in /lib64/udev).
	insinto "${EPREFIX}/etc/udev/hwdb.d"
	doins "${FILESDIR}/jinlon/81-jinlon-keyboard.hwdb"
}
