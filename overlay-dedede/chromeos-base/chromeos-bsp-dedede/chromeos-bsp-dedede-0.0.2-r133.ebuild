# Copyright 2019-2020 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=7

CROS_WORKON_COMMIT="e8d0ce9c4326f0e57235f1acead1fcbc1ba2d0b9"
CROS_WORKON_TREE="f365214c3256d3259d78a5f4516923c79940b702"
inherit appid cros-unibuild cros-workon udev

# This ebuild only cares about its own FILESDIR and ebuild file, so it tracks
# the canonical empty project.
CROS_WORKON_PROJECT="chromiumos/infra/build/empty-project"
CROS_WORKON_LOCALNAME="platform/empty-project"

DESCRIPTION="dedede board-specific ebuild that pulls in necessary ebuilds as
dependencies or portage actions."

LICENSE="BSD-Google"
KEYWORDS="-* amd64 x86"
IUSE=""

RDEPEND="
	chromeos-base/sof-binary
	chromeos-base/sof-topology
	chromeos-base/touch_updater
"
DEPEND="${RDEPEND}
	chromeos-base/chromeos-config:=
"

src_install() {
	doappid "{E0DD1258-E890-493E-ADA3-0C755240B89C}" "CHROMEBOOK"

	# Install audio config files
	unibuild_install_files audio-files

	# Install the WP script for older revs that can't take a RO FW update.
	insinto /etc/init
	doins "${FILESDIR}/common/dedede-force-wp.conf"

	udev_dorules "${FILESDIR}"/boten/udev/*.rules
	udev_dorules "${FILESDIR}"/storo/udev/*.rules
	udev_dorules "${FILESDIR}"/bugzzy/udev/*.rules
}
