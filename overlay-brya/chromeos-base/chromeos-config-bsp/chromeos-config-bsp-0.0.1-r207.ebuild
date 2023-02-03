# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="774a6c93284f29f02bdeb275d8ddff0014831e35"
CROS_WORKON_TREE=("a0b0d5b4db27d76957d50b1bc016d86b015bfb5c" "a78441aabbf4518302b6f258f619761980fc0c6e" "7a48687d1beb2b5014cf4be5ef19133a2d6e9fb6" "25e2eab1b925251c6555678a34a7d6abe2a40569" "01301ed9d572d2e03b557ed2e1b94ba821dddffc" "2854cf3b50916c2ebbadbb0d1b6cc2896f251e10" "5b161cc5adb0f9cd0e9546878c85a65b129419ee" "c509c17edb19ffe1d10cb7d6feb46131f0cb0c7d" "8be01948d2b23430c30e9cf1b0936c7bc61e23d1" "a5c11b983fd4a718c0740cdb4586f06333433ff7" "41c9c2031a4b91131380754db1d9c7de0fe7bd2e" "884cfd0e72357c70eebe45e589d0c0bd0d83ee44" "3a52f4f6b650ab49d86c2e09271ea9b3cdfdadd3" "b8be0fe304e41a38309797502b47585e9e29b188" "49aa2e3508fa6d014fb153a63e09e7864972f468" "d1408021004c2d2337e5a7e84cdcb9cb749231c5" "b707b62e4a7bc8670cc9428ab39c2994eeb7ae87" "a037a4097101efde68afaf9536b62437e651e7f0")
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
	"osiris"
	"primus"
	"redrix"
	"skolas"
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
