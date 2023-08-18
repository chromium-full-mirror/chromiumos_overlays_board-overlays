# Copyright 2019 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2.

EAPI="7"

CROS_WORKON_COMMIT="4b3aa261ab6fd7e03991cc4f9766808545aabde1"
CROS_WORKON_TREE="8e28438f6205f84b35383d7ecd502d08d497b95f"
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
