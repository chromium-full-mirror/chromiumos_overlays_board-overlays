# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="a127a0fcde4a754024e85534eaeed1c6c7d864f5"
CROS_WORKON_TREE=("60f10ae64c2e98c59d970d17248cad1c9188df84" "c2673d4a51355a86a956eaf9f6a0732b2d1bf38f" "4017163bff1852ae4aa1d080de71cb2735999858" "340eca0c2802683f6a475474a6d164f66a4bf889" "36aa1130b3a94dc88f742c41049f264a2750b0d7")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
        "kanix"
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
KEYWORDS="* amd64 x86"

RDEPEND=""

src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
