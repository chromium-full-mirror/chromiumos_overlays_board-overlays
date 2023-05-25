# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="3033a388aaa1932a37dd78f0c59bb07229eb72f5"
CROS_WORKON_TREE=("dcf791d946135cbc3289eb94b56a0b2b6f78f718" "d6021c1e7b86ded90c2d6f730d73c20df07433d1" "fe848515d3a70565de3a69021fed5299c341d3a2")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
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
