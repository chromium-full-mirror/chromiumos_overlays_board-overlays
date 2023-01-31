# Copyright 2020 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="c35f597cc39fc9e238340cb6d0feeb6b79d618f6"
CROS_WORKON_TREE=("dcb3517a8789d37f4749967f11ba2f4c69f3138c" "c4fa094fb3f496c846de81a05c9ab99e7f85c56c" "1f46b64a21f59de793ea7419e708617fb0552279" "bd416c5c98be55fab508e440c3c1baf12769c90d" "917892b4240f6b27473fd9a4c22f96533e7ea9a8" "16d5f5ca2be2dcc8e4eeb3d66a9183f79735df4e" "7e848dfbc0bc930edd8f86d8717d9db746d72eb5" "fe6aa43fb0357311c59fc6126962a414bce0f95c" "b7f071f6aec2729af061cc453ab89d71fa0d6558" "46b022f694a81a7e95d003c8713f32eea5a8b8ba" "47e5d80d612d8fffca684c29fc5d527aa3ce9357" "08e1a2177b3cf9b84324be14625402fc3434ca7b" "aa310f4e589d144cbcd55238a9972927083c1198")
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
