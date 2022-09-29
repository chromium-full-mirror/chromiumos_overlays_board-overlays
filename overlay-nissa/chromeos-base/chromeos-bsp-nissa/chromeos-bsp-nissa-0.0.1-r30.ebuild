# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# This ebuild only cares about its own FILESDIR and ebuild file, so it tracks
# the canonical empty project.
CROS_WORKON_COMMIT="d2d95e8af89939f893b1443135497c1f5572aebc"
CROS_WORKON_TREE="776139a53bc86333de8672a51ed7879e75909ac9"
CROS_WORKON_PROJECT="chromiumos/infra/build/empty-project"
CROS_WORKON_LOCALNAME="platform/empty-project"

inherit appid cros-unibuild cros-workon

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
KEYWORDS="* amd64 x86"
IUSE="adlnrvp bootimage zephyr_ec"

# Add dependencies on other ebuilds from within this board overlay
RDEPEND="
	chromeos-base/sof-binary:=
	chromeos-base/sof-topology:=
	chromeos-base/touch_updater:=
"
DEPEND="
	${RDEPEND}
	chromeos-base/chromeos-config:=
	bootimage? ( sys-boot/chromeos-bootimage:= )
	zephyr_ec? ( chromeos-base/chromeos-zephyr:= )
"

src_install() {
	if use adlnrvp; then
		doappid "{D60D81DB-751D-4EB6-AF86-8C073A6BBB91}" "REFERENCE"
	else
		doappid "{A5F9E181-D0BE-4D6D-B67D-125069233535}" "REFERENCE"
	fi
	# Install audio config files
	unibuild_install_files audio-files
}
