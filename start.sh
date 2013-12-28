#!/bin/bash

## To start the BTS, run:

./osmo-bts/src/osmo-bts-trx/osmobts-trx \
  -c etc/bts.cfg -T -d DRSL:DOML:DLAPDM:DRLL:DRR:DMEAS:DPAG:DDSP:DABIS:DRTP:DPCU:DLOOP:DHO \
  >bts.log 2>&1 &

# The complete list of possible debugs is:
#  DRSL:DOML:DLAPDM:DRLL:DRR:DMEAS:DPAG:DL1C:DL1P:DDSP:DABIS:DRTP:DPCU:DTRX:DLOOP:DHO
# (it's defined in osmo-bts-dirty/src/common/logging.c)
# Note: DL1C is useful to add to debug radio-side issues. DTRX and DL1P are too verbose.

# The BTS will automatically try to connect to the transceiver.

## To start the transceiver, run _as root_:

export LD_LIBRARY_PATH="`pwd`/uhd/lib"
nice -19 ./osmo-trx/Transceiver52M/transceiver &

# Note: running the transceiver as `root` is necessary, it will allow
# the transceiver to run at higher priority and therefor give you better
# performance on the radio side.

# The transceiver will log to syslog, never to the console.
# Change the debug levels with:
#   sqlite3 /etc/OpenBTS/OpenBTS.db "update config set valuestring = 'DEBUG' where keystring = 'Log.Level';"
#   sqlite3 /etc/OpenBTS/OpenBTS.db "update config set valuestring = 'INFO' where keystring = 'Log.Level';"

# Finally, some notes on transceiver performance:
# - make sure the GPS antenna is connecetd and has a clear view of the sky, it does help with clock on the board; it takes some time (maybe 20 minutes) to work though.
# - not sure whether this helps, but sometimes I run the uhd calibration scripts (`uhd_cal_tx_iq_balance`, `uhd_cal_rx_iq_balance`) when my radio side won't work, then re-start the transceiver.
