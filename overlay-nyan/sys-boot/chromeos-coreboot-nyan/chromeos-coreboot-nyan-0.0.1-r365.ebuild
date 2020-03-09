# Copyright (c) 2013 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=4
CROS_WORKON_COMMIT=("bfaa84406b4fe795d93b80b8c8a51a843e7e7da0" "232def8e8a1d1551127aabb3af4a9054a4b217d5")
CROS_WORKON_TREE=("77a8629917df008a506a6ef5a388424db6627ea8" "f9c25c6b53a51deb7b6e1b043693b60719ec1109")
CROS_WORKON_PROJECT=("chromiumos/third_party/coreboot" "chromiumos/platform/vboot_reference")
CROS_WORKON_LOCALNAME=("coreboot" "../platform/vboot_reference")
CROS_WORKON_DESTDIR=("${S}" "${S}/vboot_reference")

inherit cros-board cros-workon cros-coreboot

KEYWORDS="arm"

DEPEND="dev-embedded/cbootimage"

RDEPEND="chromeos-base/vboot_reference"
