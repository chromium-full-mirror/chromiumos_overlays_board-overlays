# Copyright 2023 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="6af1666a6ffa81cdf47e7bd5961e5144ca8bb10c"
CROS_WORKON_TREE=("fdb5897c1f5b62500369702b0e7e2510fda8c32d" "2a0f22843c349c9c4ff42e7cc37397944a9c23ad")
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
