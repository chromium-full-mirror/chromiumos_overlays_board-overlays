# Copyright 2019 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2.

EAPI="7"

CROS_WORKON_COMMIT="b142e58be411726fc7d5a0942b57e913b762fd41"
CROS_WORKON_TREE="1cbd8cee0c7780e517444f86c6e7b6ee6273319f"
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
