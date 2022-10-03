# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="c1bbab280990dcee14536fe11028c220dcaab660"
CROS_WORKON_TREE=("654261d3fefa775bf26694a991acb83ddc588c4c" "6c87b6087a93e2e3383a53274ed136fd62d3f2e2" "883c777e615995386f6310ce65a123b498e301c9" "933fa635bef13ad735ca08574ff06d2022dd30f0")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"brask"
	"kinox"
	"kuldax"
	"moli"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "$(printf "brask/%s/${CONFIG_PATH} " "${PROJECTS[@]}")" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( brask )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for brask"
HOMEPAGE="https://www.chromium.org/chromium-os"
SRC_URI=""

LICENSE="BSD-Google"
SLOT="0/${PF}"
KEYWORDS="* amd64 x86"
RDEPEND="!chromeos-base/chromeos-config-bsp-brask"


src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
