# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="020b50c8adc0c9b52545a89d0ef2ea4e79ca3728"
CROS_WORKON_TREE=("3a5bde4366f90d56997f013eef6eca9ba103af2d" "f283440b701c57221825ce49377ccd964f449ba0" "6d8292c1673370fae095b2b10c1db2c9645f3990" "d0f9e63cf382386de3b366358e3e28aa4ae57235" "fa308ea4f9f7626eef3830edbf22a8bec3cf890d" "2d4a432de6b3e49462e7158799f69cd5a0ccb704" "de2c9c97bfead9c4bcde3b90d9ab287d0ae7d286" "d36e9ba4a84f4af361156a7ac3e2ea4b2090ba7d" "74e171403487eb6fe7fdd06fb80a02df6da86910" "506458a091fe243c58d4e260eeaa2957662c233d")
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
