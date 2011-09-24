#!/bin/bash

# LXC tools
# Copyright (C) 2011 Infertux <infertux@infertux.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

# Check for updates on Debian-based containers.

LXC=/var/lib/lxc
ROOTFS=rootfs
RUNNING_CONTAINERS="$(find /cgroup -mindepth 1 -maxdepth 1 -type d | cut -d/ -f3-)"

for container in $RUNNING_CONTAINERS; do
  echo "Checking $container..."
  chroot $LXC/$container/$ROOTFS apt-get update -qq
  chroot $LXC/$container/$ROOTFS apt-get dist-upgrade -s
  echo
done

