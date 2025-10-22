# Copyright 2025 The ChromiumOS Authors
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=7

DESCRIPTION="Coreboot files for Skywalker baseboard"
KEYWORDS="~*"
LICENSE="BSD-Google"

# This ebuild only cares about its own FILESDIR and ebuild file, so it tracks
# the canonical empty project.
CROS_WORKON_PROJECT="chromiumos/infra/build/empty-project"
CROS_WORKON_LOCALNAME="../platform/empty-project"

# No need to inherit coreboot-private-files as there are no files in ${FILESDIR}
inherit cros-workon

DEPEND="
	=sys-firmware/realtek-rts5453-GOOG0B00-firmware-16.2.3-r1
	=sys-firmware/realtek-rts5453-GOOG0B01-firmware-16.2.3-r1
	=sys-firmware/realtek-rts5453-GOOG0B02-firmware-16.2.3-r1
	=sys-firmware/realtek-rts5453-GOOG0C00-firmware-16.2.3-r1
	=sys-firmware/realtek-rts5453-GOOG0D00-firmware-16.2.3-r1
"
RDEPEND="${DEPEND}"
