#!/bin/bash
# Copyright 2021 The ChromiumOS Authors
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

# get config path for camera
config_path=$(cros_config /camera/config-file system-path)
if [ -n "${config_path}" ]; then
  if tmp_dir=$(mktemp -d /run/camera_config_path.XXXXXX); then
    if ln -sfnT -- "${config_path}" "${tmp_dir}/camera_config_path"; then
      rm -rf -- /run/camera/camera_config_path
      mv -fT -- "${tmp_dir}/camera_config_path" /run/camera/camera_config_path
    fi
    rm -rf -- "${tmp_dir}"
  fi
else
  rm -rf -- /run/camera/camera_config_path
fi

# update eeprom to /run/camera/EEPROM/
rm -rf -- /run/camera/EEPROM
eeprom_updater "${config_path:-/etc/camera/camera_info.json}"
