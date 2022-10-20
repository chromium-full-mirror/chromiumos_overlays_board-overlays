# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="410187cb265844f19181dbd8a5c8dcc59bff3ca5"
CROS_WORKON_TREE=("62fc119d102e01453794cc65572816a8189937be" "29a0c959793c9b9e7d563ba2a17a9f4d0e7711d4")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"skyrim15w"
	"skyrim6w"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "$(printf "skyrim/%s/${CONFIG_PATH} " "${PROJECTS[@]}")" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( nissa )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for skyrim"
HOMEPAGE="https://www.chromium.org/chromium-os"
SRC_URI=""

LICENSE="BSD-Google"
SLOT="0/${PF}"
KEYWORDS="* amd64 x86"
RDEPEND=""


src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
