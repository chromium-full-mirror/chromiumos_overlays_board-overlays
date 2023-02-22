# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="68a78cc19b00e8867c9122cdf0981a7f8b6e1750"
CROS_WORKON_TREE=("520cf6c3540793dae8bf02b198e74fa31f36521e" "8c0dd25a7ff25ca28d1017f9819e04b5e19c21b7" "1aa6e7abbe033e88b30de90c2938d25852a018c8" "917aaff54fe88b56bf54743fd509118af1650e95" "8439c36419c54137cfa33279b6e8d99d798ed076" "607a701d8497644c7b2978442d8f70bc807f6fb8" "785a9424bc663c3a5e4c0db3070f9b9ba7b3c3eb")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"waddledoo2"
	"lalala"
	"cappy2"
	"driblee"
	"corori"
	"gooey"
	"haboki"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "$(printf "keeby/%s/${CONFIG_PATH} " "${PROJECTS[@]}")" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( keeby )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for keeby"
HOMEPAGE="https://www.chromium.org/chromium-os"
SRC_URI=""

LICENSE="BSD-Google"
SLOT="0/${PF}"
KEYWORDS="* amd64 x86"
RDEPEND="!chromeos-base/chromeos-config-bsp-keeby"


src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
