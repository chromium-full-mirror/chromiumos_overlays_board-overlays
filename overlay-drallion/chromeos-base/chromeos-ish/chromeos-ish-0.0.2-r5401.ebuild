# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE.makefile file.

EAPI=7

CROS_WORKON_COMMIT=("e31212c4a2d061ce535b36a8e471237aa4a13972" "92221d4688ed01cc361f01d650b82bf7e28078b2")
CROS_WORKON_TREE=("a22e951a601b66f0b59c5682cde73948611febf3" "2aeca3cffd0e69db866b5623819ecd5bf8db1232")
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
