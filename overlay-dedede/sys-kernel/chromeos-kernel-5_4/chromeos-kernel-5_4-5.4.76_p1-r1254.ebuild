# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7
<<<<<<< HEAD:overlay-dedede/sys-kernel/chromeos-kernel-5_4/chromeos-kernel-5_4-5.4.72_p1-r861.ebuild
CROS_WORKON_COMMIT="bf35453c356a1c13d7418e52934cb28a1a84e4e4"
CROS_WORKON_TREE="a2f34c91c6e069ee8720a21e086f5efdf70cadae"
=======
CROS_WORKON_COMMIT="6c37a7f134c7e4b79d9f6a03e447574bf59e533f"
CROS_WORKON_TREE="61d67f6d1d14473d1ba4483308123b75c79488aa"
>>>>>>> d6084af3e8 (Marking set of ebuilds as stable):overlay-dedede/sys-kernel/chromeos-kernel-5_4/chromeos-kernel-5_4-5.4.76_p1-r1254.ebuild
CROS_WORKON_PROJECT="chromiumos/third_party/kernel"
CROS_WORKON_LOCALNAME="kernel/v5.4"

# This must be inherited *after* EGIT/CROS_WORKON variables defined
inherit cros-workon cros-kernel2

HOMEPAGE="https://www.chromium.org/chromium-os/chromiumos-design-docs/chromium-os-kernel"
DESCRIPTION="dedede-specific Chrome OS Linux Kernel 5.4"
KEYWORDS="*"

IUSE="+apply_patches"
