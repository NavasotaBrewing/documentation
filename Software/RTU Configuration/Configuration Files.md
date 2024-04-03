# RTU Configuration

Every RTU requires a configuration file to tell the various systems what hardware is connected, and how to connect to it. You should be mindful of things like controller addresses and device addresses when designing an RTU.

See the list below for the various configuration files used in the brewery system. Check out the linked example for explanation of the details.

# Config Files

All configuration files go in `/etc/NavasotaBrewing/`.

Note: for most Linux systems, this location requires root access to write to.

| File Name | Required |  Description | Spec |
| --------- | -------- |  ----------- | ------- |
| `rtu_conf.yaml` | Required | The main configuration file for RTUs. This is used when running various package like the CLI and Iris. | [Full Config File](rtu_conf.yaml)
| `conditions.yaml` | Not Required | A list of conditions. Conditions are used in rules to determine when a rule triggers. | [Full conditions example](conditions.yaml)
