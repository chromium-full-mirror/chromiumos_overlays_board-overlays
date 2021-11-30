# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="e89c05b5773da60ca9f0ac17fd2792682c2e0f39"
CROS_WORKON_TREE=("a587e57bf9b1c7559242708a9ab220408e4398ee" "54789166cbf2c4c89acbbbfad006ac9ec8e33298" "d44728104175f74b8adb429f253ee8c0bc1bf8e3" "228e85f32d174349ed6f542f6b4f2d23c10f859e" "15352b25ed653090107bf1ed6fc58ce70fdcff5d" "02ab3d4be6f6cbfa8ee0cfe8edf2956213e34832" "880e1d372b356593fff1fa88376363af48cf3fc4" "929fbd5ba1453109f798a50d81e24f42d5093411" "1bf96e48ae12036f2c2c21e4b067a0edd54c8bac" "28f49b872484fc3a9ce380e1b52efe9c89e48c3e" "2cb633d4ca569585df85b0ac150fa02897320884" "e26d85f1e5031562e45ad9b2fc04ffdd0990407b" "b8a430789290ba47b915920e2578b53c501a2499")
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
