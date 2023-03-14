# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="5cc87fae5680d0a168c7c46d10ecc902dcf2ba55"
CROS_WORKON_TREE=("7901b6dfccda704a689b4370731beb1e3b191db3" "b261b329cc582427c11f748547432526d4c260aa")
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
