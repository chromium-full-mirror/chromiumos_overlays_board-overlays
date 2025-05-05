# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="069331c80553db213247cfae3299ef05878c9fd4"
CROS_WORKON_TREE=("d4c5f7191673a7f84b701f7ce424e8794a24feba" "023877a081a2831c299960efc2984fd3206e99f8" "397f6ea234362c7dd33ddc3b789ecb18ba566842" "a599ca8be5508bb01ef1ab2868a44bc21a1d16f6" "40a1726ddf724d9848b6b6395a0ec48cf3575854" "f1ad7f37ee2291009051099109a51dcdee182462" "97d5b4c721e30ca6ca89e307fab23a1ed5ce9a47" "88796fb9f93f7b1831b76a5bf350fe01c443565e")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"brask"
	"bujia"
	"gladios"
	"kinox"
	"kuldax"
	"lisbon"
	"moli"
	"moxie"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "$(printf "brask/%s/${CONFIG_PATH} " "${PROJECTS[@]}")" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( brask )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for brask"
HOMEPAGE="https://www.chromium.org/chromium-os"
SRC_URI=""

LICENSE="BSD-Google"
KEYWORDS="* amd64 x86"
RDEPEND="!chromeos-base/chromeos-config-bsp-brask"


src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
