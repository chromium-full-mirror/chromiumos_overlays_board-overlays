# Copyright 2020 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

CROS_WORKON_COMMIT="bc0ead7b2707c4714d6fffee5c5f3f44de7b559c"
CROS_WORKON_TREE=("80c6bd27db69fabf21234cd1b520ff651ed47d52" "6cd4975934d3575634b035887a7237c6f674df93" "c3f8d9f636b070c19365172f054f973c94e8abc4" "b3e2ad395717bdf53391a9d7ade205353fd55b87" "46a8f64189a187c68865a83855b0c20dee47dfcc" "20b6cfb670b75dd3e75965613512127dfb6a2362" "44006cf3b2709efe7607bc619340f71a8090939c" "54ff3c23f3a88f9a6c07ea96f7519026d82885e6")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
    "berknip"
    "dalboz"
    "dirinboz"
    "ezkinil"
    "morphius"
    "trembyle"
    "vilboz"
    "woomax"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "$(printf "zork/%s/${CONFIG_PATH} " "${PROJECTS[@]}")" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( zork )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for zork"
HOMEPAGE="https://www.chromium.org/chromium-os"
SRC_URI=""

LICENSE="BSD-Google"
KEYWORDS="* amd64 x86"
RDEPEND="!chromeos-base/chromeos-config-bsp-zork"


src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
