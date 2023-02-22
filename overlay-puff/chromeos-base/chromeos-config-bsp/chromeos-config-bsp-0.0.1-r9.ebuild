# Copyright 2020 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="68a78cc19b00e8867c9122cdf0981a7f8b6e1750"
CROS_WORKON_TREE=("c54ec62cca84a2787f3f7a96c229f0e2e52fd377" "f9bac721b0bde5347b8fcb31c6148f09c261d0ed" "db152bf7293e25a5c714020bbbc7816ac1dd1e4a" "312df70ee3f1d6d486ec312779b37449f2068c10" "6ffe52461670c3fd178f606db13b4266c6d2641a" "9b24d1762b998f7526315667a882cdf0680ff6e0" "6e0a16eaed53fcbce5e07525c5c816dc5c6626ab")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"dooly"
    "duffy"
    "faffy"
    "kaisa"
    "noibat"
    "puff"
    "wyvern"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "$(printf "puff/%s/${CONFIG_PATH} " "${PROJECTS[@]}")" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( puff )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for puff"
HOMEPAGE="https://www.chromium.org/chromium-os"
SRC_URI=""

LICENSE="BSD-Google"
SLOT="0/${PF}"
KEYWORDS="* amd64 x86"
RDEPEND="!chromeos-base/chromeos-config-bsp-puff"


src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
