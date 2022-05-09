# Copyright 2022 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=7

CROS_WORKON_COMMIT="e8d0ce9c4326f0e57235f1acead1fcbc1ba2d0b9"
CROS_WORKON_TREE="f365214c3256d3259d78a5f4516923c79940b702"
inherit appid cros-unibuild cros-workon

# This ebuild only cares about its own FILESDIR and ebuild file, so it tracks
# the canonical empty project.
CROS_WORKON_PROJECT="chromiumos/infra/build/empty-project"
CROS_WORKON_LOCALNAME="platform/empty-project"

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* arm64 arm"
IUSE=""

# Add dependencies on other ebuilds from within this board overlay
RDEPEND="
	chromeos-base/chromeos-bsp-baseboard-cherry
	chromeos-base/sof-binary
	media-sound/sound_card_init
"
DEPEND="
	${RDEPEND}
	chromeos-base/chromeos-config
"

src_install() {
	doappid "{8A1DABC9-8669-49CE-8CDD-29939FD55A41}" "CHROMEBASE"

	# Install audio config files
	unibuild_install_files audio-files
}
