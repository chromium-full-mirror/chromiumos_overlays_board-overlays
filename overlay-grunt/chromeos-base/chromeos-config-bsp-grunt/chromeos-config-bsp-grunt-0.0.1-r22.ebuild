# Copyright 2018 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

CROS_WORKON_COMMIT="323c6253ad3c1d6ef4ec58417445c97de515663b"
CROS_WORKON_TREE="e76cbb389f761d700894b3459aeeb86766ec36b7"
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
