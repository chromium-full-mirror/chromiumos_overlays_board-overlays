# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# This ebuild only cares about its own FILESDIR and ebuild file, so it tracks
# the canonical empty project.
CROS_WORKON_COMMIT="e8d0ce9c4326f0e57235f1acead1fcbc1ba2d0b9"
CROS_WORKON_TREE="f365214c3256d3259d78a5f4516923c79940b702"
CROS_WORKON_PROJECT="chromiumos/infra/build/empty-project"
CROS_WORKON_LOCALNAME="platform/empty-project"

inherit appid cros-unibuild cros-workon

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
KEYWORDS="-* amd64 x86"
IUSE="brya-manatee adlrvp brya-lvm-stateful zephyr_poc brya-hibernate"

# Add dependencies on other ebuilds from within this board overlay
RDEPEND="
	chromeos-base/chromeos-bsp-baseboard-brya:=
	chromeos-base/sof-binary:=
	chromeos-base/sof-topology:=
	chromeos-base/touch_updater:=
	media-sound/sound_card_init:=
"
DEPEND="
	${RDEPEND}
	chromeos-base/chromeos-config:=
"

src_install() {
	if use brya-manatee; then
		doappid "{8C4F1DCA-AC34-11EB-8FD3-7B09B37DFAB3}" "REFERENCE"
	elif use adlrvp; then
		doappid "{CA89482B-8F28-4ED4-B4E0-14C3FB7FCDF3}" "REFERENCE"
	elif use brya-hibernate; then
		doappid "{A9D880C3-5FE1-4C7F-B948-9ACA87D3F484}" "REFERENCE"
	elif use brya-lvm-stateful; then
		doappid "{84BBC912-D9F5-4EF2-89B8-7AED7592AB49}" "REFERENCE"
	elif use zephyr_poc; then
		doappid "{4E43EBE7-CAE7-4AF7-A2EA-E37B2C3ECE32}" "REFERENCE"
	else
		doappid "{DEB6CEFD-4EEE-462F-AC21-52DF1E17B52F}" "REFERENCE"
	fi

	# Install audio config files
	unibuild_install_files audio-files

	# Override for chromeos-base/hpsd
	insinto /etc/init
	doins "${FILESDIR}/hpsd.override"

	# Install Upstart script to fix incorrect CBI values
	insinto /etc/init
	doins "${FILESDIR}/brya-cbi-override.conf"
}
