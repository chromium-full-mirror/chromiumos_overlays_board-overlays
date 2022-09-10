# Copyright 2020 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="e629fb1250ae475d1b0351f669a510568e8c6b6e"
CROS_WORKON_TREE=("4951ae8f5a21ab54e428926debcff7c9697ba08e" "21b42290a1c1eb719225a1100b1656b5b855d0ee" "155d91881e795941d389f529c914e34dbde9e608" "07aa4fe45662aa14d9cb85bbbd30ef8739433973" "bccef537d1aa58b0f1e668c4bc6304cc1d42699e" "eb04823dba17c279d12b694f10b26ed40de45063" "55b7bafd9fbc786e203636dfde236c010f2f07bf")
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
