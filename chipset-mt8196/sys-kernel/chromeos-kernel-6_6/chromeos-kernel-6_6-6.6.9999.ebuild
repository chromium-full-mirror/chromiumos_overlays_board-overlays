# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="0879c1ab94ac470303ea991cd23a1cec7190d27f"
CROS_WORKON_TREE="63c1421dcc5e47b648c140545932a4f50853ecd9"
CROS_WORKON_PROJECT="chromiumos/third_party/kernel"
CROS_WORKON_LOCALNAME="kernel/v6.6"
CROS_WORKON_MANUAL_UPREV="1"

inherit cros-workon cros-kernel

HOMEPAGE="https://www.chromium.org/chromium-os/chromiumos-design-docs/chromium-os-kernel"
DESCRIPTION="Chrome OS Linux Kernel 6.6 with Rauru private patches."
KEYWORDS="*"
