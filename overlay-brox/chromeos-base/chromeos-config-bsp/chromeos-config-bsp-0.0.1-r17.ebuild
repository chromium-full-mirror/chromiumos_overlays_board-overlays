# Copyright 2023 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="1e68fd97fa2e48b0ee2081f310e50dbd6d1a4cde"
CROS_WORKON_TREE=("422fec0d66b96c581b3465d1c59ba8d828041e6b" "5b6b082e494c8ae4fb789fac3fd10a1e9c2d71c0")
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
