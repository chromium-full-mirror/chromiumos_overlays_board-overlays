# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2
EAPI=7

inherit appid cros-unibuild cros-workon

# This ebuild only cares about its own FILESDIR and ebuild file, so it tracks
# the canonical empty project.
CROS_WORKON_PROJECT="chromiumos/infra/build/empty-project"
CROS_WORKON_LOCALNAME="empty-project"

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* ~arm64 ~arm"
IUSE=""

RDEPEND="
	chromeos-base/chromeos-bsp-baseboard-trogdor
"
DEPEND="${RDEPEND}"

src_install() {
	doappid "{9023C063-08D6-4A4F-908C-BCF97DE8BA69}" "CHROMEBOOK"

	# Install audio config
	unibuild_install_files audio-files
}
