# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="82a4b7a4c9aa56e41bc183891d33498daead17a9"
CROS_WORKON_TREE=("0abd8e86b6feae994290bfea448a1824f9ce3816" "b261b329cc582427c11f748547432526d4c260aa")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"rex"
	"mtlrvp"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "$(printf "rex/%s/${CONFIG_PATH} " "${PROJECTS[@]}")" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( rex )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for rex"
HOMEPAGE="https://www.chromium.org/chromium-os"
SRC_URI=""

LICENSE="BSD-Google"
SLOT="0/${PF}"
KEYWORDS="* amd64 x86"

RDEPEND=""

src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
