# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Intel IPU6SE Chrome OS camera HAL"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="-* amd64"

# TODO(b/149069716): check in the HAL source codes into platform2 after
# finishing code review.
RDEPEND="
	!media-libs/cros-camera-hal-intel-ipu6-squash
	!media-libs/intel-ipu6se-libs-bin
	"
