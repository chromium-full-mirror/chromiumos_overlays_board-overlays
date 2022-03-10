# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="e331ef96e6c40e235af7e92da312553ce4ecc7ca"
CROS_WORKON_TREE=("7592b4d9e843435dcd2ae9146fb9f9074c91957f" "0c515dbfb405c184aa32bf8da84891eaf111d09e" "45fc6fa626300d9e46808c04e0f9249516b8fbba" "c602636fdd07a07a7345f6e35e7488260d3d4c7b" "5ffda1ae3c3a2dd950da2fc2bd5909299bf2b602" "2715bdd4aa5ca69b947bfa41d3ae623aa6b604a6" "4704ded1b56f4462d75c218f2aa8f1a891ce297f" "b28705e6f7818350a7a63f5bbae432bb7bd5055b" "17f31361faad2bd9f10f926963df78d6d9926101" "303402ecf625a674caf6cd8e3b96da99fed7e77d" "35a5111af429451111ca088ca50494a3fac60012" "f285f89280681045bb015e1ecc6112d332268755" "1fb22f8b07684950e2fe1e7784ceab0259eb0d2f" "d23a5ac5cf0bb7d5eea3efb5b0011c1f52c6e63d" "b8a430789290ba47b915920e2578b53c501a2499")
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
