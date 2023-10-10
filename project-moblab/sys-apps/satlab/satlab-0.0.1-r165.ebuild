# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2.

EAPI="7"

CROS_WORKON_COMMIT="af4e5367c53d8e041e09ecc2a7c89d36204d71f6"
CROS_WORKON_TREE="eb002ddb6a681ef32a20192db2e83c2b87a81fb7"
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
