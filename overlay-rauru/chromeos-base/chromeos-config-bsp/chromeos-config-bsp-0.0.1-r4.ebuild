# Copyright 2023 The ChromiumOS Authors
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=7

CROS_WORKON_COMMIT="d3b6bdd6db20b626de466a17e45cd9d2385f5be8"
CROS_WORKON_TREE=("fee2d0d1b23c4af9e431f7c89d6cec54bd3ff9e5" "675532638d729f6652cd083344e63cfd5d2f8b60")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
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
