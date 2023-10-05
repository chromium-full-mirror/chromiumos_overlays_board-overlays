# Copyright 2023 The Chromium OS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT=("6d9e6464cb66c867bcd706ed06d48f9398daae67" "b58e4a030de7ccdacdda1bd856ea4cfbb653a57d")
CROS_WORKON_TREE=("f91b6afd5f2ae04ee9a2c19109a3a4a36f7659e6" "47967e7cde1d19a0a6f820c6cffa5aa36495c6a1" "e0290810d21dcd04a59072c9adf248f8bd8e892d")
CROS_WORKON_PROJECT=("chromiumos/platform2" "chromiumos/platform/camera")
CROS_WORKON_LOCALNAME=("../platform2" "../platform/camera")
CROS_WORKON_DESTDIR=("${S}/platform2" "${S}/platform2/platform_camera")
CROS_WORKON_SUBTREE=(".gn common-mk" "hal/mediatek")
CROS_WORKON_INCREMENTAL_BUILD="1"

PLATFORM_SUBDIR="platform_camera/hal/mediatek/mtkcam_tinymw/mtkcam-core"

inherit cros-camera cros-workon platform meson

DESCRIPTION="Mediatek ISP Chrome OS camera HAL"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="-* arm arm64"

RDEPEND="
	chromeos-base/chromeos-config-tools
	chromeos-base/cros-camera-android-deps
	chromeos-base/cros-camera-libs
	media-libs/libsync
	media-libs/mtk-isp7-aie-firmware
	media-libs/mtk-isp7-3a-libs-bin
	media-libs/mtk-isp7-tuning-libs-bin
	media-libs/mtk-isp7-hwcore
	"

DEPEND="
	${RDEPEND}
	media-libs/libyuv
	sys-kernel/linux-headers
	virtual/pkgconfig
	"

src_configure() {
	"${S}/link_gen.py" "mt8188" "${S}"
	export TARGET_PLATFORM="mt8188"
	meson_src_configure
}

src_compile() {
	meson_src_compile
}

src_install() {
	meson_src_install
	# install hal libs to dev
#	dobin "${OUT}"/setprop
#	dobin "${OUT}"/getprop
#	dobin "${OUT}"/eeprom_updater
#	cros-camera_dohal "${OUT}/lib/libcamera.mt8183.so" mtk_cam_hal.so
}
