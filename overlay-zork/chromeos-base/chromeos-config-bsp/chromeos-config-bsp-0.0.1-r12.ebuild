# Copyright 2020 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="ce176c12872faaa9c7e7fedc6cc515a55a99c7f8"
CROS_WORKON_TREE=("9d0ca6484649e34d02b39f8ff17680cea182493a" "d051f9fcd409de41ad43a2d9355f40eb4578796e" "ddafee461a7f05b212b8667c2e100ed0c898cb3d" "b59d506ae8bf5b5193881332080c31cde797a935" "764eb2a9fe5db0b904970a096ec6240223f582df" "762d34476d64416ee39fb9c611a7636f41c29735" "c656f24a79fc27d8b079c360e7780d684b39b41b" "33772f5281bdbcc1f04b5777fb7c0f013f2f2cbb")
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
