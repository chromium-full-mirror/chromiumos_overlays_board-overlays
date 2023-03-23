# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="e87596422ffab9ccd8bee02f4a3e318c9720e0c1"
CROS_WORKON_TREE=("6e560e57c2067aae3e29f9fc49865ee9f485039b" "1e985f232101eac4df38c35ae484394c31d279b7")
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
CROS_BOARDS=( skyrim )

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
