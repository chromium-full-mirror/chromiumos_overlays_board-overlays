# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="f565c11d29a9ea7e79ea3dbad6f12e9f9e23fb67"
CROS_WORKON_TREE=("c62c48094fcea5495b7b8aec902e8a2af76697b4" "bf3355f1de5ee9ee13dee6ac016d6f80da49d77b" "86c0783d22237b53e8acea468d5b28c5073d5454" "37737a2fa9d828436b0c80b79583df97196a1695" "b7a9e470f5dcca38ef187651ce7caa5c1373adda" "d14c224e5f9c3e614e26e4624ccd6c30a1f32836")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
    "boten"
    "drawcia"
    "madoo"
    "magolor"
    "waddledee"
    "waddledoo"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "$(printf "dedede/%s/${CONFIG_PATH} " "${PROJECTS[@]}")" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( dedede )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for dedede"
HOMEPAGE="https://www.chromium.org/chromium-os"
SRC_URI=""

LICENSE="BSD-Google"
SLOT="0/${PF}"
KEYWORDS="* amd64 x86"
RDEPEND="!chromeos-base/chromeos-config-bsp-dedede"


src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
