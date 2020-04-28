# Copyright 2015 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit appid cros-audio-configs

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"
IUSE=""

# Add dependencies on other ebuilds from within this board overlay
RDEPEND="!<media-sound/adhd-0.0.6"
DEPEND="${RDEPEND}"

S="${WORKDIR}"

src_install() {
	doappid "{FF9048C6-F61C-BDDD-C861-4EDCAC22C55A}" "CHROMEBASE"

	# Install audio-config files
	local audio_config_dir="${FILESDIR}/audio-config"
	install_audio_configs monroe "${audio_config_dir}"
}
