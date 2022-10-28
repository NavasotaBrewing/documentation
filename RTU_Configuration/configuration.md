# RTU Configuration

For BCS Version 2

Every RTU requires at least one configuration file to tell the various systems what hardware is connected, and where it's connected. You should be mindful of things like controller addresses and device addresses when designing an RTU.

See the [build scripts](../build_scripts/readme.md) for more instructions on setting up the software for an RTU.

# Location
All configuration files go in `/etc/NavasotaBrewing/`. The config file should be named `/etc/NavasotaBrewing/rtu_conf.yaml`.
Some packages let you specify a custom config file, but this should only be used for debugging. I strongly recommend using that file name.

Note: for most Linux systems, this location requires root access to write to.

# YAML
All config files use YAML, which is easy to read and write for humans. [See more about it here](https://www.redhat.com/en/topics/automation/what-is-yaml).


# Config Files
The following list shows all the config files that the system uses. The BCS will look in `/etc/NavasotaBrewing` for them.

| File Name | Description | Spec |
| --------- | ----------- | ------- |
| `rtu_conf.yaml` | The main configuration file for RTUs. This is used when running various package like the CLI and Iris. | [Full Config File](rtu_conf.yaml)
