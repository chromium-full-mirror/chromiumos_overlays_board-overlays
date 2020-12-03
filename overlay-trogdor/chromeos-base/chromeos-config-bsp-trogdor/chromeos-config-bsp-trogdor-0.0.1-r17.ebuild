# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="3a01873e59ec25ecb10d1b07ff9816e69f3bbfee"
CROS_WORKON_TREE="8ce164efd78fcb4a68e898d8c92c7579657a49b1"
inherit cros-unibuild cros-workon

# This ebuild only cares about its own FILESDIR and ebuild file, so it tracks
# the canonical empty project.
CROS_WORKON_PROJECT="chromiumos/infra/build/empty-project"
CROS_WORKON_LOCALNAME="empty-project"

DESCRIPTION="Chrome OS Model configuration package for trogdor"
HOMEPAGE="http://src.chromium.org"
SRC_URI=""

LICENSE="BSD-Google"
SLOT="0/${PF}"
KEYWORDS="*"

# From an ideological purity perspective, this DEPEND should be there, but
# it can't be, since otherwise we end up with circular dependencies.
# DEPEND="virtual/chromeos-bsp"

src_install(){
	install_model_files
}
