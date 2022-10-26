# Copyright 2020 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="781bfbbf1e496bb30574587ae9a062fd577be4af"
CROS_WORKON_TREE=("50c19d795cfd2016f05757ffe5258837674256ef" "dc700b3db665ae80a06cd14215126d3a8c47c8db" "3030a03c7c1cdd97a9bc8b36c96ea91c47c9802f" "79408c85a00d0675853322611ded69cf0b93574f" "0c812acf371ca50192990c4fa8dfcc93ea52351a" "8b54012cea86326fcff3c4596a6cffbf449dff9e")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
    "boten"
    "drawcia"
    "madoo"
    "magolor"
    "waddledee"
    "waddledoo"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "$(printf "dedede/%s/${CONFIG_PATH} " "${PROJECTS[@]}")" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( dedede )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for dedede"
HOMEPAGE="https://www.chromium.org/chromium-os"
SRC_URI=""

LICENSE="BSD-Google"
SLOT="0/${PF}"
KEYWORDS="* amd64 x86"
RDEPEND="!chromeos-base/chromeos-config-bsp-dedede"


src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
