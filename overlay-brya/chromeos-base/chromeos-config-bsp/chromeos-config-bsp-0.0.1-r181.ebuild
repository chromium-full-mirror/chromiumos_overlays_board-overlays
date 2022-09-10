# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="e629fb1250ae475d1b0351f669a510568e8c6b6e"
CROS_WORKON_TREE=("a37d8a0e15aaaac42591d0cd01588207a56578e4" "bccb3dcf6727cb1e2d6b69331040e3e835dbc8e4" "1573dd23f9266859e381d090d9ee3703bd37dbff" "608de5ca9c77826ae5674bb219b4e9bf500ba4f8" "17f75d7e28d6ec27b725f20ec9f6598e994abc59" "6a38caf97b8a1f4ebdf2d1635b4e721fbe16c421" "4162f5b40d28fb21ecac3d14a3951b11d764a0d9" "4703229ca243bb3a8fe3bb31c27c66822ea80784" "bfa73a7cff4b0a671601cf11e076e802c56c1055" "b63ded94cd437b7988fb8bdd907d72b6890145e1" "ab40fcb17601dcd2ae24417da4e235a5554eb04c" "848d1c168b5ce297c8115cfb74ad76ccc09051c9" "8818066e968ee303bc6dba9f0d8ddfad5f65229c" "73b4f1aee11c226e6d14117ff8af972c6ebba872" "f285f89280681045bb015e1ecc6112d332268755" "6f60b8f32e9d8d073532bcb90124847e6548c007" "be45c900caff370b2c41acd0945919d4e6882ad9" "b8a430789290ba47b915920e2578b53c501a2499")
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
	"mithrax"
	"osiris"
	"primus"
	"redrix"
	"skolas"
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
