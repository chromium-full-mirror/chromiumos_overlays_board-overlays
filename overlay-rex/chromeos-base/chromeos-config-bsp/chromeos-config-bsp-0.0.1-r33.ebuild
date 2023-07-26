# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="328cf14fa763601f0071553b5a1b1b2e2ac7a990"
CROS_WORKON_TREE=("e34497ddd6858bb48fc93003a6df41abdd6aa484" "0f7898df06c9b8aee3d8c5c8d496f844ce74f4f1" "b88fce6cbf2f96fb2cc801477634a17f20599a27" "de04f9714c6a750c980d4ad8e114002d7a286861")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"karis"
	"mtlrvp"
	"rex"
	"screebo"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "$(printf "rex/%s/${CONFIG_PATH} " "${PROJECTS[@]}")" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( rex )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for rex"
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
