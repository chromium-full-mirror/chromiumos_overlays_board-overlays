# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="e08db8d90aeffe07c2769bb895965dd0a4d38c35"
CROS_WORKON_TREE=("e7dba8c91c1f3257c34d4a7ffff0ea2537aeb6bb" "d58be6324ba2a1d0452d23bafb39c869c5ed2cd6" "8554cf3113531a22b378b3b22530df273158e881" "c1d38e8161c4f9039dd6f414f3c815864cdbecff" "49ebbb04271c8adf7488fdfb4c30b4a08c85a414" "093c7a01cb65cb24871c5a2ce7c2bdd0a536fccf" "beaa4ae826abb3520fd39561f6556ff65c85078d" "f2476844d73365333531645393bbcbe0e4082023" "a4cbe16af032e773d01aee2117a82abad86b49c0")
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
