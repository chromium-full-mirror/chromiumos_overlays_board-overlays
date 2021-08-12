# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="c8f63c4e696f10c09a92b939f0143f594ab37972"
CROS_WORKON_TREE=("55eef87627503ec03b3df589a3e78fbfeb4ab99b" "8d0c6c94cc90ecbf4e40bdd0eff8f4d45aad0b67" "9ad4a5b6c99089e4f844e601cd60f52287aa1aef" "86c0783d22237b53e8acea468d5b28c5073d5454" "11db6cde4fd4fb81e88322957fdb1e485a197dbb" "b7a9e470f5dcca38ef187651ce7caa5c1373adda" "d14c224e5f9c3e614e26e4624ccd6c30a1f32836")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
    "boten"
    "drawcia"
    "jslrvp"
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

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
