# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# This ebuild only cares about its own FILESDIR and ebuild file, so it tracks
# the canonical empty project.
CROS_WORKON_PROJECT="chromiumos/infra/build/empty-project"
CROS_WORKON_LOCALNAME="platform/empty-project"

inherit appid cros-unibuild cros-workon udev

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
KEYWORDS="~* ~amd64 ~x86"
IUSE="adlnrvp bootimage nirva nissa-arc-t nissa-cbx nissa-kernelnext zephyr_ec zephyr_ish zephyr_ish_pinned nissa-pvs"

RESTRICT="mirror"

GS_FW_BUCKET="gs://chromeos-binaries/HOME/bcs-nissa-private/overlay-nissa-private/chromeos-base/chromeos-firmware-nissa"
SRC_URI="
	zephyr_ish? ( zephyr_ish_pinned? ( ${GS_FW_BUCKET}/Trulo_ISH.16211.0.0.tbz2 ) )
	zephyr_ish? ( zephyr_ish_pinned? ( ${GS_FW_BUCKET}/Uldrenite_ISH.16339.0.0.tbz2 ) )
"

# Add dependencies on other ebuilds from within this board overlay
RDEPEND="
	chromeos-base/sof-binary:=
	chromeos-base/sof-topology:=
	chromeos-base/touch_updater:=
"
DEPEND="
	${RDEPEND}
	chromeos-base/chromeos-config:=
	zephyr_ish? ( chromeos-base/chromeos-zephyr-ish:= )
	bootimage? ( sys-boot/chromeos-bootimage:= )
	zephyr_ec? ( chromeos-base/chromeos-zephyr:= )
"
BDEPEND="
	chromeos-base/chromeos-config-host
"

_foreach_ish() {
	local func_name="$1"
	while read -r project && read -r ish_name; do
		if [[ -z "${ish_name}" ]]; then
			continue
		fi
		"${func_name}" "${project}" "${ish_name}"
	done < <(cros_config_host "get-firmware-build-combinations" ish || die)
}

_unpack_ish() {
	local project="$1"
	local firmware_name="$2"
	local bundle=$(cros_config_host "get-firmware-version" "${project}" ish)

	if [[ -z "${bundle}" ]]; then
		return
	fi

	unpack "${bundle}.tbz2" || die
	mkdir -p "${S}/${project}" || die
	mv "${WORKDIR}/ish_fw.bin" "${S}/${project}/"
	# The component manifest must be packed in the released tarball.
	mv "${WORKDIR}/component_manifest.json" "${S}/${project}/"
}

_install_pinned_ish() {
	local project="$1"
	local firmware_name="$2"
	local output_name=${firmware_name//-/_}

	insinto "/lib/firmware/intel"
	if [[ -e "${S}/${project}/ish_fw.bin" ]]; then
		# Only install the file if it exists. If a new project is being
		# brought up it might not yet have a pinned version that's
		# unpacked.
		newins "${S}/${project}/ish_fw.bin" "${output_name}.bin"
	else
		newins "${ROOT}/firmware/${project}/${firmware_name}/ish_fw.bin" "${output_name}.bin"
	fi
}

_install_ish_manifest() {
	local project="$1"
	local firmware_name="$2"

	if [[ -e "${S}/${project}/component_manifest.json" ]]; then
		# Only install the component manifest for a pinned firmware.
		insinto "/usr/share/cme/ish/${firmware_name}"
		doins "${S}/${project}/component_manifest.json"
	fi
}

src_unpack() {
	mkdir -p "${S}"
	if use zephyr_ish && use zephyr_ish_pinned ; then
		_foreach_ish "_unpack_ish"
	fi
}

src_install() {
	if use adlnrvp; then
		doappid "{D60D81DB-751D-4EB6-AF86-8C073A6BBB91}" "REFERENCE"
	elif use nissa-arc-t; then
		doappid "{334D3052-1921-4434-AD6D-84A8D5C5F97A}" "REFERENCE"
	elif use nissa-cbx; then
		doappid "{92CAA1E8-1A1E-4C85-97BC-3C17EF0CDF5E}" "REFERENCE"
	elif use nissa-kernelnext; then
		doappid "{D54FD0B1-5EBA-499C-89B9-F0FA42E11614}" "REFERENCE"
	elif use nissa-pvs; then
		doappid "{99582A00-F79E-4E99-A440-37E461A98E8D}" "REFERENCE"
	elif use nirva; then
		doappid "{4A0296DB-F5D5-46A0-8825-77826B2A79D6}" "REFERENCE"
	else
		doappid "{A5F9E181-D0BE-4D6D-B67D-125069233535}" "REFERENCE"
	fi
	# Install audio config files
	unibuild_install_files audio-files

	# Install Proximity sensor rules
	udev_dorules "${FILESDIR}"/common/udev/*.rules

	# Install platform specific config files for power_manager.
	insinto "/usr/share/power_manager/board_specific"
	doins "${FILESDIR}"/powerd_prefs/*

	if use zephyr_ish ; then
		if use zephyr_ish_pinned ; then
			_foreach_ish _install_pinned_ish
			_foreach_ish _install_ish_manifest
		fi
	fi

	dosbin "${FILESDIR}/r8169_aspm_quirk.sh"
}
