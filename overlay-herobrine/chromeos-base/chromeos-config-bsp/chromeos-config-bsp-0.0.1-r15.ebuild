# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="d1568e0280201947d2b63fa5723a0d85b859896c"
CROS_WORKON_TREE=("4d70be437390a80f7b8210bcd9ac2ef1128bfa82" "72246610dede805e20b9eb852b038c2badb31459" "f67b765cdeb920487a077031c64bd2856c9c6f07" "72ae649dd2fc5e3c398867faddf991d9d4ef3746")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"herobrine"
	"hoglin"
	"piglin"
	"villager"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "$(printf "herobrine/%s/${CONFIG_PATH} " "${PROJECTS[@]}")" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( herobrine )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for herobrine"
HOMEPAGE="https://www.chromium.org/chromium-os"
SRC_URI=""

LICENSE="BSD-Google"
SLOT="0/${PF}"
KEYWORDS="*"
RDEPEND="!chromeos-base/chromeos-config-bsp-herobrine"


src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
