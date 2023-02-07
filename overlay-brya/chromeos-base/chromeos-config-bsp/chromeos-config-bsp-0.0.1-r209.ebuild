# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="ce176c12872faaa9c7e7fedc6cc515a55a99c7f8"
CROS_WORKON_TREE=("b5f9e6e9b010562ffe9a2f4aa7c30ed3fabd4226" "b0d103b6b25adadbff1300ca38e2cd9b6df38802" "88e41d82229752d1be6e62af647edab3dd8e261a" "e8f8fe9e2723b03ec2591ce0b8b80aad3b1bf353" "105ee01e6046c554db9267116aa726914b72b154" "2854cf3b50916c2ebbadbb0d1b6cc2896f251e10" "5b161cc5adb0f9cd0e9546878c85a65b129419ee" "37560d386d364c1d4dc531d549d34305e347efba" "db983b4f199bf70c9b006312b056527fc6aeb992" "27969463934717e8936c88f3dc40664107c99574" "7e8cf443174c6d9cedb5f90f1aadb993b25f3c01" "d25e956775cc50f85b289bdbdbaa24289df5b3cf" "8628c2d5ae5665d3e0b7c502a4120ae3b81d1f5a" "8b7d74548a8f04e01211aba13c228c785de8f4a2" "49aa2e3508fa6d014fb153a63e09e7864972f468" "198048f902a41ca7158368194e2abd787ff88b19" "2a99fe0d384fc19645ef1a36f18c67207006a083" "a037a4097101efde68afaf9536b62437e651e7f0")
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
