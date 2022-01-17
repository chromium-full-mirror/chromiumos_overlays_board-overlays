# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="ced07ce99a8444a1dbefd87038afc70f13b9d722"
CROS_WORKON_TREE=("a587e57bf9b1c7559242708a9ab220408e4398ee" "d20490f9c379636d255b7a1abc905f220c65693b" "425982e6aafa89cfb7f7888a18bcce1e92188378" "b900c74e95ca17166e99d56cfb8b229657d1ef0b" "228e85f32d174349ed6f542f6b4f2d23c10f859e" "86fe21b7178d573b61aca2d98a589b3bc190f700" "6b19d6118c21802031c8230fc1e81b0aa1d18e60" "837a31657275b6e01058fb3583587f0e7d73f457" "4e1c32de8f2528406e1585194ea4ce2b60a5f279" "326bb63714a7b9dee2afb0cde217b0cdd8d722db" "06628ea68ef7980e039b09922e5498837517694b" "e6d6c7652eba790653527aa81b43364ebeaec8c9" "e26d85f1e5031562e45ad9b2fc04ffdd0990407b" "4c98d69971ee7791d08f0248968f61f58ecfdd26" "b8a430789290ba47b915920e2578b53c501a2499")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"adlrvp"
	"anahera"
	"banshee"
	"brya"
	"crota"
	"felwinter"
	"gimble"
	"kano"
	"primus"
	"redrix"
	"taeko"
	"taniks"
	"vell"
	"volmar"
	"vyhar"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "$(printf "brya/%s/${CONFIG_PATH} " "${PROJECTS[@]}")" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( brya )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for brya"
HOMEPAGE="https://www.chromium.org/chromium-os"
SRC_URI=""

LICENSE="BSD-Google"
SLOT="0/${PF}"
KEYWORDS="* amd64 x86"

RDEPEND="!chromeos-base/chromeos-config-bsp-brya"

src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
