# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="18189d8d1c29fe9f5f268819e06745d6541dad2c"
CROS_WORKON_TREE=("447ff63400533d81be583ee38533b8006348e0ca" "4d4fabfb8c3c9e55b1c888f1829672d7cccfdad3" "660575bc68356ede43ece307defe28d0a12d050b" "7e9b500151f7c715fc04997c5e3ad6d51985b51d" "31d747716fe2879898f371e357bea9eaa0dbe4d5" "b97f30561a75f097f997a11d093f605bf815d609" "49b433fd5a3ba8ee688c9d070a45265fe63a443e" "4990e5953c876326f56cb9538a085f97d8ead2f5" "94ced13d79e74b0390630cc96f9cbfd85bc81163" "6847b88c21eb7a51b7910f45882f1720c0374817")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"adlrvp"
	"brya"
	"felwinter"
	"gimble"
	"kano"
	"primus"
	"redrix"
	"taeko"
	"vell"
	"vyhar"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "$(printf "brya/%s/${CONFIG_PATH} " "${PROJECTS[@]}")" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( brya )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for brya"
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
