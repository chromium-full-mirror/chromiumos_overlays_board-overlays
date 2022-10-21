# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="0d70b9938b1d2648c2a0049f0e429b58985ddff8"
CROS_WORKON_TREE=("91950df6000d15f1c670e3d122b035b43789a8f7" "e4109907549b6d6351082e9c21e8bc7a2b857242" "2b0b705f54367a15b5a5f365c0154fa826fa900b" "b71033328a5eaea5534d765b7e0b1478c7b23d00" "34aa5ee7cd7ebe6d9c64860282216b52b1ce7465" "a2e16954a0e2cb3f416611e3a5fc558db5e325df" "ca8b8d3d5f2668f7254cb6d31cda72e93f4f9ed7")
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
