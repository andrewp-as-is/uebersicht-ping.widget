#!/usr/bin/env bash
{ set +x; } 2>/dev/null

UEBERSICHT_PING_HOST="${UEBERSICHT_PING_HOST-google.com}"

YELLOW=40
RED=50

COLOR="green"

ms="$(/sbin/ping "$UEBERSICHT_PING_HOST" -c 1 -t 1 | tail +2 | head -1 | awk '{print $7}' | awk -F'=' '{print $2}')"
[[ ${ms%.*} -gt $YELLOW ]] && COLOR='yellow'
[[ ${ms%.*} -gt $RED ]] && COLOR='red'
echo "<span style='color:$COLOR'>$ms ms</span>"
