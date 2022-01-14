# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE.makefile file.

EAPI=7

CROS_WORKON_COMMIT=("cc05c7dab11a90ec05d7fe0bda4a647d634d8e15" "92221d4688ed01cc361f01d650b82bf7e28078b2")
CROS_WORKON_TREE=("85afe340c3ba88fee4a6a0286f70d33f97aa591c" "2aeca3cffd0e69db866b5623819ecd5bf8db1232")
CROS_WORKON_PROJECT=(
	"chromiumos/platform/ec"
	"chromiumos/third_party/cryptoc"
)
CROS_WORKON_LOCALNAME=(
	"platform/ec"
	"third_party/cryptoc"
)
CROS_WORKON_DESTDIR=(
	"${S}/platform/ec"
	"${S}/third_party/cryptoc"
)

inherit cros-workon cros-ish

DESCRIPTION="ECOS ISH image"
HOMEPAGE="https://www.chromium.org/chromium-os/ec-development"

LICENSE="BSD-Google"
KEYWORDS="*"
