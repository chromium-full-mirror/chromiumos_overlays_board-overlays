# Copyright 2017 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Packages for Termina test images"
HOMEPAGE="http://dev.chromium.org/"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND="
	chromeos-base/chromeos-test-root
	chromeos-base/graphics-utils-python
	dev-python/protobuf-python
	sys-apps/net-tools
	sys-apps/pciutils
	sys-apps/usbutils
	media-sound/alsa-utils
"
