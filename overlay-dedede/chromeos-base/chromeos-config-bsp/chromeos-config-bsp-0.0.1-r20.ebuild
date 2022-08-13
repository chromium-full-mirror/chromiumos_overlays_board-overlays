# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="5efb444207e976aa0a3b5379487eb249b510d998"
CROS_WORKON_TREE=("50c19d795cfd2016f05757ffe5258837674256ef" "ff1022c10d2b4525bf188e0aafd829587fa1adfc" "3030a03c7c1cdd97a9bc8b36c96ea91c47c9802f" "f95959504fb3a9c7153b2a7eda14fd92a33eb79b" "0c812acf371ca50192990c4fa8dfcc93ea52351a" "8b54012cea86326fcff3c4596a6cffbf449dff9e")
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
