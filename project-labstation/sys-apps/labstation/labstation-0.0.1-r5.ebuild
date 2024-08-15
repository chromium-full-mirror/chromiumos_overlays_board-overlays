# Copyright 2024 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2.

EAPI="7"

CROS_WORKON_COMMIT="d078e815e17ff614c6e81d3d09774266e311bfaa"
CROS_WORKON_TREE="c2e064050f3192d2226513497621b6f7f1e91f94"
PYTHON_COMPAT=( python3_{8..11} )

CROS_WORKON_INCREMENTAL_BUILD=1
CROS_WORKON_OUTOFTREE_BUILD=1
CROS_WORKON_PROJECT="chromiumos/platform/labstation"
CROS_WORKON_LOCALNAME="../platform/labstation"

inherit cros-workon toolchain-funcs python-single-r1

DESCRIPTION="Install labstation specific tooling"
HOMEPAGE="https://chromium.googlesource.com/chromiumos/platform/labstation/+/HEAD/src/"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"

RDEPEND="sys-power/uhubctl
	dev-util/dolos
"

DEPEND="${RDEPEND}
"

src_configure() {
	tc-export CC PKG_CONFIG
}
