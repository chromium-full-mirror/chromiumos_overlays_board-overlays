# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="c35f597cc39fc9e238340cb6d0feeb6b79d618f6"
CROS_WORKON_TREE=("0cf53ce56f04f7d9565fe3ccbdecb19aad76f2b2" "367f282bc0b93887347b25d9235f007e561a3da1" "f26221c990f8b0d654c4beb04ba4d16c0fd032d8")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"cherry"
	"dojo"
	"tomato"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "$(printf "cherry/%s/${CONFIG_PATH} " "${PROJECTS[@]}")" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( cherry )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for cherry"
HOMEPAGE="https://www.chromium.org/chromium-os"
SRC_URI=""

LICENSE="BSD-Google"
SLOT="0/${PF}"
KEYWORDS="*"
RDEPEND="!chromeos-base/chromeos-config-bsp-cherry"


src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
