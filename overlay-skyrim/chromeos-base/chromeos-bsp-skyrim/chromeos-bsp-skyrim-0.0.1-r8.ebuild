# Copyright 2021 The Chromium OS Authors. All rights reserved.
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
KEYWORDS="* amd64 x86"
IUSE="skyrim-chausie skyrim-kernelnext"

# Add dependencies on other ebuilds from within this board overlay
RDEPEND=""
DEPEND="
	${RDEPEND}
	chromeos-base/chromeos-config
"

src_install() {
	if use skyrim-chausie; then
		doappid "{DFBA47A4-988E-441D-A7C0-6FCA69C62878}" "CHROMEBOOK"
	elif use skyrim-kernelnext; then
		doappid "{EAAAC01D-3DBC-4F72-A2FF-9233F2838831}" "CHROMEBOOK"
	else
		doappid "{C5536B34-7D24-4CD3-8710-BD674185325B}" "REFERENCE"
	fi

	unibuild_install_files audio-files
}
