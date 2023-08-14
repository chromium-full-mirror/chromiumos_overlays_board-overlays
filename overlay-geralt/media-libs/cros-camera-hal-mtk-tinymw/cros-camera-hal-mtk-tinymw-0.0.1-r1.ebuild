# Copyright 2023 The Chromium OS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT=("64a51451b75a2221d5c6e64c35aa0d311b7fdda2" "07196dbaf05db938ce932832bd7ff4d72115e556")
CROS_WORKON_TREE=("f91b6afd5f2ae04ee9a2c19109a3a4a36f7659e6" "bcc3027b3b6db37fd9e7c5c8c7d45fd56a0ee3e5" "4df9f7e1816dace7d4d9348092823208963b7611")
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
