# Copyright 2023 The ChromiumOS Authors
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=7

CROS_WORKON_COMMIT="f9589fa7ede6e6db94faa0b408611afd1a9a279e"
CROS_WORKON_TREE=("9a1e32fad1afecc92b54a5b0849d99e9bd5a6d9c" "808d7731e2a2c06edd7c1de1b99cca511a58f8ec" "4d2e2606babd3818aa2c9ad3b358d4d777ec0aa1")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"hylia"
	"navi"
	"rauru"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "$(printf "rauru/%s/${CONFIG_PATH} " "${PROJECTS[@]}")" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( rauru )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for rauru"
HOMEPAGE="https://www.chromium.org/chromium-os"
SRC_URI=""

LICENSE="BSD-Google"
KEYWORDS="*"

RDEPEND="!chromeos-base/chromeos-config-bsp-rauru"

src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
