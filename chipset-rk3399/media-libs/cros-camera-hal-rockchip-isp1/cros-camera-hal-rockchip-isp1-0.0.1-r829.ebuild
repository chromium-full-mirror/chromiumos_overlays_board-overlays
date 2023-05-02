# Copyright 2018 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

CROS_WORKON_COMMIT=("d06f04260ca959e5aea7000215c51020dd9cdeee" "a86ce183b23ac51eb2d3e44584715d2a3db197ba")
CROS_WORKON_TREE=("f91b6afd5f2ae04ee9a2c19109a3a4a36f7659e6" "279f20fb4e70a43f5e8867d4587188ee9ed63191" "22d0ba859ae649d8e206e39ff2ceb7c0d0a7b206")
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
