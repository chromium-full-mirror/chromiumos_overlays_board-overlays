# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="c8f7b488bac9b7857961eea2d500c1a605a8454c"
CROS_WORKON_TREE=("a587e57bf9b1c7559242708a9ab220408e4398ee" "148adb95795417fe8c07c2e7d0935d750aa88d1f" "30bc98ec52b345b2e6db757b21d09ac5e127e41d" "228e85f32d174349ed6f542f6b4f2d23c10f859e" "72906e9d7bcf7a36713f38806325d31651597057" "807dd246cda442ec1d54181566924771f926433d" "bcc6af413706c9a3517f8423b446682d130845bc" "577ede3ab79aa22c18119f1c3e49566aa27f1212" "8e58bff48c8ae30f1b1c2e2e07fa1f806f7e8b3a" "d2d397b3722c52b9e88958b4a6ac5c6778989f56" "d5f681c45dc9b933a36f706ca0a9a4613fba5713" "e26d85f1e5031562e45ad9b2fc04ffdd0990407b" "b8a430789290ba47b915920e2578b53c501a2499")
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
