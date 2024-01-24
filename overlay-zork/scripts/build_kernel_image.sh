#!/bin/bash

# Copyright 2019 The ChromiumOS Authors
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

# All kernel command line changes must update the security base lines in
# the signer.  It rejects any settings it does not recognize and breaks the
# build.  So any modify_kernel_command_line() function change here needs to be
# reflected in ensure_secure_kernelparams.config.

# See crrev.com/i/216896 as an example.

modify_kernel_command_line() {
  {
    echo "amdgpu.dcfeaturemask=0x8"

    # See b/306665683
    echo "amdgpu.ppfeaturemask=0xfff73fff"

    # See b/160277722
    echo "rtc-cmos.use_acpi_alarm=1"

    # See b/271817196
    echo "clearcpuid=xsaves"

    # See b/247635516
    echo "initcall_blacklist=amdtee_driver_init" >> "$1"

    # See b/247635189. Remove when b/273577446 is finished
    echo "iommu=soft" >> "$1"
  } >> "$1"
}
