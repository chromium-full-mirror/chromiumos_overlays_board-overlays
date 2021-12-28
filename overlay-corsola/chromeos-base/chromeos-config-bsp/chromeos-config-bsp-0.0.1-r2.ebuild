# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="46c7643a062236bbb7e1c0025736396ffb9e7870"
CROS_WORKON_TREE=("97608d07af6c61fd248c9b72189d66d2d4b451b5" "c3f8924f46aef876062c23d4f8df5ccf68b576e6")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"kingler"
	"krabby"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "$(printf "corsola/%s/${CONFIG_PATH} " "${PROJECTS[@]}")" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( corsola )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for corsola"
HOMEPAGE="https://www.chromium.org/chromium-os"
SRC_URI=""

LICENSE="BSD-Google"
SLOT="0/${PF}"
KEYWORDS="*"

RDEPEND="!chromeos-base/chromeos-config-bsp-corsola"

src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
