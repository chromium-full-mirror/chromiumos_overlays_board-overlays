# Copyright 2023 The Chromium OS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT=("8514e0607306cc6cd870ebe8c72e5311a6f96137" "238d0bcbcf1df0ea82e0995cf47ea0c137aee127")
CROS_WORKON_TREE=("f91b6afd5f2ae04ee9a2c19109a3a4a36f7659e6" "a03caacdfab9524ab25dbbc35ead59c55f3f1dd2" "9cafba2459efecc577fec6a3948991a3f465dc13")
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
