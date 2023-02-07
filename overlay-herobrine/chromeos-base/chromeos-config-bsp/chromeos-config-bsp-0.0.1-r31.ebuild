# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="ce176c12872faaa9c7e7fedc6cc515a55a99c7f8"
CROS_WORKON_TREE=("6ae4969e5fbc3057e2e4ee39d6bd4bf4b69ce538" "ec6bd965ba59e75fe3a849da8270a49445583574" "b83919652697d42fb3930f315f65000961e1bb44" "f086889ef7e0b0636b5bc7870c92b6d476616146" "f7e43107ecf24fc7ba676409a0c40f4588265a10" "4cecf3626d8fb2590ad6c0eaa576e13bee04aba5" "110ee38d0763ab7fca87079a922dbd91dade2ce0")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"evoker"
	"herobrine"
	"hoglin"
	"piglin"
	"villager"
	"zoglin"
	"zombie"
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
