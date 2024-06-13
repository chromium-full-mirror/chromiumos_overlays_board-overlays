# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="b69405404654ccff4ee3c84d6d280994d4182741"
CROS_WORKON_TREE=("52cdca3e0a262aa856268e6e948d6301cdb34105" "ca453e2e5ecaf0910e119ca61381e55d3610a740" "45edd30c1f972a8db114acc537cca5a864f900b8" "161f9d9bca9bd522352e470ade9efa14f2fb27f6" "4624be3360500b03ac5fe91dda05532cfe21bf18" "da5bd0f361068688b8dde18c0f3f60b7b93f3f78" "0b6792096e33f0476018ea1dd6dd41a84a6e80b4" "39a8a4911d95c90b3667d582469b2b4420e23bfc" "03c659c9808a7ebae49f93c57c7b18cd4534e90f" "2fc56764d7b0901dc4641167e9cba8130c89e447" "132cd1ec055ffc0e7c8c172dfbbaf54b104f72fa")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"chinchou"
	"kingler"
	"krabby"
	"kyogre"
	"magikarp"
	"ponyta"
	"skitty"
	"steelix"
	"tentacruel"
	"veluza"
	"voltorb"
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
KEYWORDS="*"

RDEPEND="!chromeos-base/chromeos-config-bsp-corsola"

src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
