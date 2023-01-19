# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="51d5d25a019657e187dec76ba361cd1ddfe79953"
CROS_WORKON_TREE=("6a94e520f8eef6f900d68cd9015593bcf0303b4a" "e4109907549b6d6351082e9c21e8bc7a2b857242" "9aebab7b9a6f4d8581d9b13781b3369ffaed4fee" "b71033328a5eaea5534d765b7e0b1478c7b23d00" "81148f5cf09af31904434f388741fe62f3c42a2f" "2d91db7d28a2cd65009e45c2e3854c9e1782d80d" "31e59a98514d7a74cb6c218cc51b9d24e5d1cbda")
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
