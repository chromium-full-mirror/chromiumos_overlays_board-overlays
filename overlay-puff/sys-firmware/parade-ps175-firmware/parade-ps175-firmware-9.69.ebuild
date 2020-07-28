# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# This ebuild only cares about its own FILESDIR and ebuild file, so it tracks
# the canonical empty project.
CROS_WORKON_PROJECT="chromiumos/infra/build/empty-project"
CROS_WORKON_LOCALNAME="../platform/empty-project"

inherit udev

DESCRIPTION="PS175 firmware update files used by fwupd"
HOMEPAGE=""

SRC_URI="gs://chromeos-localmirror/distfiles/${P}.tar.xz"
SLOT="0/0"

LICENSE="Google-Partners-Website"
KEYWORDS="*"
IUSE=""

DEPEND=""
RDEPEND="sys-apps/fwupd"

src_unpack() {
	default
}

src_install() {
	local firmware_name="ps175-V${PV}"
	"${FILESDIR}"/generate_cab.py \
		"${WORKDIR}/${P}/${firmware_name}.bin" \
		--output "${T}" \
		|| die "Generate cab failed!"

	insinto /usr/share/fwupd/remotes.d/vendor/firmware
	doins "${T}/${firmware_name}.cab"
	# Install udev rules for automatic firmware update.
	udev_dorules "${FILESDIR}"/99-fwupdtool-lspcon.rules
}
