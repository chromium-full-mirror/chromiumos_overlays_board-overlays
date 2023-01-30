# Copyright 2020 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="5ffa9adaa34d95e5b9a8884b58e44daab034d5de"
CROS_WORKON_TREE=("345e632c290214dd930d8d53c67b7777184d7f40" "f882e976490def913c85445b400e7c65d982de09" "dc9617c0668c91d1aabd29dd2499ab0063552095" "ff2e32379599c6b38a6417e918ae2d541d1c6e33" "efe38cd029d1e2300ef7ae364f0465d74399bc9e" "0d77611a19d9d8bf5d94973fa16e0d865f01015e" "c95a61641f5509c33b54972248484baef76a12f1")
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
