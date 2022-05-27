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
SLOT="0"
KEYWORDS="-* arm64 arm"
IUSE=""

RDEPEND="
	chromeos-base/chromeos-bsp-baseboard-herobrine
"
DEPEND="
	${RDEPEND}
	chromeos-base/chromeos-config:=
"

src_install() {
	doappid "{C5ED9176-A346-217C-DE59-1896036F7C8A}" "CHROMEBOOK"

	# Install audio config files
	unibuild_install_files audio-files
}
