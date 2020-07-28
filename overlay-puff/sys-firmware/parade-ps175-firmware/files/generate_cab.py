#!/usr/bin/env python3
# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

"""Script to use gcab to generate standard cab file for fwupd update.

The CAB file, or Cabinet, is the archive format used by fwupd
program to perform auto firmware update.

This program is expected to be used for fwupd update with flashrom
command line workaround only. It accepts multiple binary files and
a configuration file, compress binaries into a tar file and put it
together with configuration file into the cab archive.
"""

from __future__ import division

import argparse
import io
from pathlib import Path
import re
import subprocess
import sys
import tarfile
import tempfile
import uuid

FIRMWARE_METAINFO_TEMPLATE = """
<?xml version="1.0" encoding="UTF-8"?>
<component type="firmware">
  <id>com.parade.PS175.firmware</id>
  <name>PS175</name>
  <summary>Firmware for the parade PS175</summary>
  <description>
    <p>
    Updating the PS175 firmware to improve display.
    </p>
  </description>
  <provides>
    <firmware type="flashed">%(device_guid)s</firmware>
  </provides>
  <metadata_license>CC0-1.0</metadata_license>
  <project_license>proprietary</project_license>
  <releases>
    <release version="%(release_version)s">
      <checksum filename="%(file_name)s" target="content"/>
      <description>
        Release version: %(release_version)s
      </description>
    </release>
  </releases>
</component>
"""

PS175_GUID_SOURCE = r'FLASHROM-I2C\VEN_1AF8&amp;DEV_0175'
LAYOUT_NAME = 'layout'
FLAG1_NAME = 'flag1.bin'
FLAG2_NAME = 'flag2.bin'
LAYOUT_DATA = ('10000:1ffff PARTITION1\n20000:2ffff PARTITION2\n'
               '00002:00003 FLAG')
FLAG1_BYTES = b'\x01\x00'
FLAG2_BYTES = b'\x02\xff'

# Subject to change depends on the real version format.
VERSION_RE = re.compile(r'V(?P<major>\d+)\.(?P<minor>\d+)$')

def firmware_version_from_name(firmware_name: str) -> str:
  """Get pair formatted version from firmware name.

  Retrieves a pair of version number from a given file name.

  Args:
    firmware_name: A name of firmware name.

  Returns:
    A string as a formatted version: {Major}.{Minor}.

  Raises:
    ValueError: An error occurred with bad firmware name.
  """
  match = VERSION_RE.search(firmware_name)
  if match:
    return f'{int(match.group("major"))}.{int(match.group("minor"))}'
  else:
    raise ValueError('Version number must present in firmware name.')


def tar_add_from_bytesio(tar: tarfile.TarFile, data: str, name: str) -> None:
  """Add data to a TarFile using BytesIO.

  Using the input to construct BytesIO object and add it as a single file into
  the tar file.

  Args:
    tar: An TarFile object, shuold be opened properly.
    data: A serials of binary data or properly encoded string.
    name: A string that the new file going to be named with.
  """
  target_io = io.BytesIO(data)
  tar_info = tarfile.TarInfo(name=name)
  tar_info.size = len(data)
  tar.addfile(tarinfo=tar_info, fileobj=target_io)


def write_cab(opts: argparse.Namespace) -> None:
  """Extract the information and write a cab file.

  Gathering information from user input options, write metadata,
  firmware tarball that includes the layout file. Put them together into
  a cab file.

  Args:
    opts: An option parsed by ArgumentParser, includes layout and the firmware
        blob path.
  """
  firmware_archive_name = f'{opts.firmware.stem}.tar.gz'
  firmware_metainfo = FIRMWARE_METAINFO_TEMPLATE % {
      'file_name': firmware_archive_name,
      'device_guid': uuid.uuid5(uuid.NAMESPACE_DNS, PS175_GUID_SOURCE),
      'release_version': firmware_version_from_name(opts.firmware.stem),
  }

  with tempfile.TemporaryDirectory() as tmp_dir:
    tmp_dir_path = Path(tmp_dir)
    firmware_metainfo_path = tmp_dir_path / '.metainfo.xml'
    firmware_arch_path = tmp_dir_path / firmware_archive_name
    firmware_metainfo_path.write_text(firmware_metainfo, encoding='utf-8')

    with tarfile.open(firmware_arch_path, 'w:gz') as tar:
      tar.add(opts.firmware, opts.firmware.name)
      tar_add_from_bytesio(tar, LAYOUT_DATA.encode('utf-8'), LAYOUT_NAME)
      tar_add_from_bytesio(tar, FLAG1_BYTES, FLAG1_NAME)
      tar_add_from_bytesio(tar, FLAG2_BYTES, FLAG2_NAME)

    subprocess.check_call([
        'gcab',
        '--create',
        '--nopath',
        opts.output / opts.firmware.with_suffix('.cab').name,
        firmware_arch_path,
        firmware_metainfo_path,
    ])


def get_parser() -> argparse.ArgumentParser:
  parser = argparse.ArgumentParser(
      argument_default=argparse.SUPPRESS,
      description=__doc__,
      formatter_class=argparse.ArgumentDefaultsHelpFormatter)
  parser.add_argument('firmware', type=Path,
                      metavar='/path/to/firmware_V0.0.bin',
                      help='Firmware blob.')
  parser.add_argument('--output', type=Path,
                      metavar='/output/path/', default=Path.cwd(),
                      help='Output directory.')
  return parser


def main(argv):
  opts = get_parser().parse_args(argv)
  write_cab(opts)


if __name__ == '__main__':
  sys.exit(main(sys.argv[1:]))
