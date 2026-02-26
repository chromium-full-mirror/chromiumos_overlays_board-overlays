# Copyright 2024 The ChromiumOS Authors
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=7

CROS_WORKON_COMMIT="df27a5b850677ef89363355b8d74c4779dff921e"
CROS_WORKON_TREE=("e0de4173eda1759a54141d5baab39898e57f4db8" "cf0140dc2533cb8ea6cff2ab539cf52141f80bd2" "0327adfcd0472de961b0adf4fefaebde976b06cc" "795fbc551cc6b967e4d13eb10790615e43850b75" "71c3d0042edfa0a8248c04feb1f2ef9892e6855b" "5856be7941a18c8b7c6b551730d59dd8db756753" "71cd551a481fcd23a01543a22c8a30850197b53e")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"anakin"
	"baze"
	"dooku"
	"grogu"
	"jaina"
	"r2d2"
	"skywalker"
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
