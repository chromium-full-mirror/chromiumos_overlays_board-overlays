# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="e04b300c46261c0c930c8a471865d760bbf37272"
CROS_WORKON_TREE=("3a5bde4366f90d56997f013eef6eca9ba103af2d" "f283440b701c57221825ce49377ccd964f449ba0" "5b885a68654df0553c5875596748476191dfc5ca" "d0f9e63cf382386de3b366358e3e28aa4ae57235" "fa308ea4f9f7626eef3830edbf22a8bec3cf890d" "2d4a432de6b3e49462e7158799f69cd5a0ccb704" "de2c9c97bfead9c4bcde3b90d9ab287d0ae7d286" "4b11892b26053e349e78491335ced7515ce119d5" "3921f21f7b24b6074deb0596293a1efa9ce0572c" "506458a091fe243c58d4e260eeaa2957662c233d")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"adlnrvp"
	"craask"
	"dirks"
	"guren"
	"meliks"
	"nereid"
	"nivviks"
	"pujjogatwin"
	"pujjoniru"
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
