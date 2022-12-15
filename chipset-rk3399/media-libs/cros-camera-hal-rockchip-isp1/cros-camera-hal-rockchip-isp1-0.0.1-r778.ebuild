# Copyright 2018 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

CROS_WORKON_COMMIT=("d9b35688d673fc3df047212a2ba0056d35870b95" "da3b5da1c09e4bbaa4ac34a3f4b94874baf61e30")
CROS_WORKON_TREE=("f91b6afd5f2ae04ee9a2c19109a3a4a36f7659e6" "232eeac462515f4e1460770a38b8ac52bef0adec" "736b32b8ed17a32e17362e8ebd1a8a6965b189a0")
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

HAL_DIR="hal/rockchip"

src_install() {
	dolib.so "${OUT}/lib/libcam_algo.so"
	cros-camera_dohal "${OUT}/lib/libcamera_hal.so" rockchip-isp1.so
}
