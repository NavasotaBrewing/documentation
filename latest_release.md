# Latest Release

> `BCS 0.1.0-pilot`

 * [`brewdrivers v0.4.2`](https://github.com/NavasotaBrewing/brewdrivers/releases/tag/0.4.2)
 * [`brewkit v0.1.0-pilot`](https://github.com/NavasotaBrewing/brewkit/releases/tag/v0.1.0-pilot)


--------------


As a warning, installing dependencies and compiling will take a while, especially on a slow connection. You should set aside some time for this.

## 1. Configuring `brewkit`
Brewkit should be configured on any workstation on the network. Referring to the architecture scheme on the [architecture page](architecture.md), this would be the AWS EC2 bit, but we're not there yet.

The following setup information is a snapshot of `brewkit v0.1.0-pilot`'s readme:

This is meant to be run on Linux. It *probably* works on Windows and MacOS, but i'm not sure. You'll need:
  * [`npm`](https://www.npmjs.com/)
  * `sqlite3`

```
# Clone this wherever you want it
$ git clone https://github.com/NavasotaBrewing/brewkit.git

# Install deps for db
$ cd brewkit/db
$ npm install
# Run this and leave it running
$ npm run dev

# In another shell...
# Install deps for main package
$ cd brewkit
$ npm install
$ npm run serve
```

You should have one shell running `db`, and another running `brewkit`. Visit `localhost:8080`.

This package will communicate with a master server, which is `brewdrivers` job.

## 2. Configuring `brewdrivers`

There should be compiled binaries for each platform contained in the release on github. Find the appropriate one [on the release page](https://github.com/NavasotaBrewing/brewdrivers/releases/tag/0.4.2).

Copy the link address and use `curl` or `wget` to grab it from the Pi and the master station (probably the same machine that you have `brewkit` running on)

```
$ curl https://github.com/NavasotaBrewing/brewdrivers/releases/download/0.4.2/brewdrivers-rpi > brewdrivers
```


On the RTUs:
```
$ brewdrivers rtu
```

On the Master Station
```
$ brewdrivers master
```

Take note of the IP addresses on the RTUs, and the port that the APIs are running on. you'll need them later.

## Finishing up
You should have
1. `brewkit` running on a workstation
2. `brewdrivers master` running on probably the same workstation
3. `brewdrivers rtu` running on each RTU you have, probably only one.