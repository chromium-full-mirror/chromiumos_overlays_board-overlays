# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="5ffa9adaa34d95e5b9a8884b58e44daab034d5de"
CROS_WORKON_TREE=("c3b463debbb22e556ffb6671a664bcaf8ca8e9dc" "0bcb4c89fcec98034e63610142a7fc0345a01812" "3770e14bf527176faae4a3e841fb5d48d1c0caa3" "03a62a335f2af8a4d80ff2326a7c15a13e4ca8d3" "e2d5fc1d0809af92d6ecde7ba7575aa82158cf3d" "203b8da94a18960e8f4657796f6ac82b644440a2" "57c34302d41576c29ff53a59ae2d7070df6bbbcb")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"evoker"
	"herobrine"
	"hoglin"
	"piglin"
	"villager"
	"zoglin"
	"zombie"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "$(printf "herobrine/%s/${CONFIG_PATH} " "${PROJECTS[@]}")" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( herobrine )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for herobrine"
HOMEPAGE="https://www.chromium.org/chromium-os"
SRC_URI=""

LICENSE="BSD-Google"
SLOT="0/${PF}"
KEYWORDS="*"
RDEPEND="!chromeos-base/chromeos-config-bsp-herobrine"


src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
