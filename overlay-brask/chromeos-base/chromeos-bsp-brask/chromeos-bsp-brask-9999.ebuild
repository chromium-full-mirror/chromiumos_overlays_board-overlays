# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# This ebuild only cares about its own FILESDIR and ebuild file, so it tracks
# the canonical empty project.
CROS_WORKON_PROJECT="chromiumos/infra/build/empty-project"
CROS_WORKON_LOCALNAME="platform/empty-project"

inherit appid cros-unibuild cros-workon udev

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
KEYWORDS="-* ~amd64 ~x86"
IUSE="brask-labstation"

# Add dependencies on other ebuilds from within this board overlay
RDEPEND="
	chromeos-base/chromeos-bsp-baseboard-brya:=
	chromeos-base/sof-binary:=
	chromeos-base/sof-topology:=
"
DEPEND="
	${RDEPEND}
	chromeos-base/chromeos-config:=
"

src_install() {
	if use brask-labstation; then
		doappid "{BB2F7FE3-BC46-4F46-8DA0-D50CDBAA4B20}" "CHROMEBOX"
	else
		doappid "{94144292-1100-4882-AC53-51E04BB29F9E}" "CHROMEBOX"
	fi

	# Install audio config files
	unibuild_install_files audio-files

	udev_dorules "${FILESDIR}/99-chromeos-brask-usb-nfc-beep.rules"

	exeinto "$(get_udevdir)"
	doexe "${FILESDIR}"/control_usb_nfc_beep.sh
}
