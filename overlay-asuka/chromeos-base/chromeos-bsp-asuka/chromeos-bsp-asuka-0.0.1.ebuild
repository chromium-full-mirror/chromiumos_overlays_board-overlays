# Copyright 2016 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit appid cros-audio-configs
DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE="kernel-4_19"
S="${WORKDIR}"

# Add dependencies on other ebuilds from within this board overlay
RDEPEND="
	chromeos-base/chromeos-bsp-baseboard-kunimitsu
"
DEPEND="${RDEPEND}"

src_install() {
	doappid "{7B2FC5AC-894A-5702-D00E-62E999F0AE22}" "CHROMEBOOK"

	# Install platform specific config files for power_manager.
	insinto "/usr/share/power_manager/board_specific"
	doins "${FILESDIR}"/powerd_prefs/*

	# Install audio config files
	if use kernel-4_19; then
		local audio_config_dir="${FILESDIR}/kernelnext-audio-config"
	else
		local audio_config_dir="${FILESDIR}/audio-config"
	fi
	install_audio_configs asuka "${audio_config_dir}"
}
