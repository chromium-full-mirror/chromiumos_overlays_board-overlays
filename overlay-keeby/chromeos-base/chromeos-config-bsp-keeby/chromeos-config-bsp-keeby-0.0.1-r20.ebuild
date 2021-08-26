# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="7ea00fbb4194ea7666c7cad8a82519b7dfd76b97"
CROS_WORKON_TREE=("24b737cd5eb29d6d09a4d0fde3090890aebae1df" "f39402b78e392b8f1c2bc27a08c27352696b826b" "228b3c8d1ef7f86089ae058b51112b58b1eef9b2" "5c60cb952764ccfb6a8a5e15119b6fdef5603b58" "3d66263f83485742f40e1edbc65e502d47a8c806" "5ed6c5c0483ee0dcef3fce9fa26e7347cbdb66a6" "685973b43334086c40c2cad01d89cad3c04db184")
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

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
