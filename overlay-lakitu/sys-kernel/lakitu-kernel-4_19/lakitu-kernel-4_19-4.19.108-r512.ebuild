# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

# Any changes submitted in the current ebuild needs to be duplicated in
# `9999` ebuild as well.

EAPI=6

CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"
CROS_WORKON_PROJECT="chromiumos/third_party/lakitu-kernel"
CROS_WORKON_EGIT_BRANCH="release-R81-12871.B-lakitu-4.19"
CROS_WORKON_COMMIT="4d594cea40affe77720d76a1f70b5039aa488e52"
CROS_WORKON_BLACKLIST="1"

CHROMEOS_KERNEL_CONFIG="${FILESDIR}/base.config"

# This must be inherited *after* EGIT/CROS_WORKON variables defined
inherit cros-workon cros-kernel2 osreleased

STRIP_MASK+=" /usr/src/${P}/build/vmlinux"
STRIP_MASK+=" *.ko"

DESCRIPTION="Chromium OS Linux Kernel 4.19"
HOMEPAGE="https://www.chromium.org/chromium-os/chromiumos-design-docs/chromium-os-kernel"
KEYWORDS="*"
IUSE="module_sign gpu"

src_configure() {
	if use module_sign ; then
		# Provide a custom key configuration file, because otherwise the kernel
		# would auto-generate one.
		mkdir -p "$(cros-workon_get_build_dir)/certs"
		cp -f "${FILESDIR}/x509.genkey" \
			"$(cros-workon_get_build_dir)/certs/x509.genkey" || die
		# Different board use different root key.
		if use gpu ; then
			# The root key belongs to lakitu-gpu board.
			cp -f "${FILESDIR}/lakitu_gpu_root_cert.pem" \
				"$(cros-workon_get_build_dir)/certs/trusted_key.pem" || die
		else
			# The root key belongs to lakitu board.
			cp -f "${FILESDIR}/lakitu_root_cert.pem" \
				"$(cros-workon_get_build_dir)/certs/trusted_key.pem" || die
		fi
	fi
	cros-kernel2_src_configure
}

# Change for EAPI=6
src_prepare() {
	default
	cros-kernel2_src_prepare
}

tar_kernel_source() {
	# Put kernel source tarball under /opt to avoid it gets
	# masked by INSTALL_MASK.
	local source_dir=opt/google/src
	dodir "${source_dir}"
	pushd "${D}/usr/src/${P}"
	tar --exclude="./build" -czf "${D}/${source_dir}/kernel-src.tar.gz" .
	popd
}

write_toolchain_env() {
	# Write the compiler info used for kernel compilation
	# in toolchain_env.
	local toolchain_env_dir=etc
	# Example for toolchain_env content:
	# CC=x86_64-cros-linux-gnu-clang
	# CXX=x86_64-cros-linux-gnu-clang++
	# The file will be deleted after copying data to BUILD_DIR artifact
	echo "CC=${CC}" > "${D}/${toolchain_env_dir}/toolchain_env"
	echo "CXX=${CXX}" >> "${D}/${toolchain_env_dir}/toolchain_env"
}

write_kernel_info() {
	# Write kernel information used for building kernel.
	local kernel_info_dir=etc
	# Example for kernel_info content:
	# URL=https://chromium.googlesource.com/chromiumos/third_party/kernel
	echo "URL=${CROS_GIT_HOST_URL}/${CROS_WORKON_PROJECT}" > "${D}/${kernel_info_dir}/kernel_info"
}

get_kernel_commit_id() {
	# Provide kernel commit id
	# VCSID variable is unconditionally set by the cros-workon eclass, and
	# is in the form of "<ebuild_revision>-<sha1>".
	echo "${VCSID##*-}"
}

write_kernel_commit() {
	# Write kernel commit information used for building kernel.
	local kernel_commit_dir=etc
	# Example for kernel_commit content:
	# c7ad6ff415b5a1e87f8333e2a63c7209e6efc1b2
	get_kernel_commit_id > "${D}/${kernel_commit_dir}/kernel_commit"
}

src_install() {
	cros-kernel2_src_install

	do_osrelease_field "KERNEL_COMMIT_ID" "$(get_kernel_commit_id)"

	# Install kernel source tarball so it can be exported as an
	# artifact later.
	tar_kernel_source
	# Install kernel compiler information
	write_toolchain_env
	# Install kernel source information
	write_kernel_info
	# Install kernel commit information
	write_kernel_commit
}
