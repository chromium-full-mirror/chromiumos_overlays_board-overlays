# Copyright 2023 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="d01b3e46853527ee452261df2b989efa90d9b1da"
CROS_WORKON_TREE=("ea857c9cb81eedd0d0de75ebea51a799caafabeb" "4b448818c860d5a02c7d4ab063d234864ddc4d21")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"cora"
	"hades"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "$(printf "hades/%s/${CONFIG_PATH} " "${PROJECTS[@]}")" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( hades )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for hades"
HOMEPAGE="https://www.chromium.org/chromium-os"
SRC_URI=""

LICENSE="BSD-Google"
SLOT="0/${PF}"
KEYWORDS="* amd64 x86"
RDEPEND="!chromeos-base/chromeos-config-bsp-hades"


src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
