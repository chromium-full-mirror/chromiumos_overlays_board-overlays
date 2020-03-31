# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="3f9ea4ac1dc843d786dcb2ff0f75b85fbe4dca65"
CROS_WORKON_TREE=("e7dba8c91c1f3257c34d4a7ffff0ea2537aeb6bb" "d58be6324ba2a1d0452d23bafb39c869c5ed2cd6" "34c6ba85b43f5afe5fec57baa1f0a639dd1b99b8" "3afe296c9af085e0441d246f689470035cec8b13" "9863ee9778012b49f27d5c4a939f6b7e6c1cf36e" "ce7f8b7d17ca5ea5acf26e9d0329b53f518f0336" "2ef18d1c42c7aee2c4bb4110359103045c055adf" "640c33c9991cd45edff3ff00efdee3e3670279f3" "b32a17c655cfb8a28203d57fe6aad6de8b77f697")
CROS_WORKON_PROJECT="chromiumos/platform2"
CROS_WORKON_LOCALNAME="../platform2"
CROS_WORKON_SUBTREE=".gn camera/build camera/common camera/hal/mediatek camera/include camera/mojo common-mk metrics chromeos-config"
CROS_WORKON_OUTOFTREE_BUILD="1"

PLATFORM_SUBDIR="camera/hal/mediatek"

inherit cros-camera cros-workon platform

DESCRIPTION="Mediatek ISP Chrome OS camera HAL"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="-* arm arm64"

RDEPEND="
	chromeos-base/chromeos-config-tools
	media-libs/cros-camera-libcab
	media-libs/cros-camera-libcamera_client
	media-libs/cros-camera-libcamera_common
	media-libs/cros-camera-libcamera_metadata
	media-libs/cros-camera-libcamera_v4l2_device
	media-libs/cros-camera-libcbm
	media-libs/libsync
	media-libs/mtk-hal-config
	media-libs/mtk-isp-3a-libs-bin
	media-libs/mtk-sensor-metadata
	media-libs/mtk-tuning-libs-bin"

DEPEND="${RDEPEND}
	chromeos-base/metrics
	media-libs/cros-camera-android-headers
	media-libs/libyuv
	sys-kernel/linux-headers
	virtual/pkgconfig"

MTK_HAL_LIBRARIES=(
	"libcam.device3.so"
	"libcam.feature_utils.so"
	"libcam3_app.so"
	"libcam_algo.so"
	"libcam_algo_client.so"
	"libcam_iopie_common.so"
	"libcam_iopie_utils.so"
	"libcam_normalpipe.so"
	"libcam_normalstream.so"
	"libcamera.mt8183.so"
	"libcameracustom.so"
	"libfeature.face.so"
	"libfeature_3dnr.so"
	"libfeature_lmv.so"
	"libmtk_halsensor.so"
	"libmtk_mc_libv4l2.so"
	"libmtk_platform_log.so"
	"libmtk_property.so"
	"libmtkcam.featurepipe.capture.so"
	"libmtkcam.featurepipe.core.so"
	"libmtkcam.featurepipe.streaming.so"
	"libmtkcam.featurepipe.util.so"
	"libmtkcam.logicalmodule.so"
	"libmtkcam_3rdparty.so"
	"libmtkcam_debugutils.so"
	"libmtkcam_exif.so"
	"libmtkcam_fdvt.so"
	"libmtkcam_grallocutils.so"
	"libmtkcam_hwnode.so"
	"libmtkcam_hwutils.so"
	"libmtkcam_imgbuf.so"
	"libmtkcam_metadata.so"
	"libmtkcam_metastore.so"
	"libmtkcam_modulefactory_aaa.so"
	"libmtkcam_modulefactory_custom.so"
	"libmtkcam_modulefactory_drv.so"
	"libmtkcam_modulefactory_utils.so"
	"libmtkcam_modulehelper.so"
	"libmtkcam_pipeline.so"
	"libmtkcam_pipelinemodel.so"
	"libmtkcam_pipelinemodel_utils.so"
	"libmtkcam_pipelinepolicy.so"
	"libmtkcam_stdutils.so"
	"libmtkcam_streamutils.so"
	"libmtkcam_sysutils.so"
	"libmtkcam_tuning_utils.so"
	"libmtkcam_v4l2drvmgr.so"
)

src_install() {
	# install hal libs to dev
	for lib in "${MTK_HAL_LIBRARIES[@]}"; do
		dolib.so "${OUT}/lib/${lib}"
	done
	dobin "${OUT}"/setprop
	dobin "${OUT}"/getprop
	dobin "${OUT}"/eeprom_updater
	cros-camera_dohal "${OUT}/lib/libcamera.mt8183.so" mtk_cam_hal.so
}
