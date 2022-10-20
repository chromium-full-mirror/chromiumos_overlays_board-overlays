# Copyright 2022 The ChromiumOS Authors
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=7

CROS_WORKON_COMMIT="410187cb265844f19181dbd8a5c8dcc59bff3ca5"
CROS_WORKON_TREE="e7f5c8cde3ca6b39b6631febfeaf8a62f34b3ce8"
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"geralt"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "$(printf "geralt/%s/${CONFIG_PATH} " "${PROJECTS[@]}")" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( geralt )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for geralt"
HOMEPAGE="https://www.chromium.org/chromium-os"
SRC_URI=""

LICENSE="BSD-Google"
SLOT="0/${PF}"
KEYWORDS="*"

RDEPEND="!chromeos-base/chromeos-config-bsp-geralt"

src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
