
This page documents the RTU configuration file, not how to setup an RTU. For an RTU setup guide, see [readme](../setup_guides/readme.md).

# RTU Configuration

Every RTU requires a configuration file to tell the various systems what hardware is connected, and how to connect to it. You should be mindful of things like controller addresses and device addresses when designing an RTU.

# Config Files

All configuration files go in `/etc/NavasotaBrewing/`.

Note: for most Linux systems, this location requires root access to write to.

| File Name | Description | Spec |
| --------- | ----------- | ------- |
| `rtu_conf.yaml` | The main configuration file for RTUs. This is used when running various package like the CLI and Iris. | [Full Config File](rtu_conf.yaml)
