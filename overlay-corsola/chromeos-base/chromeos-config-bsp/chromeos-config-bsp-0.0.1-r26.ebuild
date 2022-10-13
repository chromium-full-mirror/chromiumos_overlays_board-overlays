# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="a5f6c5fd4861d547d533c3f88f43b9c4df4c7042"
CROS_WORKON_TREE=("e3d448c9aee334c410967afac4f46feabf74461a" "4fb3df523bf9f307d823a322e83597c8c3102cca" "34c9a8daf3e236ecab7d0ace115a4536e047dc03" "8b9eeca345e044fca18480578a9708a7724266b0" "9d9d4ff9decb854350be27d37f58d6f746ad881c")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"kingler"
	"krabby"
	"magikarp"
	"steelix"
	"tentacruel"
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
