# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="3ac130b0cb40a5e713c978a9cb92ccb213ef0f54"
CROS_WORKON_TREE=("3a5bde4366f90d56997f013eef6eca9ba103af2d" "f283440b701c57221825ce49377ccd964f449ba0" "2d4a432de6b3e49462e7158799f69cd5a0ccb704" "f9c8566d305e3ab3020924a0e28287629dd1db02" "e423dab3e56658991be5a5b7b75646bb63e02336")
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
KEYWORDS="* amd64 x86"
RDEPEND="!chromeos-base/chromeos-config-bsp-nissa"


src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
