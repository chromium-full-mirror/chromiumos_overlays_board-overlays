# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="c1a4274dd9c5cae7e094f49875583927b35c33ed"
CROS_WORKON_TREE=("a587e57bf9b1c7559242708a9ab220408e4398ee" "7cc5b05b993a75453a47951d9f9b84e4f14e6c1c" "4c4dc8fa3dc88b245997ebc4dfb9a81376b81ac8" "e889e6f7c3822c788c0fe6fbfc38778d4ed1abfb" "d8b1d849446d8fb82418e4941dbaf156fe566805" "75777f53849ab7b00c2a400b5ca75fd76170d0f6" "f1e4da2ddfef38540f8e0eb3cdedb36100fa4ec2" "da08afddd184cf18bb5b2b8903af13847531a51f" "c759025585c47d2f9241b6d6e74ab784f357d22e" "151ec75781924d0ff48556b458b2b4e44cb6ce29" "b8a430789290ba47b915920e2578b53c501a2499")
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

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
