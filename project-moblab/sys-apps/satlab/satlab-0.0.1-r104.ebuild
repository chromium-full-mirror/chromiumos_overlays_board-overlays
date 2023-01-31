# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2.

EAPI=6

CROS_WORKON_COMMIT="77f37c87cbd98392324acc9cc12f58b500f031a7"
CROS_WORKON_TREE="47706d5727847ea3b18e7c66915290b8741f350f"
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
