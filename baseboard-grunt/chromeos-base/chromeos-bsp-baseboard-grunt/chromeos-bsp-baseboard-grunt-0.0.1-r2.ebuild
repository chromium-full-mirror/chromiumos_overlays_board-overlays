# Copyright 2017 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# This ebuild only cares about its own FILESDIR and ebuild file, so it tracks
# the canonical empty project.
CROS_WORKON_COMMIT="e8d0ce9c4326f0e57235f1acead1fcbc1ba2d0b9"
CROS_WORKON_TREE="f365214c3256d3259d78a5f4516923c79940b702"
CROS_WORKON_PROJECT="chromiumos/infra/build/empty-project"
CROS_WORKON_LOCALNAME="platform/empty-project"

inherit cros-workon

DESCRIPTION="Pulls in any necessary ebuilds as dependencies or portage actions."

LICENSE="BSD-Google"
KEYWORDS="-* amd64 x86"
IUSE="schedutil_governor"

# Add dependencies on other ebuilds from within this board overlay
RDEPEND=""
DEPEND="${RDEPEND}"

src_install() {
	# Install governor config to tune ondemand governor parameters.
	insinto /etc
	if use schedutil_governor; then
		# TODO(b/157953186): select this or the other
		newins "${FILESDIR}"/cpufreq_schedutil.conf cpufreq.conf
	else
		doins "${FILESDIR}"/cpufreq.conf
	fi
}
