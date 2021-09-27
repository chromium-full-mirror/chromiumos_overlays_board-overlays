# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="b51e0ff164e3301b13604d24de0ee3d79acf117b"
CROS_WORKON_TREE=("a587e57bf9b1c7559242708a9ab220408e4398ee" "ab7b04726e82f152585e6592816aee3fa2c7c835" "3143a44104cb68a0e3fde89fd158e75e030f5e1a" "9e973673911d3822dc265a6dcd184b5da7b153bc" "8577ed34f1e8aa67c0d99f887e55da4b0d5d47ef" "9fe28fee2a1ec64df67f9c867e37739516cdddac" "f7f5da90b413164f4b7bc1290b8b334da821df62" "675b47b476a66b43f93a8665f8f9686d7ec1080e" "b9fa7ef5a41f4d60df34beea52ccde18ade91d78" "151ec75781924d0ff48556b458b2b4e44cb6ce29" "b8a430789290ba47b915920e2578b53c501a2499")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"adlrvp"
	"anahera"
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

RDEPEND="!chromeos-base/chromeos-config-bsp-brya"

src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
