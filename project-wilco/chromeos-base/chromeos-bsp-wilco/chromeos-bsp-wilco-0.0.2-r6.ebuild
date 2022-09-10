# Copyright 2019 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# This ebuild only cares about its own FILESDIR and ebuild file, so it tracks
# the canonical empty project.
CROS_WORKON_COMMIT="e8d0ce9c4326f0e57235f1acead1fcbc1ba2d0b9"
CROS_WORKON_TREE="f365214c3256d3259d78a5f4516923c79940b702"
CROS_WORKON_PROJECT="chromiumos/infra/build/empty-project"
CROS_WORKON_LOCALNAME="platform/empty-project"

inherit cros-workon

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
KEYWORDS="-* amd64 x86"
IUSE=""

# Add dependencies on other ebuilds from within this board overlay
DEPEND=""
RDEPEND="
	${DEPEND}
	!<chromeos-base/chromeos-bsp-sarien-0.0.2
"

src_install() {
	# All wilco devices contain an RTC in the EC that needs to
	# be kept in sync with local time so that charge scheduling happens
	# at the correct time. This upstart script will do that.
	insinto /etc/init
	doins "${FILESDIR}/wilco_sync_ec_rtc.conf"
	doins "${FILESDIR}/wilco_ec_mute.conf"
}
