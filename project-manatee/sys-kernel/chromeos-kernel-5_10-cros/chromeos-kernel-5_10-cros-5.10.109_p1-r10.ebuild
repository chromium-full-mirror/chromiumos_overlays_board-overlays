# Copyright 2022 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="7b2432fc3bd5adde321d92ac92c683bccb455e48"
CROS_WORKON_TREE="9d23f12e518c65538bfe05394564a95d6c3f0f2f"
CROS_WORKON_PROJECT="chromiumos/third_party/kernel"
CROS_WORKON_LOCALNAME="kernel/v5.10-manatee"
CROS_WORKON_EGIT_BRANCH="chromeos-5.10-manatee"

# This must be inherited *after* EGIT/CROS_WORKON variables defined
inherit cros-workon cros-kernel2

HOMEPAGE="https://www.chromium.org/chromium-os/chromiumos-design-docs/chromium-os-kernel"
DESCRIPTION="Chrome OS Linux Kernel 5.10 manatee guest"
KEYWORDS="*"

RDEPEND+="!sys-kernel/chromeos-kernel-5_10"
# This is Manatee specific 5.10 kernel temporarily branched in order to allow
# development for teamfood. We will undiverge and remove this soon!
#
# Change the following (commented out) number to the next prime number
# when you change "cros-kernel2.eclass" to work around http://crbug.com/220902
#
# NOTE: There's nothing magic keeping this number prime but you just need to
# make _any_ change to this file.  ...so why not keep it prime?
#
# Don't forget to update the comment in _all_ chromeos-kernel-x_x-9999.ebuild
# files (!!!)
#
# The coolest prime number is: 197
