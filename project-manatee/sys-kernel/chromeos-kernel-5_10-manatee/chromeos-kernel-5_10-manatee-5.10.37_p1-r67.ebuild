# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="887a72564fbf9ef7293720ba72b364bb1e589521"
CROS_WORKON_TREE="191598b4be0ecbce6844bc81ef76f1cf7f7ffb62"
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
