# Build Scripts

# Build an RTU
The [`build_rtu.sh`](build_rtu.sh) script aims to convert a stock Raspberry PI OS installation into a working RTU. It *should* do all of this for you, with a little user input. However, there are many
ways this can go wrong and you should keep an eye on things.

This is the primary way you should set up an RTU. Ideally, this is run on all RTUs and they all have an identical (or similar) environment.

## Launch Checklist
There's a few things that can't be automated. You'll need to

* Install Raspberry Pi OS on an SD card
    * I recommend using the official [RPi imager tool](https://www.raspberrypi.com/software/). With that, you can set things like the hostname, username, and password before you ever boot up the Pi. Makes things a lot easier. You can also set the network settings to connect it to a network. If all goes well, you can image the SD card, power on the Pi, and connect through SSH without ever connecting a monitor or keyboard.
* Connect the Pi to the RS-485 bus in the RTU box.
    * See the [hardware guides](../hardware/readme.md) for more info on that.
* Boot up the Pi for the first time
    * If you set up the network properly using the above method, you can connect through SSH or PuTTY.
    * Otherwise, you'll need to get a keyboard and monitor to run the build script

## Taking Off
Clone the build script with `cURL`, set permissions, and run it

```
$ curl https://raw.githubusercontent.com/NavasotaBrewing/documentation/master/build_scripts/build_rtu.sh > build_rtu.sh
$ sudo chmod +x build_rtu.sh
$ ./build_rtu.sh
```

## Flight Objectives
The script will attempt to perform the following tasks:

* Install dependencies
* Install `cargo`
* Set Rust to `nightly`
* Create configuration files
    * Create `/etc/NavasotaBrewing`
    * Create `/etc/NavasotaBrewing/rtu_conf.yaml` and populate with [default config file](../RTU_Configuration/rtu_conf.yaml)
* Install all BCS software
    * `cargo install NBC_cli`
    * `cargo install nbc_iris`
* Set startup programs
    * `nbc_iris`

This should all happen automatically. If there are any errors, please report them to Luke so he can fix them.

## Landing
If the script runs successfully, you should be able to reboot the Pi and see the `iris` server running.
It should be able to recieve requests from the front end. From now on, the `iris` server should start whenever the Pi boots.
