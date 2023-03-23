# Copyright 2019 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2.

EAPI=6

CROS_WORKON_COMMIT="93d1ec92885b36690ed4161d3e8918380b6c662c"
CROS_WORKON_TREE="d6741570ce3b3fb9371cb06ef53b885056463393"
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
