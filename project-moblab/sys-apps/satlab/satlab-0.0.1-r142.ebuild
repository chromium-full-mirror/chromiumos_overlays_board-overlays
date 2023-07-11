# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2.

EAPI=6

CROS_WORKON_COMMIT="107d6e7335aeccca104165b8793772b8cb01b674"
CROS_WORKON_TREE="6b6fd0d5a6b1672289d740adbde81375f49120a3"
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
