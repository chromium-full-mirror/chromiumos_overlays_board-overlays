# Copyright 2022 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="c41df18d3762585f27ce61aad555b7f85c70a2c4"
CROS_WORKON_TREE="e7ef192ca1556a409670881815b7e11de0ebc2c9"
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
