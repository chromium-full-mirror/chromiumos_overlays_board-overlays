# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="ce176c12872faaa9c7e7fedc6cc515a55a99c7f8"
CROS_WORKON_TREE=("5e82b9844fd1800167993e8d611482ebbbe5fbe7" "49d2595a0dae4e3da3e19a28a7c00feb6230599a" "385e1304c74c18e7f27d68d94e5961e40f6fed4a" "ded8cc082a2c4100e5942f2c0eb4ced63af34b80" "bbd5e244d4ffb152ec0256f71d70d8bd75787e2b" "477e8bb14abbb2b1fe5c7dbe52071d11535f56d5" "f85e7fc32aa2364eeef3161de2a150c76e3c8b40")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"waddledoo2"
	"lalala"
	"cappy2"
	"driblee"
	"corori"
	"gooey"
	"haboki"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "$(printf "keeby/%s/${CONFIG_PATH} " "${PROJECTS[@]}")" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( keeby )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for keeby"
HOMEPAGE="https://www.chromium.org/chromium-os"
SRC_URI=""

LICENSE="BSD-Google"
SLOT="0/${PF}"
KEYWORDS="* amd64 x86"
RDEPEND="!chromeos-base/chromeos-config-bsp-keeby"


src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
