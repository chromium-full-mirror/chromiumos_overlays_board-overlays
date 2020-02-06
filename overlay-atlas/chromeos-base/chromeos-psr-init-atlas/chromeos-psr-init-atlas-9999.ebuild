# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the BSD license.

EAPI="7"

# This ebuild only cares about its own FILESDIR and ebuild file, so it tracks
# the canonical empty project.
CROS_WORKON_PROJECT="chromiumos/infra/build/empty-project"
CROS_WORKON_LOCALNAME="empty-project"

inherit cros-workon

DESCRIPTION="PSR setting initialization for Atlas"

LICENSE="BSD-Google"
SLOT="0/0"
KEYWORDS="~*"

src_install() {
	insinto /etc/init
	doins "${FILESDIR}/psr-init.conf"
}
