# STR1XX Relay Boards
<img src="../images/str1160000h.jpg" width="400px"></img>

# Links
* [smarthardware.eu](https://www.smarthardware.eu/index.php) - manufacturer. Their site doesn't support direct links. Look for `STR1160000H` under `RS-485 Controllers`.
* [hardware spec (pdf)](str1_hardware_spec.pdf)
* [software spec (pdf)](str1_software_spec.pdf)

# About
The `STR1XX` relay board comes in a few variants. We use the `STR116` and `STR108` boards. They are identical, except that the `STR116` has 16 relays while the other has 8. The software works exactly the same for each.

<img src="../images/test_bed.jpg" width="600px"></img>

Here's our test bed with the `STR108`.

Operation is pretty simple if you follow the hardware specification. You really only need power and RS-485 A (yellow) and B (blue). Powering the board should illuminate a red light, with a flashing blue one.

## Configuring
All Modbus devices have a (hopefully) unique **controller address** that identifies them. You'll need to set this controller number to some 0-255 number. According to the software manual linked above, the default controller address is `0xFE`, or 254 base 10. 

We provide a driver in [`brewdrivers`](https://github.com/NavasotaBrewing/brewdrivers) that can do almost anything you need, including setting the controller number.

The `set_cn` command from [the CLI](https://github.com/NavasotaBrewing/cli) will let you set the controller number. Just don't forget it.

## Factory Defaults
Jumper 2 (Jp2) on the board will restore the board to factory defaults. This is useful if you forget the controller number/baudrate and can't communiate with the board.

The hardware manual, page 8, shows how to do this. Here it is, briefly:
```
Jp2 is used to load all default parameters.
--------------------------------------------
Disconnect power.
Put jumper.
Connect power.
The blue LED will light constantly.
Now controller waits to remove jumper.
Remove jumper.
The controller will continue in normal mode.
The blue LED will flash briefly.
```