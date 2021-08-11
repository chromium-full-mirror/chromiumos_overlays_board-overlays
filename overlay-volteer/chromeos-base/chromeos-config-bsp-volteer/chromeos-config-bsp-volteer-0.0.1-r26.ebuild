# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="c1a4274dd9c5cae7e094f49875583927b35c33ed"
CROS_WORKON_TREE=("dcd2600525e2f6180746a4e4a0b53cfeffd61254" "c4fa094fb3f496c846de81a05c9ab99e7f85c56c" "b19122bc0126ccb046968be6c1e9c8a18991acb2" "f9938c189936cd7d5b7db23b3bdcaec0c7d6331d" "6a8f52528069872dddca92d2d56569ed0ba18779" "31b4e30146e7caa485cf8290971f7050da5f31d1" "b5dcde58d8c82f7bedd6de9d0ab4a2e2c22712ce" "50e29fdd629357c3b71f6b01b242a133f2026791" "68fcc72417d866e00aaf5a6ef42fbbf5983a33de" "acf1ef3aecc36210f41aee04ee142928c7a249d9" "37e329fdf4e5256b62e664cfe658f57cdb33df22" "988310638cc7c5e515c94cb87b497fe4e29db8dd" "63e6c020195b87bf1ff2a4013e3e750056bcda75" "70f743996cc57bf4349cff6e1dae78f6db3c2f90" "fb2eb7ccca56db4c9d9be2bd2a1c07a56f2db6e9" "b007b01ad9de821002659514e5ed0ff763e2f869" "f6809178f14bb14263c45aca3a28920dbd7d71e3" "1c61e28cee449543f073545d5bf43e769c4e94e5" "55439861cd1e3806bb8e0700792d1944d62af0f6")
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
