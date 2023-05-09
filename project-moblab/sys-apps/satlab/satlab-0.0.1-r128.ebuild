# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2.

EAPI=6

CROS_WORKON_COMMIT="cfd3b7b77ffc527a5cd73f6da062918da905b868"
CROS_WORKON_TREE="3b04a9a0aeb08f0cea43aa9c6b2ae0f5f28dfa8a"
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
