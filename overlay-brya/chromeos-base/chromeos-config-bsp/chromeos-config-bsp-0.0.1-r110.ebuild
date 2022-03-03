# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="2e0b89e3f24c6f4d2d8439eba23bc63941f791e3"
CROS_WORKON_TREE=("7592b4d9e843435dcd2ae9146fb9f9074c91957f" "0c515dbfb405c184aa32bf8da84891eaf111d09e" "45fc6fa626300d9e46808c04e0f9249516b8fbba" "c602636fdd07a07a7345f6e35e7488260d3d4c7b" "5ffda1ae3c3a2dd950da2fc2bd5909299bf2b602" "2715bdd4aa5ca69b947bfa41d3ae623aa6b604a6" "89505f2fcd102b82fb0c9511c5f6d72b22a58a24" "79b963bc0d29d054a14d0b11352676e2a7093834" "17f31361faad2bd9f10f926963df78d6d9926101" "39e59e0a83d559f9c9e1dd94fba9586346acf532" "35a5111af429451111ca088ca50494a3fac60012" "f285f89280681045bb015e1ecc6112d332268755" "a5143f5ead9d6d226dbee3696bc5b047a755fd41" "4672ea029a12c839d33a18dfcd586f4f2f77c79d" "b8a430789290ba47b915920e2578b53c501a2499")
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
