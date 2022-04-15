# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="f335b0e52e1e4a7f6947697bd832122d3778c3a4"
CROS_WORKON_TREE=("e6b2823edeb29680e1d21bd7bcb6f6bb0041f1f2" "c4fa094fb3f496c846de81a05c9ab99e7f85c56c" "655f00f4038b21fcc95ff8d40cfb89d89322576d" "a9acd43e74208071913d79301fd03c700a479e11" "9b4005485c2e730ba95a4fbd7184c94fb0a92afb" "67a093a22f8b5dcc72e897d13e648f21144d9b87" "63761b30e331a3c1a33dd3e8daf5a0c6f8322151" "03482ae6d016d04420634f690469631887c36a26" "daf964fe0817002875d89a2fae27607d4a5c54dd" "00198f15f208b74002f891b3d1457a24182037fa" "32ccea03f29ded55b8bdb8c21a13179a9b408ca9" "3e60d2235e590f60bb22a682cc3e2cee0cde6f08" "145f6f3525ffa1a053c7887c78b829333488eacf")
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
