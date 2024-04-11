# Copyright 2023 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="c26c93a9a14595f47820b25170d89a529ce9aa80"
CROS_WORKON_TREE=("5f4ca128f5014163c44ccfdeea38bf73728d946f" "b4808b7f685fe7f81cc9ed2089ef154bf2985727")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"brox"
	"lotso"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "$(printf "brox/%s/${CONFIG_PATH} " "${PROJECTS[@]}")" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( brox )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for brox"
HOMEPAGE="https://www.chromium.org/chromium-os"
SRC_URI=""

LICENSE="BSD-Google"
KEYWORDS="* amd64 x86"

RDEPEND="!chromeos-base/chromeos-config-bsp-brox"

src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
