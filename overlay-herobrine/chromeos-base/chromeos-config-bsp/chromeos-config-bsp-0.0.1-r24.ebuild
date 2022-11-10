# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="2180be32dc05df059f857394a5c4a2bd08b3fbf5"
CROS_WORKON_TREE=("91950df6000d15f1c670e3d122b035b43789a8f7" "e4109907549b6d6351082e9c21e8bc7a2b857242" "2b0b705f54367a15b5a5f365c0154fa826fa900b" "b71033328a5eaea5534d765b7e0b1478c7b23d00" "81148f5cf09af31904434f388741fe62f3c42a2f" "a2e16954a0e2cb3f416611e3a5fc558db5e325df" "80bf2d10dc02122358770e1e230eb23bebe7ede2")
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
