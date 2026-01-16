# Copyright 2025 The ChromiumOS Authors
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=7

CROS_WORKON_COMMIT="d2d95e8af89939f893b1443135497c1f5572aebc"
CROS_WORKON_TREE="776139a53bc86333de8672a51ed7879e75909ac9"
DESCRIPTION="Coreboot files for Skywalker baseboard"
KEYWORDS="*"
LICENSE="BSD-Google"

# This ebuild only cares about its own FILESDIR and ebuild file, so it tracks
# the canonical empty project.
CROS_WORKON_PROJECT="chromiumos/infra/build/empty-project"
CROS_WORKON_LOCALNAME="../platform/empty-project"

# No need to inherit coreboot-private-files as there are no files in ${FILESDIR}
inherit cros-workon

DEPEND="
	chromeos-base/chromeos-config:=
	=sys-firmware/realtek-rts5453-GOOG0B00-firmware-16.2.3-r1
	=sys-firmware/realtek-rts5453-GOOG0B01-firmware-16.2.3-r1
	=sys-firmware/realtek-rts5453-GOOG0B02-firmware-16.2.3-r1
	=sys-firmware/realtek-rts5453-GOOG0C00-firmware-16.2.3-r1
	=sys-firmware/realtek-rts5453-GOOG0D00-firmware-16.2.3-r1
	=sys-firmware/realtek-rts5453vb-GOOG0U00-firmware-0.48.4
	=sys-firmware/realtek-rts5453vb-GOOG0W00-firmware-0.48.4
"
RDEPEND="${DEPEND}"

src_install() {
	(cros_config_host "get-firmware-build-combinations" depthcharge \
		|| die "Failed to run cros_config_host") |
	while read -r name && read -r depthcharge; do
		local fw_names=()
		case "${depthcharge}" in
			anakin|baze|padme|tarkin)
				fw_names+=("rts5453vb_GOOG0U00" "rts5453_GOOG0B00")
				;;
			dooku)
				fw_names+=("rts5453vb_GOOG0U00")
				;;
			grogu)
				fw_names+=("rts5453_GOOG0D00")
				;;
			obiwan)
				fw_names+=(
					"rts5453_GOOG0D00"
					"rts5453_GOOG0B02"
					"rts5453vb_GOOG0U00"
					"rts5453vb_GOOG0W00"
				)
				;;
			skywalker)
				fw_names+=("rts5453_GOOG0C00" "rts5453_GOOG0B00")
				;;
			vader)
				fw_names+=("rts5453_GOOG0C00" "rts5453_GOOG0B00")
				;;
			yoda)
				fw_names+=("rts5453_GOOG0D00" "rts5453_GOOG0B01")
				;;
		esac

		# Silently ignore models that don't need rts5453 files.
		[[ "${#fw_names[@]}" -eq 0 ]] && continue

		local rts5453_fw_dir="${SYSROOT}/firmware/rts5453"
		insinto "/firmware/cbfs-rw-compress-override/${name}"
		for fw_name in "${fw_names[@]}"; do
			local fw_bin="${rts5453_fw_dir}/${fw_name}.bin"
			local fw_hash="${rts5453_fw_dir}/${fw_name}.hash"
			doins "${fw_bin}"
			doins "${fw_hash}"
		done
	done
}
