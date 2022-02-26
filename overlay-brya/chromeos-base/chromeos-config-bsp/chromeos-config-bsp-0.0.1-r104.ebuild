# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="d61a0d6925ea9a0785c60c5dfe865472f804ef3f"
CROS_WORKON_TREE=("7592b4d9e843435dcd2ae9146fb9f9074c91957f" "0c515dbfb405c184aa32bf8da84891eaf111d09e" "45fc6fa626300d9e46808c04e0f9249516b8fbba" "c602636fdd07a07a7345f6e35e7488260d3d4c7b" "42798367db50f4f6807584a90bdfe49ff4d39e6a" "db7d8e326fca6fcc684aa26588e81549bc8129e7" "89505f2fcd102b82fb0c9511c5f6d72b22a58a24" "a509c5f52127f44472a735503d36f55a98325ea2" "17f31361faad2bd9f10f926963df78d6d9926101" "39e59e0a83d559f9c9e1dd94fba9586346acf532" "6d32673ff53097e05d9a6b4289bd1375bc2d9fb9" "f285f89280681045bb015e1ecc6112d332268755" "f7cdf368a87688dc849d5daf52138912367d9755" "db15310cf7d28b1cb82b7c21c4aedb40620896ca" "b8a430789290ba47b915920e2578b53c501a2499")
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
