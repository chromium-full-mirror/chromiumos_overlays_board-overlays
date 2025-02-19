# Copyright 2023 The ChromiumOS Authors
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=7

CROS_WORKON_COMMIT="246cb160c76828bcfebd660a640eb8f5ea68cdd1"
CROS_WORKON_TREE=("e68a32895f8f11f1b8872700a36432612b00d249" "aadad7916cea277bc3aec80c772dd3cadad333c8" "44c582ac855d949b0a123de0cd6273dc54ec9734")
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
