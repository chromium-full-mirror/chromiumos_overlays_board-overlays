# Copyright 2020 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="ce176c12872faaa9c7e7fedc6cc515a55a99c7f8"
CROS_WORKON_TREE=("ec0260f3f96214c7015cc5eba06e6c7bae0b28be" "c4fa094fb3f496c846de81a05c9ab99e7f85c56c" "02da684fb1291b2b278ce6566235e4793f4a01a0" "b9d6364552d1cf4f250ef27ffacb751142330ae6" "5211b9f751746a9884078e0c35f0bdc33f3bb1e7" "c8787dbe34466129ad271e7efa6119f23d96e109" "a820fb08be532412493429c4fb5db48b439b89c1" "cc05301af7603feef85112883be7b85ca8c82a1c" "6bc33f5da4622642d0a19172c2642f21f477948b" "6e276cc387606f134f0e013902dad6102d5b51a6" "9c38c1c3f1b23d462ce936a48c57dc5eb1f5066e" "08e1a2177b3cf9b84324be14625402fc3434ca7b" "46f9292ad47426dcdc4fc0f278229dfd128a4644")
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
