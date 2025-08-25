# Copyright 2024 The ChromiumOS Authors
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=7

CROS_WORKON_COMMIT="c9de22d0985e4a7708f8157b3a0f6be30dc43e82"
CROS_WORKON_TREE=("ddfc0b33b2ba3f8a07d6deebd20b4fdbfba37689" "4d4a77978a04e7322839554113ed9dee0fbf1b81" "71cd551a481fcd23a01543a22c8a30850197b53e")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"anakin"
	"baze"
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
