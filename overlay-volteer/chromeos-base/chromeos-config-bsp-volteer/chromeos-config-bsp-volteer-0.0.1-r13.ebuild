# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="9c6a23bce241cf5a4f4a2ad5401f6cbf7f6091d5"
CROS_WORKON_TREE=("75c7052154bd849f149811e04f1c51418b8ae238" "d9c9abb49fad8ead6f72f9f8a56e18035dd90888" "e1dd5f44c519bfcfd545fad805b49c0358772060" "4436551d0cd7ac35a934c462be4bbb8f1caae324" "da393757dbcf6ba182dc9be0976402726aef4304" "53f5b850898b1be3b28649d871b368860de8e8a9" "ed4f92aee8a6fac7f37f810cbaaebefae13597b6" "fd58049553d3d1b500e688c4983c51cdbc62be22" "acf1ef3aecc36210f41aee04ee142928c7a249d9" "f4af8acdb826568e3210ae77f6786acf13641fdf" "06c054b272b48b7be4b8ab25868e659216edb6c1" "bd84a31150305ccf70a2bf61a3f102083849d667" "75115a4631288e3937ed4261ae924fb20d3cb15f" "77ca73db9ff3ca8d5c9fa287c9c71efd391ae3d5" "bf1b86704ad011118007f116e010dd4ccd6c748e" "cab3a8ede031290aad67cbea974e3c03883f30ed" "55439861cd1e3806bb8e0700792d1944d62af0f6")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"collis"
	"copano"
	"delbin"
	"drobit"
	"eldrid"
	"elemi"
	"halvor"
	"lindar"
	"lingcod"
	"malefor"
	"mudada"
	"terrador"
	"trondo"
	"voema"
	"volteer"
	"voxel"
	"zantor"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "$(printf "volteer/%s/${CONFIG_PATH} " "${PROJECTS[@]}")" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( volteer )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for volteer"
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
