# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="b733770933c9237a6fdef8611000421b9a171146"
CROS_WORKON_TREE=("be2297aab60038255b48879e851e43bb7ee8bdc6" "a834c3e01d293efb06402cdd5d5ad7d33e8849dd" "12a42bf0a6c8750bce76a7bf20fd9adb206a7cbd" "85be603d5026f35f2ca8666e03d77d675c23cbd0" "f3143bf6759c99caf65943a02f2b40410482d6af" "28a9ce6fa88b62b917811bb563a0d6872163000e")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"brask"
	"gladios"
	"kinox"
	"kuldax"
	"lisbon"
	"moli"
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
SLOT="0/${PF}"
KEYWORDS="* amd64 x86"
RDEPEND="!chromeos-base/chromeos-config-bsp-brask"


src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
