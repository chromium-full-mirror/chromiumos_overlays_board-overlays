# Copyright 2022 The ChromiumOS Authors
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE.makefile file.

EAPI=7

CROS_WORKON_COMMIT=("c1642270ed023a462223e93d1a9b3f953182b6d5" "0dd679081b9c8bfa2583d74e3a17a413709ea362")
CROS_WORKON_TREE=("168ad0880f42a3e13eb79f58b514c1d42d0dfda2" "d99abee3f825248f344c0638d5f9fcdce114b744")
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

src_install() {
	cros-ish_src_install

	insinto /etc/modprobe.d
	doins "${FILESDIR}/ish.conf"
}
