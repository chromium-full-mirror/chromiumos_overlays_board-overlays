# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="a34fc0a18f7e71d743c7231ef8186bf3779b5b11"
CROS_WORKON_TREE="c562f1f332d4bb3446f34368041d70bd2b107ae2"
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
