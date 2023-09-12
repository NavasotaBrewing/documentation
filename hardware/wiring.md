# Wiring
This document contains information about the electrical components of the RTU boxes and how they should be connected.

## RS-486
We will be using [this USB to RS485 adapter](https://www.amazon.com/Serial-Converter-Adapter-Supports-Windows/dp/B076WVFXN8/ref=pd_bxgy_sccl_1/138-2802103-9574950?pd_rd_w=4t4VL&content-id=amzn1.sym.7757a8b5-874e-4a67-9d85-54ed32f01737&pf_rd_p=7757a8b5-874e-4a67-9d85-54ed32f01737&pf_rd_r=16ZZK5EX9H924KVWS1EH&pd_rd_wg=bUr9u&pd_rd_r=c6bc7c05-fe92-4fd5-8471-e726ee0e9b8b&pd_rd_i=B076WVFXN8&th=1). It saves us the trouble of getting an RPi hat and disabling the `/dev/ttyAMA0` bluetooth port and switching it to the serial port. This can be plugged in to a brand new Raspberry Pi OS installation and it works out of the box. By default, the port will be `/dev/ttyUSB0` but that may change if there are other USB devices connected.

The clamp-down porting of this cable should be mounted in the box somewhere, with the RS485 `A` and `B` cables connected to it. Then, the male side can be plugged and screwed in, then plugged into the Raspberry Pi. Ideally, 2 of these cables will be present in the box, one for the Pi and the other for external access. The female side of the second cable could be mounted in the exterior side of the box, allowing us to directly connect to the RS-485 bus.
