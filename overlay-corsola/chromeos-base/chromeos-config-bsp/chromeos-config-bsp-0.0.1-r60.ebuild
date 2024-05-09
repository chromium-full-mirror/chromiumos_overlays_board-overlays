# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="ea888d5d3a8fa68c63961addefaf633b4f8cad46"
CROS_WORKON_TREE=("52cdca3e0a262aa856268e6e948d6301cdb34105" "ca453e2e5ecaf0910e119ca61381e55d3610a740" "45edd30c1f972a8db114acc537cca5a864f900b8" "d2bd610e8f3a4fe9288ea69a3492fe3be045cda8" "4624be3360500b03ac5fe91dda05532cfe21bf18" "da5bd0f361068688b8dde18c0f3f60b7b93f3f78" "8f75cbd4251d92091128b121d6a6a5b432dcc07a" "39a8a4911d95c90b3667d582469b2b4420e23bfc" "03c659c9808a7ebae49f93c57c7b18cd4534e90f" "efd3a1695528ed7376cd962c2c61c2efe46fac4c" "175980e67eaf713579745eaf1b852ce1aae5edbe")
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
