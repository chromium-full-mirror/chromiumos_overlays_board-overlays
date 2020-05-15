# Copyright 2018 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

CROS_WORKON_COMMIT="aedebb4eabf6502a894a3764ed66b694869c80e2"
CROS_WORKON_TREE="c505fc0d2fbf5c23d50d18ff20d1dc48ac15ab73"
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
