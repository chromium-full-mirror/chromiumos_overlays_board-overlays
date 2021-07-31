# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="0cc976984e9b7ae0dfd391818550f003acd2273e"
CROS_WORKON_TREE=("203279cc392aad83994076a00cb7232ffb9e0e55" "43a918dd30ea0a45011e2951c95266b4c4652cc7" "e889e6f7c3822c788c0fe6fbfc38778d4ed1abfb" "383310ecefa4ef8e3ab9a823831aa98adcc38170" "75777f53849ab7b00c2a400b5ca75fd76170d0f6" "4ad1cb2745d76838efb385d612e4fd73edbf1c6f" "5c8522d4b0baf89ff0be08bf78e671e73a67f919" "c759025585c47d2f9241b6d6e74ab784f357d22e" "151ec75781924d0ff48556b458b2b4e44cb6ce29" "b8a430789290ba47b915920e2578b53c501a2499")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"adlrvp"
	"brya"
	"felwinter"
	"gimble"
	"kano"
	"primus"
	"redrix"
	"taeko"
	"vell"
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

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
