# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="b7268f3a68613c090599d356aa36c292b6b05fda"
CROS_WORKON_TREE=("844505ccc00efc1a1541417e7823106d48390792" "0c97c7cb3bc7970a8b165f1f7bd4ed35289f1b39" "a7cbfab9391c4f861c39203be74a44f4c2ca10f1" "bb09e11ce2c1ca65ed650f9d0d7d6e27d375db95" "6f5870029cf49ee0bfd5fe2ea7caf15598aad5ea" "edaf4c919b5bdc49a248051bd1e6b2b619436afc" "2302461af23fd014289554639f58a0ca20ae7399" "88c46b5e78192f8bde1834637502709cb1fee649")
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
