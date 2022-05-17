# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="d7185597242862f45cd7a10880a21c773e7a6d5c"
CROS_WORKON_TREE=("844505ccc00efc1a1541417e7823106d48390792" "0c97c7cb3bc7970a8b165f1f7bd4ed35289f1b39" "a7cbfab9391c4f861c39203be74a44f4c2ca10f1" "03661c79cc5612d3953fa5684f9697a0314a3a4b" "4c28208e20f8be4ed64c5a83288427e9384289cd" "edaf4c919b5bdc49a248051bd1e6b2b619436afc" "6f29152a03ecd38ab14730f76dbf1ff65d7768a5" "92c4988574aaacb450b14331556598cb839bd85f")
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
