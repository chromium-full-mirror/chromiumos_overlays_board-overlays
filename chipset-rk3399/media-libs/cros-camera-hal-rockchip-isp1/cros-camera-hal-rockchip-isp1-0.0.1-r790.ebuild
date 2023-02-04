# Copyright 2018 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

CROS_WORKON_COMMIT=("eb0846c656180dd81522e64a8fecea93b2322645" "de155d51460902906f589ed3b1f7ccd5a2c0d158")
CROS_WORKON_TREE=("f91b6afd5f2ae04ee9a2c19109a3a4a36f7659e6" "e3b92b04b3b4a9c54c71955052636c95b5d2edcd" "10e204250fd040048fe5437afaa4e63c40b27fd8")
CROS_WORKON_PROJECT=("chromiumos/platform2" "chromiumos/platform/camera")
CROS_WORKON_LOCALNAME=("../platform2" "../platform/camera")
CROS_WORKON_DESTDIR=("${S}/platform2" "${S}/platform2/platform_camera")
CROS_WORKON_SUBTREE=(".gn common-mk" "hal/rockchip")
CROS_WORKON_INCREMENTAL_BUILD="1"

PLATFORM_SUBDIR="platform_camera/hal/rockchip"

inherit cros-camera cros-workon platform

DESCRIPTION="Rockchip ISP1 Chrome OS camera HAL"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="-* arm arm64"

RDEPEND="
	dev-libs/expat
	chromeos-base/cros-camera-android-deps
	chromeos-base/cros-camera-libs
	media-libs/libsync
	media-libs/rockchip-isp1-3a-libs-bin"

DEPEND="${RDEPEND}
	media-libs/libyuv
	sys-kernel/linux-headers
	virtual/jpeg:0
	virtual/pkgconfig"
