# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="3325c135c3b981118ca0c7214415d9ae50bac4ca"
CROS_WORKON_TREE="1c11709f676a0c0cc9518882f50676881caa1348"
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
