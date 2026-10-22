# Copyright 2026 The ChromiumOS Authors
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=7

DESCRIPTION="Coreboot files for Rauru board"
KEYWORDS="~*"
LICENSE="BSD-Google"

# This ebuild only cares about its own FILESDIR and ebuild file, so it tracks
# the canonical empty project.
CROS_WORKON_PROJECT="chromiumos/infra/build/empty-project"
CROS_WORKON_LOCALNAME="../platform/empty-project"

# No need to inherit coreboot-private-files as there are no files in ${FILESDIR}
inherit cros-workon

# The PDC firmware used to be installed by the private
# coreboot-private-files-board ebuild. Block it so portage migrates the
# files to this package.
DEPEND="
	!sys-boot/coreboot-private-files-board
	chromeos-base/chromeos-config:=
	=sys-firmware/realtek-rts5453-GOOG0600-firmware-16.1.1
"
RDEPEND="${DEPEND}"

src_install() {
	(cros_config_host "get-firmware-build-combinations" depthcharge \
		|| die "Failed to run cros_config_host") |
	while read -r name && read -r depthcharge; do
		local fw_names=()
		case "${depthcharge}" in
			hylia)
				fw_names+=("rts5453_GOOG0600")
				;;
		esac

		# Silently ignore models that don't need PDC Firmware.
		[[ "${#fw_names[@]}" -eq 0 ]] && continue
		# Install PDC FW to FW_MAIN_A,B but COREBOOT
		insinto "/firmware/cbfs-rw-compress-override/${name}"
		for fw_name in "${fw_names[@]}"; do
			local fw_dir="${SYSROOT}/firmware/rts5453"
			doins "${fw_dir}/${fw_name}.bin"
			doins "${fw_dir}/${fw_name}.hash"
		done
	done
}
