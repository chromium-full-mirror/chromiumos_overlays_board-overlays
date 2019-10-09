# Copyright 2018 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

CROS_WORKON_COMMIT="d81765949568d17e1e11e96b2588a5a2d975ef9a"
CROS_WORKON_TREE="d309176c08b25b4fb8194648768fdee5274eedf5"
inherit cros-constants

CROS_WORKON_PROJECT="chromiumos/overlays/board-overlays"
CROS_WORKON_LOCALNAME="../overlays/"
CROS_WORKON_SUBTREE="overlay-grunt/chromeos-base/chromeos-config-bsp-grunt/files"

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for grunt"
HOMEPAGE="http://src.chromium.org"

LICENSE="BSD-Google"
SLOT="0/${PF}"
KEYWORDS="* amd64 x86"

src_install() {
	install_model_files
}
