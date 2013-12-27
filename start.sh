#!/bin/bash

UMTRX_BASE="`pwd`"
export LD_LIBRARY_PATH="$UMTRX_BASE/uhd/lib"

## To start the BTS, run:
./osmo-bts-dirty/src/osmo-bts-trx/osmobts-trx \
  -c dev/bts.cfg -T -d DRSL:DOML:DLAPDM:DRLL:DRR:DMEAS:DPAG:DDSP:DABIS:DRTP:DPCU:DLOOP:DHO &

# The complete list of possible debugs is:
#  DRSL:DOML:DLAPDM:DRLL:DRR:DMEAS:DPAG:DL1C:DL1P:DDSP:DABIS:DRTP:DPCU:DTRX:DLOOP:DHO
# (it's defined in osmo-bts-dirty/src/common/logging.c)
# Note: DL1C is useful to add to debug radio-side issues.

## To start the transceiver, run:
./osmo-trx/Transceiver52M/transceiver &

# The BTS will then automatically start to connect to the transceiver.

# The transceiver will log to syslog, never to the console.
# Change the debug levels with:
#   sqlite3 /etc/OpenBTS/OpenBTS.db "update config set valuestring = 'DEBUG' where keystring = 'Log.Level';"
#   sqlite3 /etc/OpenBTS/OpenBTS.db "update config set valuestring = 'INFO' where keystring = 'Log.Level';"
