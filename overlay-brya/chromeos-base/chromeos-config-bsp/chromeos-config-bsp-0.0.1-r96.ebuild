# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="2d9adf07726ba155302e11cfe453d65afeac878b"
CROS_WORKON_TREE=("68eeeb2d5f5bbfe6f01ffcbda9e6a5a1ffdde61c" "4e640dc394d4021c03e949255e0f965e23044ec0" "78046752386f2588e1771671729dcadd5e1211ea" "2f147ad44771e05aef6a177aef9dbd024a7d6cef" "42798367db50f4f6807584a90bdfe49ff4d39e6a" "860c9f421f7e7659c43f5e76b81a79f0d476a6e7" "2d8a6204b64f847df5a12cd10ef01806274e97e0" "837a31657275b6e01058fb3583587f0e7d73f457" "3515548494c8c61a1824731317b2114db6d8f701" "3c1a1549b9a875831d859eb120d2de19dd0b7e5c" "e7b5f9eb1a454940980e9e6d7d5efddc2553c1da" "f41286b9a621fd9c076ffa5a075a26dd21cb42ac" "a9344a43dbf7d8a2831169b784b465c36612d693" "e69d82564c38f86a1d2a8ce1e53bb05a76e60549" "b8a430789290ba47b915920e2578b53c501a2499")
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
