# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="0cc976984e9b7ae0dfd391818550f003acd2273e"
CROS_WORKON_TREE=("0495557561237a935f7a995c306801305ac9859a" "8967a87a1710152556ed04340da7ce064cc4cfe2")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"herobrine"
	"piglin"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "$(printf "herobrine/%s/${CONFIG_PATH} " "${PROJECTS[@]}")" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( herobrine )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for herobrine"
HOMEPAGE="https://www.chromium.org/chromium-os"
SRC_URI=""

LICENSE="BSD-Google"
SLOT="0/${PF}"
KEYWORDS="*"

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
