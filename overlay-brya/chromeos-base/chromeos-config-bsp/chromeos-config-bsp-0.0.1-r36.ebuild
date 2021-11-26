# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="5026ec4ca372d0d7aeb3e4f012a283e8bdf6fdfe"
CROS_WORKON_TREE=("a587e57bf9b1c7559242708a9ab220408e4398ee" "54789166cbf2c4c89acbbbfad006ac9ec8e33298" "9f3e735ddd737a33d0a9948df60be216f083410e" "228e85f32d174349ed6f542f6b4f2d23c10f859e" "15352b25ed653090107bf1ed6fc58ce70fdcff5d" "57c750f0476fcf276e26476c4630426dbaca7551" "880e1d372b356593fff1fa88376363af48cf3fc4" "929fbd5ba1453109f798a50d81e24f42d5093411" "b73414bd7f54e1ec3b00995a248f7ebdcf54380c" "6635d493f9502f788e5627e8d0c825be1eadc91f" "2cb633d4ca569585df85b0ac150fa02897320884" "e26d85f1e5031562e45ad9b2fc04ffdd0990407b" "b8a430789290ba47b915920e2578b53c501a2499")
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
