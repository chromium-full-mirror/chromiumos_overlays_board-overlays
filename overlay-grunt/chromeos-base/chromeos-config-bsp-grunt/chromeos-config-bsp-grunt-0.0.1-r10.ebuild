# Copyright 2018 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

CROS_WORKON_COMMIT="780492619cd90a97ab207069c88030f36e13fd9d"
CROS_WORKON_TREE="72f4ce78c047f93460b3352082658946e7b51d3e"
inherit cros-constants

CROS_WORKON_PROJECT="chromiumos/overlays/board-overlays"
CROS_WORKON_LOCALNAME="../overlays/"
CROS_WORKON_SUBTREE="overlay-grunt/chromeos-base/chromeos-config-bsp-grunt/files"

inherit cros-model cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for grunt"
HOMEPAGE="http://src.chromium.org"

LICENSE="BSD-Google"
SLOT="0/${PF}"
KEYWORDS="* amd64 x86"

src_install() {
	install_model_files
}
