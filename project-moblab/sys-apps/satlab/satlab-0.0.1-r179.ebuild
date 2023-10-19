# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2.

EAPI="7"

CROS_WORKON_COMMIT="66858500656c4f417ef2d3877256a21dccedf4dc"
CROS_WORKON_TREE="ada94dd4575b1210005c3096774d1d1aba628890"
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
