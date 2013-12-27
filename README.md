This repository will help you build a Base Terrestrial Station with UmTRX.

First things first, edit `etc/bts.cfg` and adjust the parameters at the top of the file. They have comments to help you.

Then read through `how.txt` to build the three components you'll need:
* the UHD library and tools
* the UmTRX Transceiver (which interfaces with the UmTRX hardware and the BTS code)
* the BTS code, which is used to talk to the rest of the network.

Finally, use the `start.sh` script to see how to start the components.

On the same machine or a separate machine, you should run a BSC, see the [companion project](https://github.com/shimaore/umtrx-osmo-bsc) on how to do that.
