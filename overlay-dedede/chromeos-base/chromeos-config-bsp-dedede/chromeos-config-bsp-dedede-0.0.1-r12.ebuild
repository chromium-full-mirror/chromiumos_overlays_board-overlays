# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="d7b667da4ac49be41840c74324125e8edc7e72a1"
CROS_WORKON_TREE=("b72e997c45c939d91d8b6a021f7815ea762d7639" "b32afedfb1e4b976e710942ed86da19b1fd1cb93" "36fc84e1f75911b4951aa7e68aedf34cf761ebc9" "97799d3028d44002bb126215259b9ca3e1c0244f" "42ccb9abc86ac751c6f9203fc0d662408a384ade" "6f61fd7db5ce0b3053960d3e0cb2c7d11210ce58" "4d9774801321a2e7b2e88fb8242adde4a3d1b98e" "7e733848164da8daa6ff859c55c3c24bf3416a57")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
    "boten"
    "drawcia"
    "jslrvp"
    "madoo"
    "magolor"
    "waddledee"
    "waddledoo"
    "wheelie"
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

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
