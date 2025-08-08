# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="a10485355ac0f1ae39205a1850a7c57d72f5513b"
CROS_WORKON_TREE=("3a5bde4366f90d56997f013eef6eca9ba103af2d" "f283440b701c57221825ce49377ccd964f449ba0" "6d8292c1673370fae095b2b10c1db2c9645f3990" "d0f9e63cf382386de3b366358e3e28aa4ae57235" "fa308ea4f9f7626eef3830edbf22a8bec3cf890d" "2d4a432de6b3e49462e7158799f69cd5a0ccb704" "de2c9c97bfead9c4bcde3b90d9ab287d0ae7d286" "ac48e923824509ee41ec11327f3d93f0efe253e0" "f7842f63eced463eb0ef2ded9dc088bb640ee74d" "506458a091fe243c58d4e260eeaa2957662c233d")
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
