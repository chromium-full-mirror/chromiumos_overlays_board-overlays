# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="d2dccd1ca07a98bb1103c151ad9f204703de0b1a"
CROS_WORKON_TREE=("0e09b552e6ad7ba981dd420e6ce8c179d8b75c89" "52c07779e83fc70bc553aabe415045b309cdd327" "12d2e7b9ba9c9f93ebc10d7942282bfed2447fe8" "dab451b08a1272ce1fcfa116c93d8fb87a2ea126")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"herobrine"
	"hoglin"
	"piglin"
	"villager"
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
RDEPEND="!chromeos-base/chromeos-config-bsp-herobrine"


src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
