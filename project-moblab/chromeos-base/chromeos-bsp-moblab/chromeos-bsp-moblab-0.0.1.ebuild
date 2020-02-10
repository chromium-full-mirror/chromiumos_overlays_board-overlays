# Copyright 2014 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit user

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies or portage actions"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"

# These packages are meant to set up the Chromium OS Basic environment to
# properly handle the services required by the lab infrastructure.
# TODO(pprabhu, crbug.com/775373) Move virt-what to common VM overlay once that
# is ready.
RDEPEND="
	app-emulation/docker
	chromeos-base/chromeos-init
	net-firewall/iptables
"

# Chromium OS Autotest Server and Devserver Deps.
RDEPEND="${RDEPEND}
	sys-apps/moblab
"

DEPEND=""

S=${WORKDIR}

pkg_preinst() {
	enewgroup moblab
	enewuser moblab
}

src_install() {
	insinto /etc/init
	doins "${FILESDIR}/cgroups.override"
}
