# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="e629fb1250ae475d1b0351f669a510568e8c6b6e"
CROS_WORKON_TREE=("e14ef44c23b2a8bf0062a5f9ef29a79d18b33684" "3951cba2c6deaf42eca58b5dcf9e6cb803486392" "0b11cbf48eace30bc146f73f923ecb53acb2e624" "6f1af4798f9adff0396e0e46eac34ce33a12aa54" "028f0752e4229bd933c43f12df03c27f5f9582fb" "eb44556b10531bd4bf0c87b9ff56a0074bc105bb" "dc3431f62ba17ada91b37f9f54e384366b6ca33a")
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
