# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="0cc976984e9b7ae0dfd391818550f003acd2273e"
CROS_WORKON_TREE=("d89da42111196c922a4ae1ed154594504e12a228" "c4fa094fb3f496c846de81a05c9ab99e7f85c56c" "8ed6072a2f75daa552556211637827f7b72cfe45" "dc4eb8654b5495cf45fae311435f75e735e95e67" "17892524fa3466bbdf35ac41c7844be83072cabd" "e39db837ab7781a0b825836ca1c03788d3e3a722" "c322621976b0343971a522295a0dc27d3b376a46" "2094b1c7063a62a5ddc61fa5c41315d634d0b1d2" "2b0b54ed0ddb7226b8ec8114df15832d261fd646" "acf1ef3aecc36210f41aee04ee142928c7a249d9" "8ab1bf3208ed27a49949eb6566f24ed2ce66e7d2" "c8ba36612976cdba29d880c14245e7dee82caa09" "180eeda11d8323ed6642e55dc3b86cc062c7fdfc" "d923094b0299439a65ecf1b8604c69108a37cfb8" "c0cd8750dc72c95ccffd87a13a6eca1fbd84cff6" "22106f3463d398ddb96198505a935e339c3610ec" "105ad21f03484d9e35e9cb2a8e4c1a81f1dea6dd" "29850496f503eed049d6c978a2e90dcf532418e6" "55439861cd1e3806bb8e0700792d1944d62af0f6")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

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
