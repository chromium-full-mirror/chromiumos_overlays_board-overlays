# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="ba32e0650fba3fe2fd6728c735760bb177d9d84c"
CROS_WORKON_TREE=("cf5ca0afcdb9c15beeddbbf61de2b5cde5250a65" "bcb59027988a815d85c0646e3595a0c462f6b258" "659c75fac54ce8d9e69fbd3dd6c5546340821019" "b6a9e6e5db3d3342a831006ccde2bab3cca72c43" "26521c293eae42f8694c33c40dae892ddf43a773" "a58a82f953fbeb8dbc655e1c1f56416f10e6ab70" "799ca7313b4d3e86a44bc46f8cc1ac323da584ef" "e107c2491c59a08c8bac20edffe0f0e58b80ec2c" "e137423073481892da3245b6c9aa94a30a760b3b" "b84325a0e295cc22eaefc6fd0d447651c2f6e10a" "3de053fdb1e1d7f40aec8bca5b6c2969681dddc7" "04c64f15bb714e47707bfe5ddb4fa1e95c088efc" "ef5274422a373192aaa09e2916d868e855f0c2c7" "1899fa952291c5c9a4f664a5b943536e0d0a3327" "c189112344b8426ebd0f06d63bd06a3783f0aa72" "f4102436456ee1a489ed0e6ac9cc16b05387bf91" "08eed719fc3a051c60fe324a468f1ccd17b10dfb" "3088db13d65af6e185f174e9bf4046c9f340c528" "6e15687ecaaec4d6d537cd93609c5feacf655ed0" "fdb7b5b5669056768897b283cc1a64b432f1cc85" "1f3febc61e94a7d298f17fb15d941e2d2e9b9cda")
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
	"marasov"
	"mithrax"
	"omnigul"
	"osiris"
	"primus"
	"redrix"
	"skolas"
	"taeko"
	"taniks"
	"vell"
	"volmar"
	"vyhar"
	"xol"
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
KEYWORDS="* amd64 x86"

RDEPEND="!chromeos-base/chromeos-config-bsp-brya"

src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
