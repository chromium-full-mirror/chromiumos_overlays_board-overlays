# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="5ffa9adaa34d95e5b9a8884b58e44daab034d5de"
CROS_WORKON_TREE=("a0b0d5b4db27d76957d50b1bc016d86b015bfb5c" "a78441aabbf4518302b6f258f619761980fc0c6e" "7a48687d1beb2b5014cf4be5ef19133a2d6e9fb6" "25e2eab1b925251c6555678a34a7d6abe2a40569" "01301ed9d572d2e03b557ed2e1b94ba821dddffc" "f848ad5324c2590b2ecfc7a46f6d304d3b5f828d" "bbf3e400a04aadd88b9a140986118c2ebd084d7e" "c509c17edb19ffe1d10cb7d6feb46131f0cb0c7d" "8be01948d2b23430c30e9cf1b0936c7bc61e23d1" "a5c11b983fd4a718c0740cdb4586f06333433ff7" "41c9c2031a4b91131380754db1d9c7de0fe7bd2e" "884cfd0e72357c70eebe45e589d0c0bd0d83ee44" "3a52f4f6b650ab49d86c2e09271ea9b3cdfdadd3" "b8be0fe304e41a38309797502b47585e9e29b188" "c1dd3bf54220b2e1f70815b487b2e57d111d73ae" "d1408021004c2d2337e5a7e84cdcb9cb749231c5" "b707b62e4a7bc8670cc9428ab39c2994eeb7ae87" "56aca749661ad87c7a87e7220974c86e0d82a1d1")
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
