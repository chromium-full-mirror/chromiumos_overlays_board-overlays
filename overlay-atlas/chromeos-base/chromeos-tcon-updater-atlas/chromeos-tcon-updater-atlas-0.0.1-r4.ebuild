# Copyright 2020 The ChromiumOS Authors
# Distributed under the terms of the BSD license.

EAPI="7"

# This ebuild only cares about its own FILESDIR and ebuild file, so it tracks
# the canonical empty project.
CROS_WORKON_COMMIT="e8d0ce9c4326f0e57235f1acead1fcbc1ba2d0b9"
CROS_WORKON_TREE="f365214c3256d3259d78a5f4516923c79940b702"
CROS_WORKON_PROJECT="chromiumos/infra/build/empty-project"
CROS_WORKON_LOCALNAME="platform/empty-project"

inherit cros-workon

DESCRIPTION="TCON firmware updater entry point for Atlas."

LICENSE="BSD-Google"
SLOT="0/0"
KEYWORDS="*"

RDEPEND="
	chromeos-base/chromeos-nvt-tcon-updater
	chromeos-base/chromeos-tcon-updater-configs-atlas
	sys-firmware/chromeos-tcon-firmware-atlas-fhd
	sys-firmware/chromeos-tcon-firmware-atlas-uhd
"

src_install() {
	exeinto /opt/google/tcon/scripts
	doexe "${FILESDIR}/chromeos-tcon-update.sh"
}
