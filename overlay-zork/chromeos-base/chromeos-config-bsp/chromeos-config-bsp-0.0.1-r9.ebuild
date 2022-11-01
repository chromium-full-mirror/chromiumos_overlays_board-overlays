# Copyright 2020 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="ad946c44985f9ccab21b26ad60aa09f875d432a3"
CROS_WORKON_TREE=("6befcb5ced3b30e0fa19e2cf899a5099de114ef8" "c0d553dbd12c5a7f3a720efb64becbfdca5f40d8" "40b9cb932a5be3c80ff971e90b4827db22487491" "fc538a6578153adde48d60a3d08222c26199790d" "707bb7bdbfcc475d416afabb6cb8d4654236b375" "68848003378ef4bd063ce8a1690165b0866d7d1d" "3adf59ed3427988e60a02aabb7bf0de63db48367" "4a71cc6c391c192cd3d4ebad6c3a663155070316")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
    "berknip"
    "dalboz"
    "dirinboz"
    "ezkinil"
    "morphius"
    "trembyle"
    "vilboz"
    "woomax"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "$(printf "zork/%s/${CONFIG_PATH} " "${PROJECTS[@]}")" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( zork )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for zork"
HOMEPAGE="https://www.chromium.org/chromium-os"
SRC_URI=""

LICENSE="BSD-Google"
SLOT="0/${PF}"
KEYWORDS="* amd64 x86"
RDEPEND="!chromeos-base/chromeos-config-bsp-zork"


src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
