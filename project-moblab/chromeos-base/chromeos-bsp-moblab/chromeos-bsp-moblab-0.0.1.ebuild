# Copyright 2014 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit user

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies or portage actions"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"

RDEPEND="
	net-firewall/iptables
"

DEPEND=""

S=${WORKDIR}

pkg_preinst() {
	enewgroup moblab
	enewuser moblab
	usermod -a -G docker moblab
}

src_install() {
	insinto /etc/init
	doins "${FILESDIR}/cgroups.override"
}
