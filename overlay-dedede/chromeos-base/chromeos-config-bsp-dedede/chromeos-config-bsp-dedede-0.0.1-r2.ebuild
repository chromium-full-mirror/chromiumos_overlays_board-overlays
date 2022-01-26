# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="35076ee1563f59dafc8222a554151fd3e1235cb5"
CROS_WORKON_TREE=("af43d6cbb55c068e288921d9f768a8d24ac410aa" "207f71865b98f19021d80bb9e9ce99e438c50380" "ce9b2992b3e81d51d1ed17a32a90448fe8080773" "f798c748be33bbed2587708bf0bfa278dbdbf84f" "24e7e2a38b648742fc6d38e6bf14f50f43f6d525" "98d0269200871e640b4e34dbbbecb32cfb1688d2" "918e684732e57e9460fdab3278c3e2871a0152f0")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_INT_HOST_URL}"

PROJECTS=(
    "boten"
    "drawcia"
    "madoo"
    "magolor"
    "waddledee"
    "waddledoo"
    "wheelie"
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

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
