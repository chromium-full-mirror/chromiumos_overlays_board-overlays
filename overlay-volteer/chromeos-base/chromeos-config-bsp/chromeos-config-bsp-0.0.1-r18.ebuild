# Copyright 2020 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="68a78cc19b00e8867c9122cdf0981a7f8b6e1750"
CROS_WORKON_TREE=("fa22eba1d2f8a0a18d03c9fe16d84f8edf980af8" "c4fa094fb3f496c846de81a05c9ab99e7f85c56c" "016532c123750e5a4bd7ed5f787c7b33e43cc10b" "9b76d63edae4ab80ed259712147ac16568fd3dbb" "a889fe71179255a8fe1d867555a5f3b13bce75c2" "e61ab33dbdc4f4ffc5c7269b91b4c9ed2ea3db3d" "db7fe5bf1fc7134549bd3c68cbe2fefe1dfb9778" "389ce242266631617a9a6b6fee6e609bc206fffa" "902d049f93a46f4d1c99ead0aa22c8395635b66a" "ae6e2a26a5c534a67b76b33cf4c62cb9cb0017f9" "c1eed046583c4dadc7bbc0034c40612a8cc3065c" "bb04aa1646bb4997fe85ab318b7f8ccead6c7fe7" "306a46b484f09354c90e2fc31e232369661998f5")
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
