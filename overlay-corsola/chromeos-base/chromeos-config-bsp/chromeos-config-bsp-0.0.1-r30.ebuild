# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="b9247d08a68caf764736affdd13cc2a275bf0cd3"
CROS_WORKON_TREE=("211941ce9980a495d4347c33b0782bad00c5509b" "4576c6f2efe6efd201b33c637a4da854dcac45d2" "9d74cb302394bbc9b26d96ccc1218c7b4e4a9aec" "4a52ad9b7dfb30e1e810dcf436ba626015684dde" "f8ba0e52a82808e23f874653a2a9d4e316d77b95" "267d32b5bcc0a5d14350e82316e9a20820046e44")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"kingler"
	"krabby"
	"magikarp"
	"steelix"
	"tentacruel"
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
SLOT="0/${PF}"
KEYWORDS="*"

RDEPEND="!chromeos-base/chromeos-config-bsp-corsola"

src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
