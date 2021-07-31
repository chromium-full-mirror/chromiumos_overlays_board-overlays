# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="0cc976984e9b7ae0dfd391818550f003acd2273e"
CROS_WORKON_TREE="5060601e628199b06863014fedc2b24e6e0d571e"
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
    "shadowkeep"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "$(printf "shadowkeep/%s/${CONFIG_PATH} " "${PROJECTS[@]}")" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( shadowkeep )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for shadowkeep"
HOMEPAGE="https://www.chromium.org/chromium-os"
SRC_URI=""

LICENSE="BSD-Google"
SLOT="0/${PF}"
KEYWORDS="* amd64 x86"

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
