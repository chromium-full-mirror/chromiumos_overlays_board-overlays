# This file is Copyright 2020 The ChromiumOS Authors
# This file is distributed under the terms of the BSD license.

EAPI="7"

# This ebuild only cares about its own FILESDIR and ebuild file, so it tracks
# the canonical empty project.
CROS_WORKON_COMMIT="e8d0ce9c4326f0e57235f1acead1fcbc1ba2d0b9"
CROS_WORKON_TREE="f365214c3256d3259d78a5f4516923c79940b702"
CROS_WORKON_PROJECT="chromiumos/infra/build/empty-project"
CROS_WORKON_LOCALNAME="platform/empty-project"

inherit cros-workon

DESCRIPTION="Novatek TCON firmware updater config files for Atlas."

LICENSE="BSD-Novatek"
SLOT="0/0"
KEYWORDS="*"

src_install() {
	insinto /opt/google/tcon/configs
	doins "${FILESDIR}"/*.ini
}
