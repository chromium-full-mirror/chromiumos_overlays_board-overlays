# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="caa7598d64208157f784b181b7c1ff3acfc980a7"
CROS_WORKON_TREE=("ccce6103b2edb741f7046c16434c323a0edeb369" "9a732589d7f39a49caea0e44400ffcf58291165d" "caed025d6a336fe37db1bbe5690dc8ae1150c863" "4a290df505e10548a5b7b9c268067516da09d83a" "a969826afa1fffbbfe243ce4b6de628c103ae8ee" "e7d0c9b2c228034b130744d87f18d9f5f8f9e667" "c27a388e768392123f8d56e2491bf95815cfacdc" "bbadeb2f487290bead3a641fcfa70b1055621030" "f1cc1e84fb52f338b5520567b02d632a4c36fd81" "e1cd42b8aec5ecd4e0cf2b2b16527a27a94b043e" "a876ed2f7cf39ead3b92411d2058726601b21455" "6b3f47a90705e9879a173992d4b8ff6b6adf4c41" "bb54b970ec4afd5f50be4279cef72c8688be95c0" "8451c3d066ee8cf8c9d067721bdd8ebd9c0f8ff5" "5042c748341d41f6c16f9f4bf88cb3c381623091" "74954585e414761fd33464cf1ec9204b310cf36e" "1b9288fbc3f3dad051f9adba46292eccc4d19078" "98e9d2da41ee06fb9bc119e677400bcdb52d01f8")
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
