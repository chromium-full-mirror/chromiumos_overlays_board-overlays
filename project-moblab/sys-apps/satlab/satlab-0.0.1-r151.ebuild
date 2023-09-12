# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2.

EAPI="7"

CROS_WORKON_COMMIT="9ef247f67e4f869c3db28137519ee4d097363029"
CROS_WORKON_TREE="afb5f79207a81b2b9f527c7363dd5b9ba9aa09fc"
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
