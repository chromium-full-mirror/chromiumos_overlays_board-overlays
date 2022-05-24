# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="e992c4d66019f6a9b621524d8c0672b3e87b60c3"
CROS_WORKON_TREE=("7592b4d9e843435dcd2ae9146fb9f9074c91957f" "c9aa43ca4cc89a9799717ca149f4b60d86aeabef" "1573dd23f9266859e381d090d9ee3703bd37dbff" "608de5ca9c77826ae5674bb219b4e9bf500ba4f8" "d572b092d973189e0de513e23399eb16e1199c9e" "6a38caf97b8a1f4ebdf2d1635b4e721fbe16c421" "317f9f53fa94c6b6cc9537a7b75b449d8dd389bd" "4703229ca243bb3a8fe3bb31c27c66822ea80784" "534d36aad8e4498a772b46ee07a04571516096b9" "d7b762443a22de4b02cfbc03e1c5e61a5e85d2ac" "5832400a23f43b56c6b5d7eca354fc1903d52fd0" "48b82e1161938dccbd7a63a6e0ac6c025c7b5e56" "f285f89280681045bb015e1ecc6112d332268755" "1fb22f8b07684950e2fe1e7784ceab0259eb0d2f" "56bc7fc37124dcfff93a399a8c9cf3610bf489f3" "b8a430789290ba47b915920e2578b53c501a2499")
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
	"mithrax"
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
