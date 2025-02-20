# Copyright 2017 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

CROS_WORKON_COMMIT=("7fbae679bb0fd092453f7e008db2fdc2d1a0e5a2" "2eceb47dafbe9f237b3ffeaa55010f7136f73c22")
CROS_WORKON_TREE=("f91b6afd5f2ae04ee9a2c19109a3a4a36f7659e6" "29a05dddc4a3fd25f82217bc0cf98a14697c7a80" "db0b6b2681583c9f5b6358ed42d742ca3f70824c")
CROS_WORKON_PROJECT=("chromiumos/platform2" "chromiumos/platform/camera")
CROS_WORKON_LOCALNAME=("../platform2" "../platform/camera")
CROS_WORKON_DESTDIR=("${S}/platform2" "${S}/platform2/platform_camera")
CROS_WORKON_SUBTREE=(".gn common-mk" "hal/intel/ipu3")
CROS_WORKON_INCREMENTAL_BUILD="1"

PLATFORM_SUBDIR="platform_camera/hal/intel/ipu3"

inherit cros-camera cros-workon platform

DESCRIPTION="Intel IPU3 (Image Processing Unit) Chrome OS camera HAL"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="-* amd64"

IUSE="cros_camera_algo"
REQUIRED_USE="cros_camera_algo"

RDEPEND="
	chromeos-base/cros-camera-android-deps
	chromeos-base/cros-camera-libs
	dev-libs/expat
	media-libs/intel-3a-libs-bin
	media-libs/intel-pvl-libs-bin
	media-libs/libsync"

DEPEND="${RDEPEND}
	media-libs/libyuv
	sys-kernel/linux-headers
	virtual/jpeg:0
	virtual/pkgconfig"
