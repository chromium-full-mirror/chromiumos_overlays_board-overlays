# Copyright 2020 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="68a78cc19b00e8867c9122cdf0981a7f8b6e1750"
CROS_WORKON_TREE=("233ae74da8b9b7db8ce4730058b1c27f69dbd33f" "d424cf8346d33e8b085f03b83f892bc29ebf8a51" "188c8951db2b26a1913a0af463042ec76a1f8a90" "3b39c36a2b684b81c6ac4033779d7867bb3f46db" "2f0f03e559abdb482d09414266a5cda27cac1b5b" "ae943a3e3a522cd54ea3f3610d701b7c2bf94703" "c7775986059c0567141adaf13aefff599bd9ce49" "208488fb4c0841fe564f6c5897a67ff4bfaf5ea8")
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
SLOT="0/${PF}"
KEYWORDS="* amd64 x86"
RDEPEND="!chromeos-base/chromeos-config-bsp-zork"


src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
