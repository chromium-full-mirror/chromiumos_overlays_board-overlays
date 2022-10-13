# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="56e8f7c6f583ee1e9f827a4ecbdaf751977da9ce"
CROS_WORKON_TREE=("a37d8a0e15aaaac42591d0cd01588207a56578e4" "bccb3dcf6727cb1e2d6b69331040e3e835dbc8e4" "9943cc050a17cc4ab4b146caef0d22c9720ac556" "4ddcc3fd66f823f80530d8326b128f2c84d7a2f6" "17f75d7e28d6ec27b725f20ec9f6598e994abc59" "6a38caf97b8a1f4ebdf2d1635b4e721fbe16c421" "4162f5b40d28fb21ecac3d14a3951b11d764a0d9" "4703229ca243bb3a8fe3bb31c27c66822ea80784" "c8374bf2eae3ff154b44045b54bb89eae1992951" "d7c71a91d4711f8018d310803dae25951eafbfb3" "ab40fcb17601dcd2ae24417da4e235a5554eb04c" "4d4f8ff67eb6dee28dd04aea8aebdece1bd6eeb4" "17ed571be9744b2434636dd6e3330a7ccbaab1e3" "73b4f1aee11c226e6d14117ff8af972c6ebba872" "f285f89280681045bb015e1ecc6112d332268755" "6f60b8f32e9d8d073532bcb90124847e6548c007" "be45c900caff370b2c41acd0945919d4e6882ad9" "b8a430789290ba47b915920e2578b53c501a2499")
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
