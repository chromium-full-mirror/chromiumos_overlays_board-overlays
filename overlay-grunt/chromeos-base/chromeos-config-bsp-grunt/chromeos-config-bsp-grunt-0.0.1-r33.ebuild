# Copyright 2018 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

CROS_WORKON_COMMIT="8a00738ca5bdb2204b7a3fea54fde51ea6a90052"
CROS_WORKON_TREE="7f5d541978e04a7b58a87516a9b0259b918636e7"
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
