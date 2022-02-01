# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="3e57baa30462d6419d70a801c03e1dd0e238e388"
CROS_WORKON_TREE=("a587e57bf9b1c7559242708a9ab220408e4398ee" "4e640dc394d4021c03e949255e0f965e23044ec0" "0e3554a259e7cf13758a099c0c3a5bbe5bd8a75e" "2f147ad44771e05aef6a177aef9dbd024a7d6cef" "42798367db50f4f6807584a90bdfe49ff4d39e6a" "860c9f421f7e7659c43f5e76b81a79f0d476a6e7" "2d8a6204b64f847df5a12cd10ef01806274e97e0" "837a31657275b6e01058fb3583587f0e7d73f457" "3515548494c8c61a1824731317b2114db6d8f701" "3c1a1549b9a875831d859eb120d2de19dd0b7e5c" "e7b5f9eb1a454940980e9e6d7d5efddc2553c1da" "f41286b9a621fd9c076ffa5a075a26dd21cb42ac" "a9344a43dbf7d8a2831169b784b465c36612d693" "8dd0cfac7db039f4d7b6aeb9b6799e596aa4efa1" "b8a430789290ba47b915920e2578b53c501a2499")
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
