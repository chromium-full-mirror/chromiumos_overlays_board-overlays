#!/bin/sh
#
# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.
#
# Select dptf configuration based on the following criteria.
# - CPU model name
# - dram part number prefix
# - Amount of dram
#
# Documentation: go/atlas-dptf-override
#

dptf_get_override() {
  local dram_part
  local cpu_model
  local dptf_file

  cpu_model="$(uname -p | grep -o "[im][357]")"
  dram_part="$(mosys memory spd print id -s part_number | grep -om1 ^..)"
  dram_size="$(head -1 /proc/meminfo | grep -oE ' (8|16)' | cut -c 2-)"

  cpu_dram="$(echo "${cpu_model}"-"${dram_part}-${dram_size}")"

  dptf_file=""
  case "${cpu_dram}" in
    m3-K4-8)  dptf_file="0088_0987.bin" ;;
    m3-MT-8)  dptf_file="0088_0987.bin" ;;
    i5-K4-8)  dptf_file="0088_0987.bin" ;;
    i5-MT-8)  dptf_file="0088_0987.bin" ;;
    i5-K4-16) dptf_file="0088_0987.bin" ;;
    i5-MT-16) dptf_file="3210_2008.bin" ;;
    i7-K4-16) dptf_file="3210_2008.bin" ;;
    i7-MT-16) dptf_file="3311_2109.bin" ;;
  esac

  if [ ! -f "/etc/dptf/${dptf_file}" ]; then
    dptf_file=""
  fi

  echo "${dptf_file}"
}
