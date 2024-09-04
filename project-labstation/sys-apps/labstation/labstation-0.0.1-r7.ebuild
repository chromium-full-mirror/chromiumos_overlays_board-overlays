# Copyright 2024 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2.

EAPI="7"

CROS_WORKON_COMMIT="7df838c526089ed656f227ab1bc9296fd4b1566b"
CROS_WORKON_TREE="c56888e03397c194cd33c9ebf233f2a08f17d331"
PYTHON_COMPAT=( python3_{8..11} )

CROS_WORKON_PROJECT="chromiumos/platform/labstation"
CROS_WORKON_LOCALNAME="../platform/labstation"


inherit cros-workon distutils-r1 toolchain-funcs cros-sanitizers

DESCRIPTION="Install labstation specific tooling."
HOMEPAGE="https://chromium.googlesource.com/chromiumos/platform/labstation/+/HEAD/src/"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"

RDEPEND="sys-power/uhubctl
	dev-util/dolos
	app-misc/cambronix-firmware
"

DEPEND="${RDEPEND}
"

src_configure() {
	cd usb_hubs || die
	sanitizers-setup-env
	distutils-r1_src_configure
}

src_compile() {
	cd usb_hubs || die
	distutils-r1_src_compile
}

src_install() {
	insinto /usr/share/cros
	doins "${S}"/os-dependent/chromeos/servod_utils.sh
	insinto /etc/init
	doins "${S}"/os-dependent/chromeos/upstart-scripts/*.conf
	cd usb_hubs || die
	distutils-r1_src_install
}
