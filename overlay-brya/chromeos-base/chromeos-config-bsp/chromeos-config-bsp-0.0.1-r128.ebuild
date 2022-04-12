# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="9dac1c8970873936abd9e0e832941ae483cfbe98"
CROS_WORKON_TREE=("7592b4d9e843435dcd2ae9146fb9f9074c91957f" "c24a0192086683fc2908685d1c49294380faa122" "1573dd23f9266859e381d090d9ee3703bd37dbff" "608de5ca9c77826ae5674bb219b4e9bf500ba4f8" "b70a369c7cabfaafc4c93706ac2b16ed86d605c4" "6a38caf97b8a1f4ebdf2d1635b4e721fbe16c421" "06bf17ff8d9919a19eba4a132bec723c877ac889" "267656986e447eded6e5e2ca9bba671b57c9a29d" "d7b762443a22de4b02cfbc03e1c5e61a5e85d2ac" "83c076b6bffab1fe66b1d7f874135cdce32c89f4" "2bbd311ca3c7349528759e7c1c763fde0de04470" "f285f89280681045bb015e1ecc6112d332268755" "1fb22f8b07684950e2fe1e7784ceab0259eb0d2f" "56bc7fc37124dcfff93a399a8c9cf3610bf489f3" "b8a430789290ba47b915920e2578b53c501a2499")
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
