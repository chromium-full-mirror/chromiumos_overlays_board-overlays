# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="2aa3e835b7a51cb05cda76d4144bb9c3a2393cf5"
CROS_WORKON_TREE=("a587e57bf9b1c7559242708a9ab220408e4398ee" "148adb95795417fe8c07c2e7d0935d750aa88d1f" "d44728104175f74b8adb429f253ee8c0bc1bf8e3" "228e85f32d174349ed6f542f6b4f2d23c10f859e" "4e2b25cc46e5f8b84badc48282853e1be2e7c5da" "3943c6592ad7bf0b4b33118543b7f1a9050afdf1" "880e1d372b356593fff1fa88376363af48cf3fc4" "58d67587750ee676f325cfa0609e5770c70fa977" "b896c5ceb57d790bad50512c7e598df4460031c1" "28f49b872484fc3a9ce380e1b52efe9c89e48c3e" "d5f681c45dc9b933a36f706ca0a9a4613fba5713" "e26d85f1e5031562e45ad9b2fc04ffdd0990407b" "b8a430789290ba47b915920e2578b53c501a2499")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"adlrvp"
	"anahera"
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
