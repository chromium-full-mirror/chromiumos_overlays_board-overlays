# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="d6b7b2bf74cd0eef6df5ed030658d034fc4a4080"
CROS_WORKON_TREE=("211941ce9980a495d4347c33b0782bad00c5509b" "4576c6f2efe6efd201b33c637a4da854dcac45d2" "8f094ce3a2169bfb9fdfcc1e4cea46af9440d935" "e9845680951f312b05f7ab6b97ab82adc3bec289" "f8ba0e52a82808e23f874653a2a9d4e316d77b95" "267d32b5bcc0a5d14350e82316e9a20820046e44")
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
