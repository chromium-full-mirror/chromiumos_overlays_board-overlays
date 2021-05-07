# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="35076ee1563f59dafc8222a554151fd3e1235cb5"
CROS_WORKON_TREE=("82cdae81bc967bbcb6181a8cf3cbd1e5bb2df351" "ea124cbaedbd16f00249df85a1acb1a80c28950d" "6e0421d8418b1caa95e933debdb1666fc281d5e5" "4fc5cbec82b000d6fd1ba50df3e1e1814862111f" "d1fd35237b94a69c8b51a2d42eac8fcffa47ecd4" "acf1ef3aecc36210f41aee04ee142928c7a249d9" "a5c0c8bbc8e7a5769adc35725c32f4eb71c04a62" "1050bad0facf2b8bb5367d465253ec0e1eaef1d2" "c7b7f001babcee2f6d872c1103847ecdb0ee0737" "33688d99793a94b91440f7ae0defe24467997831" "43ca162d553bc9565df1e85078683dc555936bef" "893c9228bec2dd04d8e6d2cd9945f7610fa99f4f" "55439861cd1e3806bb8e0700792d1944d62af0f6")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_INT_HOST_URL}"

PROJECTS=(
    "chronicler"
    "collis"
    "copano"
    "delbin"
    "drobit"
    "eldrid"
    "elemi"
    "halvor"
    "lindar"
    "lingcod"
    "malefor"
    "mudada"
    "terrador"
    "trondo"
    "voema"
    "volet"
    "volteer"
    "voxel"
    "zantor"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "$(printf "volteer/%s/${CONFIG_PATH} " "${PROJECTS[@]}")" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( volteer )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for volteer"
HOMEPAGE="https://www.chromium.org/chromium-os"
SRC_URI=""

LICENSE="BSD-Google"
SLOT="0/${PF}"
KEYWORDS="* amd64 x86"

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
