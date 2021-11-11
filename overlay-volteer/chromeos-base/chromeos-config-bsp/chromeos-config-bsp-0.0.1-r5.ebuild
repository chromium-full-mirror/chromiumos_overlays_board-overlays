# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="c13bfc55b85b0ba35d76f09824e4675fb923ff50"
CROS_WORKON_TREE=("f9f00739acabf29fed65045f7c1c8433571d8fc2" "c4fa094fb3f496c846de81a05c9ab99e7f85c56c" "ee2b70cd9baead1c61316437e7a9ae8b60b41d30" "a351e6ee7eee971e276b90242246263b1fd7c37f" "8f7f95ccd73a522d13847a979a382a5da9d45ed4" "31b4e30146e7caa485cf8290971f7050da5f31d1" "b5dcde58d8c82f7bedd6de9d0ab4a2e2c22712ce" "50e29fdd629357c3b71f6b01b242a133f2026791" "68fcc72417d866e00aaf5a6ef42fbbf5983a33de" "acf1ef3aecc36210f41aee04ee142928c7a249d9" "37e329fdf4e5256b62e664cfe658f57cdb33df22" "988310638cc7c5e515c94cb87b497fe4e29db8dd" "f15fc73b627387effe9aaca5c71ec52698df53d2" "70f743996cc57bf4349cff6e1dae78f6db3c2f90" "27a46892d00df85b36d19738d35b4fd19099b14f" "7025b17ebba6a34d872ab113a65cb0e9c5cefb38" "f6809178f14bb14263c45aca3a28920dbd7d71e3" "889c44c084e2bc53b7ed42ac0211d7c3d971f2e1" "55439861cd1e3806bb8e0700792d1944d62af0f6")
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
RDEPEND="!chromeos-base/chromeos-config-bsp-volteer"


src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
