# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE.makefile file.

EAPI=7

<<<<<<< HEAD:overlay-drallion/chromeos-base/chromeos-ish/chromeos-ish-0.0.2-r1069.ebuild
CROS_WORKON_COMMIT=("bd018841f6f2856c949dcf9b6dd462872cd18d7f" "1e2e9d7183f545eefd1a86a07b0ab6f91d837a6c")
CROS_WORKON_TREE=("245d6874e54040b49d7cd3e166528f3939b513e9" "fdbc51bbd5a7ee9d532ea1aa30cf21e57ca199db")
=======
CROS_WORKON_COMMIT=("215ffecfcade20abc326410868504184c66cd82b" "3c5ce9a1c631043476c0f52bad47f241680cc053")
CROS_WORKON_TREE=("2e78f98dd561908f62f088976b64926451115ede" "86f00f9caaf3655e9dd1cc01c05ac4662fa3dae5")
>>>>>>> d6084af3e8 (Marking set of ebuilds as stable):overlay-drallion/chromeos-base/chromeos-ish/chromeos-ish-0.0.2-r1570.ebuild
CROS_WORKON_PROJECT=(
	"chromiumos/platform/ec"
	"chromiumos/third_party/cryptoc"
)
CROS_WORKON_LOCALNAME=(
	"platform/ec"
	"third_party/cryptoc"
)
CROS_WORKON_DESTDIR=(
	"${S}/platform/ec"
	"${S}/third_party/cryptoc"
)

inherit cros-workon cros-ish

DESCRIPTION="ECOS ISH image"
HOMEPAGE="https://www.chromium.org/chromium-os/ec-development"

LICENSE="BSD-Google"
KEYWORDS="*"
