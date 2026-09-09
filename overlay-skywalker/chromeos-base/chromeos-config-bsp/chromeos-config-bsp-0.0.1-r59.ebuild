# Copyright 2024 The ChromiumOS Authors
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=7

CROS_WORKON_COMMIT="bb59ec1632a67baa4538b1fd6c6ce3e5e9d0dfe4"
CROS_WORKON_TREE=("08aa8b62261a367367c1e54c46ed807eb49b0420" "38bcfc94b3c1588b4458c2a5c18faefd66cc1b48" "0327adfcd0472de961b0adf4fefaebde976b06cc" "795fbc551cc6b967e4d13eb10790615e43850b75" "475e6563224be472f548d0e2b3d0a42b0de35249" "d82bc7a72f75bf4c5cb07660a6bdd00506fedcd2" "f89e650874db85dc93d9eaa0ad88adfae9a14cc0" "23934703a1d73dfd1a9eac59e16d8829ce15e2f3" "71cd551a481fcd23a01543a22c8a30850197b53e" "c46aec7df2e5b252c2f8e8898529bc5d659fcc0d")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"anakin"
	"baze"
	"dooku"
	"grogu"
	"jaina"
	"obiwan"
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
