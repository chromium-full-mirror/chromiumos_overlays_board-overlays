# Copyright 2022 The ChromiumOS Authors
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE.makefile file.

EAPI=7

CROS_WORKON_COMMIT=("3a9cc3afab285ddc3fe9fe4a42a1fc37f497a63f" "0dd679081b9c8bfa2583d74e3a17a413709ea362")
CROS_WORKON_TREE=("db8dfae14a60d0b363f7dece4bf1e39414f832d3" "d99abee3f825248f344c0638d5f9fcdce114b744")
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
