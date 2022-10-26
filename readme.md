# Navasota Brewing Company

The [Navasota Brewing Company](https://navasotabrewing.com) is a brewery based in Navasota, Texas. It was started by David Sweeney, a long time homebrewer.

This is the entry point for all the documentation belonging to the Navasota Brewing Company (NBC). All software is maintained under the `NavasotaBrewing` github account.

# About the Brewery Control System
As we scale up NBC, we need greater control and automation over the brewing hardware. The software packages here, the "brewery control system" or "BCS", are our best effort to do just that.
The BCS is a distributed system of RTUs, or "remote terminal units", that control device clusters. Examples of these devices are valves, pumps, thermometers, heaters, etc. Every RTU maintains 1 device cluster,
and there can be many devices in a cluster. RTUs are designed to be modular; you can add or remove devices as necessary depending on the physical setup or needs of the brew.

There are several software packages under the `NavasotaBrewing` account that make up the BCS. Each package contains its own specific documentation.

## Architecture
See the [architecture page](architecture.md) for information about the physical and software layers of this project, and how everything communicates.

## Versioning and Releases
Each package in the BCS ecosystem has it's own version number, and version numbers don't line up. Certain versions of each package are meant to be used together.

The [Github releases](https://github.com/NavasotaBrewing/documentation/releases/) within this repository will have "BCS releases", which are soft releases specifying which versions of each of the packages are meant be to used together, as well as instructions on setting everything up.

See the [releases page](https://github.com/NavasotaBrewing/documentation/releases/) for the latest release.

## Hardware
See the [hardware](hardware/readme.md) pages for information about the hardware we use. It contains things like reference manuals and helpful information about the hardware that we've learned over the years.


# About this repository
This repository contains documentation for everything that doesn't fit neatly inside one of those repos. This includes, but is not limited to:

 * [Configuration Instructions](RTU_Configuration/configuration.md)
 * [Release instructions](https://github.com/NavasotaBrewing/documentation/releases/)
 * [Software architecture overview](architecture.md)
 * [Hardware specifications](hardware/readme.md)
 * Setup guides (coming soon...)
 * Brewing recipes (coming soon...)
 * and more...

