# Copyright 2019 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2.

EAPI="7"

CROS_WORKON_COMMIT="1d3b407b07837ab1cee045ea7a72f92eb85666a4"
CROS_WORKON_TREE="e7a43f6f4272f04e610463be991440b4ad0a6301"
PYTHON_COMPAT=( python3_{8..11} )

CROS_WORKON_INCREMENTAL_BUILD=1
CROS_WORKON_OUTOFTREE_BUILD=1
CROS_WORKON_PROJECT="chromiumos/platform/moblab"
CROS_WORKON_LOCALNAME="../platform/moblab"

inherit cros-workon toolchain-funcs python-single-r1

DESCRIPTION="Install moblab, a test scheduling infrastructure"
HOMEPAGE="https://chromium.googlesource.com/chromiumos/platform/moblab/+/HEAD/src/"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"

RDEPEND="
	${PYTHON_DEPS}
	$(python_gen_cond_dep '
		dev-python/grpcio[${PYTHON_USEDEP}]
		dev-python/protobuf-python[${PYTHON_USEDEP}]
		dev-python/netifaces[${PYTHON_USEDEP}]
		' -3)
	virtual/libusb:1=
"

DEPEND="${RDEPEND}
"

src_configure() {
	tc-export CC PKG_CONFIG
}
