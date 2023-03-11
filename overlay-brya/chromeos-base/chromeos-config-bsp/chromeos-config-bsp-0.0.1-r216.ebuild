# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="d7143b267ad00a074178813dce7a2b5ba09ef32a"
CROS_WORKON_TREE=("98004963fb079a0621130e08322f43ae9302d8a4" "f669a584658152e4841fdcbee19641ba0a295135" "937a6a2a7dc2bb0ec004d7e8e01b072146fa3244" "8eb3e6eb81663bf4c2138456bcb0039ca17d4f37" "2056aae1d14ddfbe960a9d09c3cdbad2c7c7ec86" "66209f69e5cbf4ea75e366a4f29a3a25c39f6c04" "af5e597c5382cb99ff26d48a369da3fec05dac6e" "4c2b2fb71a09c125e96119c626af67f4020e4a32" "b6a36bcca593d4209a43f4b594eedaee491b4d7c" "9c0efb84509c88c250642b6729d925fe22453457" "97a9574e3d05cf6acac3be18209146578b24cb30" "58d9434a320cdfc9e51b6f38fcabcd704603f7e2" "46bfbd382c7851bb1968c4bf8333a5639873b3df" "9131abbab19ff6e41ece2006422af64f7556c9e7" "0da5fcc246e9aae3873a1d3e802921ce2f29d435" "261a3a5a8fb8545ec857054cddb6c3bfe90c03ff" "c8ea8e1cb5d781e9b0b2e840ca19eb6ae3fd2a4b" "f902fc92bceb9ff509888c56dc89bc6909b0fad1")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"adlrvp"
	"anahera"
	"banshee"
	"brya"
	"crota"
	"felwinter"
	"gimble"
	"kano"
	"mithrax"
	"osiris"
	"primus"
	"redrix"
	"skolas"
	"taeko"
	"taniks"
	"vell"
	"volmar"
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

RDEPEND="!chromeos-base/chromeos-config-bsp-brya"

src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
