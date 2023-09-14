RTUs require some software to be installed on them. This guide documents the `build_rtu.sh` shell script that will handle most things for you.

Note that this script is new and not tested very well. Please document errors. This guide should explain what it's doing so that if it fails, you can do whatever it can't.

# Build an RTU

The [`build_rtu.sh`](../RTU%20Configuration/build_rtu.sh) script aims to convert a stock Raspberry PI OS installation into a working RTU. It *should* do all of this for you, with a little user input. However, there are many ways this can go wrong and you should keep an eye on things.

This is the primary way you should set up an RTU. Ideally, this is run on all RTUs and they all have an identical (or similar) environment.

## Launch Checklist

There's a few things that can't be automated. You'll need to

* Install Raspberry Pi OS on an SD card
    * I recommend using the official [RPi imager tool](https://www.raspberrypi.com/software/). With that, you can set things like the hostname, username, and password before you ever boot up the Pi. It makes things a lot easier. You can also set the network settings to connect it to a network. If all goes well, you can image the SD card, power on the Pi, and connect through SSH without ever connecting a monitor or keyboard.
    * I found this works much better on Windows than Linux or Mac
* Connect the Pi to the RS-485 bus in the RTU box.
    * See the [hardware guides](../../Hardware/README.md) for more info on that.
* Boot up the Pi for the first time
    * If you set up the network properly using the above method, you can connect through SSH or PuTTY.
    * Otherwise, you'll need to get a keyboard and monitor to run the build script.

## Taking Off

1. Clone the build script with `cURL`

```
curl -sSL https://raw.githubusercontent.com/NavasotaBrewing/documentation/master/Software/RTU%20Configuration/build_rtu.sh > build_rtu.sh
```

2. set permissions,

```
sudo chmod +x build_rtu.sh
```

3. and run it. 

```
./build_rtu.sh
```

## Flight Objectives
The script will attempt to perform the following tasks:

1. Install dependencies
2. Install `cargo`
3. Set Rust to `nightly`
4. Create configuration files
    * Create `/etc/NavasotaBrewing`
    * Create `/etc/NavasotaBrewing/rtu_conf.yaml` and populate with [default config file](../RTU%20Configuration/rtu_conf.yaml)
    * Open the config file in an editor (`nano`) for you to manually write. You can edit this later.
5. Install all BCS software
    * `cargo install NBC_cli`
    * `cargo install nbc_iris`
6. Set startup programs
    * This will open `/etc/rc.local` in `nano` so you can write any startup scripts you want

This should all happen automatically. If there are any errors, please report them to Luke so he can fix them.

## Landing

If the script runs successfully, you should be able to reboot the Pi and see the `iris` server running with `ps aux | grep iris`. It should be able to recieve requests from the front end. From now on, the `iris` server should start whenever the Pi boots.