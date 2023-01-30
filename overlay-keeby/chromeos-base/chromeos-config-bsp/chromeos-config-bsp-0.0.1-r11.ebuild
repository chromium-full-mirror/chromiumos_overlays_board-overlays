# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="5ffa9adaa34d95e5b9a8884b58e44daab034d5de"
CROS_WORKON_TREE=("a67f57ac263f8d5556852d53a24942fa9458d633" "5b23467ad1ea1bb43accfdd7b1411f7ec14c28b4" "a9ffa3f4c86d72ff4847b1c12197465733866d38" "cc5201f91bad69bdb5d95f2bab34b47ec21ffa52" "1fd1e7b37efc7781e05082e31cbe67aaef740371" "6b2b57c3497551b722d00d7e0f6437f804d7e210" "8f73840aa87cb9a8059623d21ef7295c98d222f4")
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
