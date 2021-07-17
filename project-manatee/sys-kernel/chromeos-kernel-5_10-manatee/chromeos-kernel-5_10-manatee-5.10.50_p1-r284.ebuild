# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="62cf847cda2f042040f8f7252ebe9886d3aac224"
CROS_WORKON_TREE="c8a03a3f7fdb17fa92309b6d8a58cf4dc4244b87"
CROS_WORKON_PROJECT="chromiumos/third_party/kernel"
CROS_WORKON_LOCALNAME="kernel/v5.10"
CROS_WORKON_EGIT_BRANCH="chromeos-5.10"

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
	local cfgarch="$(get_build_arch)"
	CHROMEOS_KERNEL_CONFIG="${FILESDIR}/defconfig.${cfgarch}" \
		cros-kernel2_src_configure
	# Set the correct ROOT path in kernel config.
	sed -i "/=/s|%ROOT%|${ROOT}|" "$(get_build_cfg)"
}

src_install() {
	cros-kernel2_src_install "/build/manatee"
}
