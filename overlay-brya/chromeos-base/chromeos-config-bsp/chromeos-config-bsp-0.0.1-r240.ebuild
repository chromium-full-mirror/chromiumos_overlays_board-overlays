# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="ffeb906f3b7a53b978acd56484b01e261d72af82"
CROS_WORKON_TREE=("cf5ca0afcdb9c15beeddbbf61de2b5cde5250a65" "172aec92e6380b265bc32fe751ea21ce2c263ebd" "659c75fac54ce8d9e69fbd3dd6c5546340821019" "b6a9e6e5db3d3342a831006ccde2bab3cca72c43" "b9c34df8033fb18cf5e4763dbff45450b7143fbd" "a58a82f953fbeb8dbc655e1c1f56416f10e6ab70" "799ca7313b4d3e86a44bc46f8cc1ac323da584ef" "e107c2491c59a08c8bac20edffe0f0e58b80ec2c" "e137423073481892da3245b6c9aa94a30a760b3b" "b84325a0e295cc22eaefc6fd0d447651c2f6e10a" "b4de35d3890f1ac5186dd780212161633a7852cc" "04c64f15bb714e47707bfe5ddb4fa1e95c088efc" "42c4bbac885e3c7f55c6ff2ee0ae68d1f7edd1a3" "1899fa952291c5c9a4f664a5b943536e0d0a3327" "c189112344b8426ebd0f06d63bd06a3783f0aa72" "1ae52cc31e5d188782b7d28dc166d89d89d2fb5d" "08eed719fc3a051c60fe324a468f1ccd17b10dfb" "3088db13d65af6e185f174e9bf4046c9f340c528" "de9aa1a5be759c8a3df32ec169ad91b3ca98704a" "fdb7b5b5669056768897b283cc1a64b432f1cc85" "6e4fbb3041b1e3faa44e2679f7968221f15ec141")
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
