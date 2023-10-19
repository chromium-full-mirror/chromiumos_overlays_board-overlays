# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2.

EAPI="7"

CROS_WORKON_COMMIT="cb6d78f50d3294c33e0f2dfc43bb42d40edf76be"
CROS_WORKON_TREE="bcb5b99af60e0ff3d3048e9ca81e5c8588e60409"
CROS_WORKON_INCREMENTAL_BUILD=1
CROS_WORKON_OUTOFTREE_BUILD=1
CROS_WORKON_PROJECT="chromiumos/platform/satlab"
CROS_WORKON_LOCALNAME="../platform/satlab"

inherit cros-workon

DESCRIPTION="Install satlab, a test scheduling infrastructure"
HOMEPAGE="https://chromium.googlesource.com/chromiumos/platform/satlab/+/main/"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"

RDEPEND="
	app-emulation/docker
	dev-lang/python:3.6
	dev-python/grpcio
	dev-python/protobuf-python
	net-firewall/iptables
"

DEPEND="${RDEPEND}
"
