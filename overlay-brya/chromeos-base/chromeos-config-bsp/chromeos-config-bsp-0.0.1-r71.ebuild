# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="bb6162860b82d7253e7b8aec4a6c1d58b118f7b8"
CROS_WORKON_TREE=("a587e57bf9b1c7559242708a9ab220408e4398ee" "148adb95795417fe8c07c2e7d0935d750aa88d1f" "0950f9c4648f843711122c4e8d6acb1b5408d0c2" "228e85f32d174349ed6f542f6b4f2d23c10f859e" "86fe21b7178d573b61aca2d98a589b3bc190f700" "2d8a6204b64f847df5a12cd10ef01806274e97e0" "bcc6af413706c9a3517f8423b446682d130845bc" "3515548494c8c61a1824731317b2114db6d8f701" "326bb63714a7b9dee2afb0cde217b0cdd8d722db" "06628ea68ef7980e039b09922e5498837517694b" "e6d6c7652eba790653527aa81b43364ebeaec8c9" "e26d85f1e5031562e45ad9b2fc04ffdd0990407b" "4c98d69971ee7791d08f0248968f61f58ecfdd26" "b8a430789290ba47b915920e2578b53c501a2499")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"adlrvp"
	"anahera"
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
