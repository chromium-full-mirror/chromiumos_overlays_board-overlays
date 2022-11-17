# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="9508fdda831a3a5877527c1d71c6eb49fa8802e7"
CROS_WORKON_TREE=("136e67f603bc62953d281c9b4664be4f2abac47d" "f961e6c1323d8857675b02cf50bf28508b38bcb7" "97c1518fffc62ace77f7b72be1e15065ec49fcde" "bac5bcfedfed581c0e1f3dc2817d9d816a6732b4" "7b3d7486b95e43c9c962f70321e698893e0a9f1f" "ce05db0452d613c409905999c8942f7db42cc2c0")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"brask"
	"gladios"
	"kinox"
	"kuldax"
	"lisbon"
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
