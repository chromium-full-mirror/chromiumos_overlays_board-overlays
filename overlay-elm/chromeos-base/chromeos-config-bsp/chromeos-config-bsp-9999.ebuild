# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=7

# cros_workon applies only to ebuild and files directory. Use the
# canonical empty project.
CROS_WORKON_PROJECT="chromiumos/infra/build/empty-project"
CROS_WORKON_LOCALNAME="platform/empty-project"

inherit cros-workon cros-unibuild

DESCRIPTION="ChromeOS model configuration"
HOMEPAGE="https://chromium.googlesource.com/chromiumos/platform2/+/master/chromeos-config/README.md"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="~*"
IUSE="elm-kernelnext"

src_install() {
	insinto "${UNIBOARD_YAML_DIR}"
	doins "${FILESDIR}/model.yaml"

	if use elm-kernelnext; then
		# This installed with z- prefix so that it gets merged last.
		newins "${FILESDIR}/kernelnext-model.yaml" "z-kernelnext-model.yaml"
	fi
}
