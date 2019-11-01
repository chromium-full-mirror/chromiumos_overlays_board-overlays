# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2.

EAPI=6

CROS_WORKON_COMMIT="bb3f31d32824dc4cbf73b7267df8f4dd72b5be60"
CROS_WORKON_TREE="0cd7b5c670d81abb978d3df6d43b6e9c0b94d5f9"
CROS_WORKON_INCREMENTAL_BUILD=1
CROS_WORKON_OUTOFTREE_BUILD=1
CROS_WORKON_PROJECT="chromiumos/platform/moblab"
CROS_WORKON_LOCALNAME="../platform/moblab"

inherit cros-workon

DESCRIPTION="Install moblab, a test scheduling infrastructure"
HOMEPAGE="https://chromium.googlesource.com/chromiumos/platform/moblab/+/master/src/"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"
IUSE="docker"

SRC_URI="${BASE_SRC_URI}/mobmonitor-ui-node_modules-0.0.2.tar.gz
		${BASE_SRC_URI}/moblab-ui-node_modules-0.0.1.tar.gz"
RDEPEND="
		app-admin/logrotate
		app-emulation/docker
		dev-python/cherrypy
		dev-python/futures
		dev-python/google-cloud-storage
		dev-python/grpcio
		dev-python/parallel-ssh
		dev-python/protobuf-python
		net-libs/grpc
		sys-apps/moblab-common
"

DEPEND="${RDEPEND}
"

src_unpack() {
	cros-workon_src_unpack
	default
}
