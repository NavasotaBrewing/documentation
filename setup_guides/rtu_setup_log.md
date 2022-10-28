# RTU Setup Log
This is a log of all my activities to set up an RTU. It is 27 October, 2022. I've just written the first build script and I'm testing it out.

# Raspberry Pi OS
I'm using the official raspberry pi os installer from the [homepage here](https://www.raspberrypi.com/software/).

It seems to be frozen.

Maybe it just takes a long time?

Ok now I'm just going to use BalenaEtcher.

BalenaEtcher doesn't work either :/

I ended up switching to windows and using the Raspberry Pi OS installer. That was a good idea. It lets you set the hostname, username, password, set up networks, etc from the installer before it writes to the SD card. That saves some time. I was able to burn the RPiOs to the SD card and start it up.

I needed to connect physically to the RPi because i didn't configure the network properly from the installer. I set up the network and tried to run the build script.

# Build script
I couldn't pipe it directly to sh, i got syntax errors. Instead I had to curl > file and add execution to the file like so:

```
$ curl https://raw.githubusercontent.com/NavasotaBrewing/documentation/master/build_scripts/[BUILD_SCRIPT_NAME].sh > build_rtu.sh
$ sudo chmod +x build_rtu.sh
$ ./build_rtu.sh
```

This ran alright for the most part, but a little slow because of the low voltage. Ran into some issues in the build script that I'll fix. It failed to find cargo after it was installed because i didn't source it properly.

I manually restarted the shell and installed NBC_cli and nbc_iris through cargo. The CLI took 27 minutes to install, iris is still working. I just have a bad power cable.

I think I've identified the errors in the build script. 