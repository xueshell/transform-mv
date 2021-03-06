#!/bin/sh
#
# copyright 2003-2005 Gene Pavlovsky <gene.pavlovsky@gmail.com>
#
# this is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# tmv-ul: lower-case and underscore all files in path(s).

while test $# -gt 0 -a "${1:0:1}" = '-' -a "$1" != '--'; do
  test -z "$options" && options="$1" || options="$options $1"
  shift
done
test "$1" = '--' && shift

if test $# -lt 1; then
  echo "Usage: $(basename $0 .sh) [tmv options] path [path]*" >&2
  echo
  echo "Rename all files in path(s) to lower-case, changing spaces to underscores." >&2
  exit 1
fi

find "$@" -depth | tmv -l -e 'y/ /_/' -e 's/_\{2,\}/_/g' -e 's/_-_/-/g' $options
