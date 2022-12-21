# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="fbee5aa78adf49a7dc56a8f18e7a5eb764c2fa75"
CROS_WORKON_TREE="699836efb9484c1bc39cf88c4379e82d2eb175c9"
CROS_WORKON_PROJECT="chromiumos/third_party/kernel"
CROS_WORKON_LOCALNAME="kernel/v5.10-manatee"
CROS_WORKON_EGIT_BRANCH="chromeos-5.10-manatee"

# This must be inherited *after* EGIT/CROS_WORKON variables defined
inherit cros-workon cros-kernel2

HOMEPAGE="https://www.chromium.org/chromium-os/chromiumos-design-docs/chromium-os-kernel"
DESCRIPTION="Chrome OS Linux Kernel 5.10-manatee"
KEYWORDS="* amd64 x86"

DEPEND="
	chromeos-base/chromeos-initramfs
"
RDEPEND=""

src_configure() {
	cros-kernel2_src_configure
	# Set the correct ROOT path in kernel config.
	sed -i "/=/s|%ROOT%|${ROOT}|" "$(get_build_cfg)"
}

src_install() {
	cros-kernel2_src_install "/build/manatee"
}
