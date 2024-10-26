#!/bin/sh
#
#  Check if the number DAY is 14, 16, or 26
if [ "$1" -ne 14 ] && [ "$1" -ne 16 ] && [ "$1" -ne 26 ]; then
  echo "This is a DEMO version invalid day. Allowed days are 14, 16, or 26. Buy the full course."
  exit 1
fi

echo [+] Starting lab for lesson $1...
DAY=$1 docker-compose --profile "day$1" up
