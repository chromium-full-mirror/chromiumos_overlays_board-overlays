# Copyright 2020 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="ad946c44985f9ccab21b26ad60aa09f875d432a3"
CROS_WORKON_TREE=("91370a9e4d1fbb8d2d53f770f24fa85f57705c4c" "457cb01ebf0ef5546ab48b0782e92e46c279271a" "105a23f61f1f157393942559cf59e7a15e7b1888" "8a0a011f1258cbc00c51e154ca144165222805b3" "1b18c7126a008dd2d430795dfbbc00517eda7056" "c89d40ca398a0c962ebf9c6aa06673d450c43135" "0fb69d12fcd5348afd12c0f047348a15c540c6d4")
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
