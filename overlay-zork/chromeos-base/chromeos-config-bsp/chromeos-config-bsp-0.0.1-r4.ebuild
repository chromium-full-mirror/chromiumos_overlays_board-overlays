# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="6109d510b8995eaad1a6aa5191aec33f9f07bf01"
CROS_WORKON_TREE=("e492ce15f8225540d5bb88b922e8b01b7a86d860" "b5c210d3e5b10f2d46c17d6bf226620f0f86e095" "e8113df943d13f8b31497a86dac3c68dcdd8b6b7" "f4a0c6bbf3d7d336513530d219ac42094ba2975a" "813e48fa1315e97fa914b478e3ce083c39303a89" "aaa60c0ca04485b9b664334e9aa71ada9141dd51" "b8773cdde4a2e05ed51181ec9bb77d52c1bc4cf0" "fb366f8adc4424376fd8e6560db40beea1505953")
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
