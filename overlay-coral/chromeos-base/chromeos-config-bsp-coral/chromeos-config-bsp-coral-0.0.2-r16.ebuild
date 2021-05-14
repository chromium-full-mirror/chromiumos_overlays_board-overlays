# Copyright 2018 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# This ebuild only cares about its own FILESDIR and ebuild file, so it tracks
# the canonical empty project.
CROS_WORKON_COMMIT="3a01873e59ec25ecb10d1b07ff9816e69f3bbfee"
CROS_WORKON_TREE="8ce164efd78fcb4a68e898d8c92c7579657a49b1"
CROS_WORKON_PROJECT="chromiumos/infra/build/empty-project"
CROS_WORKON_LOCALNAME="empty-project"

DESCRIPTION="Chrome OS Model configuration package for coral"
HOMEPAGE="http://src.chromium.org"

LICENSE="BSD-Google"
KEYWORDS="-* amd64 x86"

inherit cros-unibuild cros-workon

IUSE="generated_cros_config"

RDEPEND="
	!<chromeos-base/chromeos-config-bsp-coral-private-0.0.1-r1102
	generated_cros_config? ( !!chromeos-base/chromeos-config-bsp-coral-private )
"

# From an ideological purity perspective, this DEPEND should be there, but
# it can't be, since otherwise we end up with circular dependencies.
# DEPEND="virtual/chromeos-bsp"

src_install(){
	if use generated_cros_config ; then
		install_generated_config_files
	else
		install_model_files
	fi
}
