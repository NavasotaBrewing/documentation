# Navasota Brewing Company

This is the entry point for all the software documentation belonging to the Navasota Brewing Company (NBC). All software is maintained under the `NavasotaBrewing` github account.

## What is NBC?
The Navasota Brewing Company is a brewery based in Navasota, Texas. It was started by David Sweeney, a long time homebrewer.

## About the software
As we scale up NBC, we need greater control and automation over the brewing hardware. The software packages here are our best effort to do just that.

# Packages

## `brewdrivers`
[`brewdrivers`](https://github.com:NavasotaBrewing/brewdrivers) is a Rust crate that contains low level drivers for brewing hardware. It also contains:
 * a CLI to manually operate devices for debugging/emergency purposes.
 * an HTTP API for communication with a web front end

## `brewkit`
[`brewkit`](https://github.com:NavasotaBrewing/brewkit) is a web front build on VueJS. It is the primary way that brewers interact with hardware. It communicates with the HTTP API provided by `brewdrivers`.

## About this repository
Documentation for each specific package listed above will be contained within those repositories. This repository contains documentation for everything that doesn't fit neatly inside one of those repos. This includes, but is not limited to:

 * Software architecture overview
 * Hardware specifications
 * Setup guides
 * Brewing recipes
 * and more...

