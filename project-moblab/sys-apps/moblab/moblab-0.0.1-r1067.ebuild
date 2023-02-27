# Copyright 2019 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2.

EAPI=6

CROS_WORKON_COMMIT="0711a4aae3b791b557dbdc15e8f534275e9b9f24"
CROS_WORKON_TREE="d47931792147955c419c4c3643b58db52534b4b1"
CROS_WORKON_INCREMENTAL_BUILD=1
CROS_WORKON_OUTOFTREE_BUILD=1
CROS_WORKON_PROJECT="chromiumos/platform/moblab"
CROS_WORKON_LOCALNAME="../platform/moblab"

inherit cros-workon

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
	dev-libs/libusb-compat
"

DEPEND="${RDEPEND}
"
