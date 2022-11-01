# Copyright 2020 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="ad946c44985f9ccab21b26ad60aa09f875d432a3"
CROS_WORKON_TREE=("9eb11bc70418bb51043dc67a502462c26f8ace92" "c4fa094fb3f496c846de81a05c9ab99e7f85c56c" "64027adb7a8cb0bd9bbff4d3d32c83b6fead610f" "639495198af3489e62e0238e1690cec31487b52d" "bb33ecdc28c29278d0f3e81f9d577e760d29b616" "aa379acc2b251bd6ed494518c89222ca395af6dc" "4d7f55a69caad6b5ee04392f0036668d5e44d1d3" "3ab410eed5614e5ac17a24e3a37162a328994837" "bb393832689a6bd294d4e1a17c31d1ea097e4772" "6a23fe37a7291ac7ae9ab908e54ba0b104d9339c" "fae123ca5478d490a47113968c7c32e855e20e16" "a7c4a3e0dde23fb4154afba7690b240f8f894dad" "64569fe1085bd2bfb9e44cb4fbb9da29085971fb")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"chronicler"
	"collis"
	"copano"
	"delbin"
	"drobit"
	"eldrid"
	"elemi"
	"lindar"
	"terrador"
	"voema"
	"volet"
	"volteer"
	"voxel"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "$(printf "volteer/%s/${CONFIG_PATH} " "${PROJECTS[@]}")" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( volteer )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for volteer"
HOMEPAGE="https://www.chromium.org/chromium-os"
SRC_URI=""

LICENSE="BSD-Google"
SLOT="0/${PF}"
KEYWORDS="* amd64 x86"
RDEPEND="!chromeos-base/chromeos-config-bsp-volteer"


src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
