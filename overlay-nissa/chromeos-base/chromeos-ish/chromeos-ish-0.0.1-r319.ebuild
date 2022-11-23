# Copyright 2022 The ChromiumOS Authors
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE.makefile file.

EAPI=7

CROS_WORKON_COMMIT=("d645e2e2ab3a8bf2ef88b4fa1e8382d13014c55d" "0dd679081b9c8bfa2583d74e3a17a413709ea362")
CROS_WORKON_TREE=("ceacf9b26b8758187c78a824e0ad3097c2e0395e" "d99abee3f825248f344c0638d5f9fcdce114b744")
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
