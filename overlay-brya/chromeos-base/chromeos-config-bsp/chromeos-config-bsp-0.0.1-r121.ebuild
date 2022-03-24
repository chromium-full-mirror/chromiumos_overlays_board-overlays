# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="edd03d53cac2d9f51c7c213e1d0e9a7249c1a1cc"
CROS_WORKON_TREE=("7592b4d9e843435dcd2ae9146fb9f9074c91957f" "0c515dbfb405c184aa32bf8da84891eaf111d09e" "1573dd23f9266859e381d090d9ee3703bd37dbff" "c602636fdd07a07a7345f6e35e7488260d3d4c7b" "5ffda1ae3c3a2dd950da2fc2bd5909299bf2b602" "2715bdd4aa5ca69b947bfa41d3ae623aa6b604a6" "06bf17ff8d9919a19eba4a132bec723c877ac889" "b28705e6f7818350a7a63f5bbae432bb7bd5055b" "d7b762443a22de4b02cfbc03e1c5e61a5e85d2ac" "644f8528f47149b2e392cb10c2b73d1f0128a613" "aa0e81eadde1bf5d157e79feb17fae85ea7a6454" "f285f89280681045bb015e1ecc6112d332268755" "1fb22f8b07684950e2fe1e7784ceab0259eb0d2f" "56bc7fc37124dcfff93a399a8c9cf3610bf489f3" "b8a430789290ba47b915920e2578b53c501a2499")
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
