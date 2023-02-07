# Copyright 2020 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="ce176c12872faaa9c7e7fedc6cc515a55a99c7f8"
CROS_WORKON_TREE=("dad4d02613d3bd63a9d9026653f583bd9cef3efa" "d5c27919c5dafd65de410cdb5b870f136ff4a4c2" "821d0fb2cb51ec7149d25b5fa405b80abc709a60" "922f396f5a1c574db4c6fe058c5cac48ff89b1bf" "4737220e6a85b7b9f19d1348be8c27f8e973e3b9" "871598833667cf9d094077fec7a00ec36e8217e9" "bdbd01363e93e3927993d27d28d239332284374e")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"dooly"
    "duffy"
    "faffy"
    "kaisa"
    "noibat"
    "puff"
    "wyvern"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "$(printf "puff/%s/${CONFIG_PATH} " "${PROJECTS[@]}")" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( puff )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for puff"
HOMEPAGE="https://www.chromium.org/chromium-os"
SRC_URI=""

LICENSE="BSD-Google"
SLOT="0/${PF}"
KEYWORDS="* amd64 x86"
RDEPEND="!chromeos-base/chromeos-config-bsp-puff"


src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
