# Navasota Brewing Company

The [Navasota Brewing Company](https://navasotabrewing.com) is a brewery based in Navasota, Texas. It was started by David Sweeney, a long time homebrewer.

This is the entry point for all the documentation belonging to the Navasota Brewing Company (NBC). All software is maintained under the `NavasotaBrewing` github account.

---- 

# About the Brewery Control System

As we scale up NBC, we need greater control and automation over the brewing hardware. The software packages here, the "brewery control system" or "BCS", are our best effort to do just that.

The workhorses of the BCS are RTUs, or "remote terminal units"[^1] These RTUs are boxes we build that are physically connected to field devices like pumps, thermometers, ball valves, heaters, etc. RTUs can have lots of devices connected to them to form a device cluster. Each RTU talks on the network to a "master station", which is a user interface used to control the field devices.

RTUs are designed to be modular: adding and removing devies is fairly easy. This allows us to change the brewing setup and expand with minimal effort.

## Architecture

See the [architecture page](architecture.md) for information about the physical and software layers of this project, and how everything communicates.

## Versioning and Releases

There are several software packages under the `NavasotaBrewing` account that make up the BCS. Each package contains its own specific documentation.

Each package in the BCS ecosystem has it's own version number, and version numbers don't line up. Certain versions of each package are meant to be used together.

The [Github releases](https://github.com/NavasotaBrewing/documentation/releases/) within this repository will have "BCS releases", which are soft releases specifying which versions of each of the packages are meant be to used together, as well as instructions on setting everything up.

See the [releases page](https://github.com/NavasotaBrewing/documentation/releases/) for the latest release.

## Hardware

See the [hardware](hardware/readme.md) pages for information about the hardware we use. It contains things like reference manuals and helpful information about the hardware that we've learned over the years.


# About this repository

This repository contains documentation for everything that doesn't fit neatly inside one of those repos. This includes, but is not limited to:

 * [Configuration Instructions](RTU_Configuration/configuration.md)
 * [Build scripts](build_scripts/readme.md)
 * [Release instructions](https://github.com/NavasotaBrewing/documentation/releases/)
 * [Software architecture overview](architecture.md)
 * [Hardware specifications](hardware/readme.md)
 * Setup guides (coming soon...)
 * Brewing recipes (coming soon...)
 * and more...

[^1]:  the name "remote terminal units" appears in other industries and contexts. For us, they're really just distributed computing centers, almost like a really smart PLC.