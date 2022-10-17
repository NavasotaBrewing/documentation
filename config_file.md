# RTU Configuration File

Note: this is current for `CLI 4.0.0` and `brewdrivers 0.12.0`

Every RTU requires a configuration file to tell the various systems what hardware is connected, and where it's connected. You should be mindful of
things like controller addresses and device addresses when designing an RTU. 

# Location
All configuration files go in `/etc/NavasotaBrewing/`. The config file should be named `/etc/NavasotaBrewing/rtu_conf.yaml`.
Some packages let you specify a custom conf file, but this should only be used for debugging. I strongly recommend using that file name.

Note: for most Linux systems, this location requires root access to write to.

# YAML
The config file uses YAML, which is easy to read and write for humans. [See more about it here](https://www.redhat.com/en/topics/automation/what-is-yaml).

# Content

The top level of the configuration file should contain the following keys

```yaml
name: RTU Name                  # The RTU name, for display purposes
id: testing-rtu                 # The RTU id. Cannot contain whitespace. Must be unique among other RTUs
ip_addr: 192.168.0.4            # Local IP address of the RTU, ie. where the web interface can reach this RTU
devices: []                     # A list of connected devices
```

## Devices

The configuration should contain all the devices you want to use. There could be multiple devices per controller (ex. 1 device for each relay, 8 devices on a relay board, or 1 device for 1 CN7500 controller).

Note: if you want to have no devices, leave the list empty as above, don't omit the key

```yaml
devices:
- id: omega1              # Device ID, cannot contain whitespace, must be unique among all devices (including on other RTUs)
  name: Themometer 1      # Device name, for display purposes
  port: /dev/ttyUSB0      # Serial port to use for this device
  addr: 0                 # Device address (ex. relay number. not used for CN7500, leave it as 0)
  controller: CN7500      # What type of controller to use (Must exactly match one of the Controllers provided by the iris package)
  controller_addr: 22     # Controller address (decimal, not hex)
  state: Off              # Value field, just provide a default
  pv: 0.0                 # Value field, just provide a default
  sv: 0.0                 # Value field, just provide a default
```

## Full Config File

Here's a full config file that I used for testing, just as reference.

**Note**: starting the CLI will attempt to load the config file, and will tell you if it's valid or not.

```yaml
name: Testing RTU
id: testing-rtu
ip_addr: 0.0.0.0
devices:
- id: omega1
  name: Themometer 1
  port: /dev/ttyUSB0
  addr: 0
  controller: CN7500
  controller_addr: 22
  state: Off
  pv: 75.8
  sv: 132.0
- id: pump
  name: Main Pump
  port: /dev/ttyUSB0
  addr: 0
  controller: STR1
  controller_addr: 254
  state: Off
- id: sparge
  name: Sparge Valve
  port: /dev/ttyUSB0
  addr: 1
  controller: STR1
  controller_addr: 254
  state: Off
- id: mash
  name: Mash Valve
  port: /dev/ttyUSB0
  addr: 2
  controller: STR1
  controller_addr: 254
  state: Off
- id: waveshare
  name: Waveshare Relay
  port: /dev/ttyUSB0
  addr: 0
  controller: Waveshare
  controller_addr: 2
  state: Off
```