# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="8100a8b22b9c77451e285be1ee9f24b77da037bc"
CROS_WORKON_TREE=("8b8f1300ad140112f644adcc49920984c18b4fc5" "68250f472371c799503085f35e3217b81b55db2e" "7414cbce37789c7d85b94cc15c3ddfc55ef9e1b4" "d084df20b9fb50fa59f40d81a089294f074c8578" "425b8dd1a6daa3b01978055ef0514ccc2392535c")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"adlnrvp"
	"craask"
	"nereid"
	"nivviks"
	"quandiso"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "$(printf "nissa/%s/${CONFIG_PATH} " "${PROJECTS[@]}")" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( nissa )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for nissa"
HOMEPAGE="https://www.chromium.org/chromium-os"
SRC_URI=""

LICENSE="BSD-Google"
SLOT="0/${PF}"
KEYWORDS="* amd64 x86"
RDEPEND="!chromeos-base/chromeos-config-bsp-nissa"


src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
