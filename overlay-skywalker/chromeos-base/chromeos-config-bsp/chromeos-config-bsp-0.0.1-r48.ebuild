# Copyright 2024 The ChromiumOS Authors
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=7

CROS_WORKON_COMMIT="30ad7b5418ee9870dee8a6a19f9556867d5a712d"
CROS_WORKON_TREE=("08aa8b62261a367367c1e54c46ed807eb49b0420" "cf0140dc2533cb8ea6cff2ab539cf52141f80bd2" "0327adfcd0472de961b0adf4fefaebde976b06cc" "795fbc551cc6b967e4d13eb10790615e43850b75" "45a285956e61edd38f1fc3b74ba281f737ecc804" "5856be7941a18c8b7c6b551730d59dd8db756753" "248ffa6229b756d96367a033be86eb62fa06f558" "71cd551a481fcd23a01543a22c8a30850197b53e" "0f782a729996676d31fcd54430e5a4ff3f70ec43")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"anakin"
	"baze"
	"dooku"
	"grogu"
	"jaina"
	"r2d2"
	"sheev"
	"skywalker"
	"vader"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "$(printf "skywalker/%s/${CONFIG_PATH} " "${PROJECTS[@]}")" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( skywalker )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for skywalker"
HOMEPAGE="https://www.chromium.org/chromium-os"
SRC_URI=""

LICENSE="BSD-Google"
KEYWORDS="*"

RDEPEND="!chromeos-base/chromeos-config-bsp-skywalker"

src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
