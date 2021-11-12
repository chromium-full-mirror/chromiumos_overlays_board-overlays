# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="dd3a4ace5a80eddaf8c94e4de602a763954e0c60"
CROS_WORKON_TREE=("f9f00739acabf29fed65045f7c1c8433571d8fc2" "c4fa094fb3f496c846de81a05c9ab99e7f85c56c" "ee2b70cd9baead1c61316437e7a9ae8b60b41d30" "a351e6ee7eee971e276b90242246263b1fd7c37f" "8f7f95ccd73a522d13847a979a382a5da9d45ed4" "31b4e30146e7caa485cf8290971f7050da5f31d1" "b5dcde58d8c82f7bedd6de9d0ab4a2e2c22712ce" "68fcc72417d866e00aaf5a6ef42fbbf5983a33de" "f15fc73b627387effe9aaca5c71ec52698df53d2" "27a46892d00df85b36d19738d35b4fd19099b14f" "7025b17ebba6a34d872ab113a65cb0e9c5cefb38" "f6809178f14bb14263c45aca3a28920dbd7d71e3" "889c44c084e2bc53b7ed42ac0211d7c3d971f2e1")
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
	"lindar"
	"terrador"
	"voema"
	"volet"
	"volteer"
	"voxel"
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
RDEPEND="!chromeos-base/chromeos-config-bsp-volteer"


src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
