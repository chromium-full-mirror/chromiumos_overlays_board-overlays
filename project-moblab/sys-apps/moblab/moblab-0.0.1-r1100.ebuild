# Copyright 2019 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2.

EAPI="7"

CROS_WORKON_COMMIT="8ce120e1a5f4ea8deee4f2a683e40e64458f0beb"
CROS_WORKON_TREE="f944eb74aa5e7d32a6ba1b119e7ce0c6431613e9"
CROS_WORKON_INCREMENTAL_BUILD=1
CROS_WORKON_OUTOFTREE_BUILD=1
CROS_WORKON_PROJECT="chromiumos/platform/moblab"
CROS_WORKON_LOCALNAME="../platform/moblab"

inherit cros-workon toolchain-funcs

DESCRIPTION="Install moblab, a test scheduling infrastructure"
HOMEPAGE="https://chromium.googlesource.com/chromiumos/platform/moblab/+/master/src/"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"

RDEPEND="
	dev-lang/python:3.6
	dev-python/grpcio
	dev-python/protobuf-python
	dev-python/netifaces
	virtual/libusb:1=
"

DEPEND="${RDEPEND}
"

src_configure() {
	tc-export CC PKG_CONFIG
}
