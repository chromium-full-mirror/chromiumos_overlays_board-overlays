# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="b29bdd6ce49e2d08d175846070fe94c11ea33979"
CROS_WORKON_TREE=("13d1580824ab119481e860f88c26e240918e6462" "bd5356241920c7dad3f508b873ac98246ea61a8c" "e296dff1059fa1f86f89603089d6d204980b21e4" "832ca1d017bc85a46a979b025506b5244e82b805" "cf01db9191963f0f076cc10758960eb4ee5d7f63" "038d6f97cd1ec95eb37120cd5668480916d16ff7" "7277cd81bdb6f4ff35a90a9feeeb6e0ae15a6b9a" "4d66c4b4928205843f5e4fd3d362b68236d72e76")
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
