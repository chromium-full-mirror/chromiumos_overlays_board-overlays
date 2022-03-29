# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# TODO(b/209014481): Enable once this branch supports `.../kernelconfig
# checkconfig`.
CROS_WORKON_COMMIT="b7e632dd5b03151425c893d8ed1ff10f3e4fc5d2"
CROS_WORKON_TREE="cd67e748be84e4fc82da28398f71b2534bded5eb"
RESTRICT="test"

CROS_WORKON_PROJECT="chromiumos/third_party/kernel"
CROS_WORKON_LOCALNAME="kernel/v5.4"
CROS_WORKON_EGIT_BRANCH="chromeos-5.4"

# This must be inherited *after* EGIT/CROS_WORKON variables defined
inherit cros-workon cros-kernel2

HOMEPAGE="https://www.chromium.org/chromium-os/chromiumos-design-docs/chromium-os-kernel"
DESCRIPTION="Chrome OS Linux Kernel 5.4"
KEYWORDS="*"
IUSE="+apply_patches"

# Change the following (commented out) number to the next prime number
# when you change "cros-kernel2.eclass" to work around http://crbug.com/220902
#
# NOTE: There's nothing magic keeping this number prime but you just need to
# make _any_ change to this file.  ...so why not keep it prime?
#
# Don't forget to update the comment in _all_ chromeos-kernel-x_x-9999.ebuild
# files (!!!)
#
# The coolest prime number is: 127
