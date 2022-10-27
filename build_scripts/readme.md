# Build Scripts
This directory contains build scripts for setting up RTUs and similar.

If you have `curl` installed, run this command and replace `[BUILD_SCRIPT_NAME]` with the script you want.

Note: piping to shell is normally bad practice, but I wrote these scripts and it will likely be me running them. I sometimes trust my former self.

```
curl https://raw.githubusercontent.com/NavasotaBrewing/documentation/master/build_scripts/[BUILD_SCRIPT_NAME].sh | sh
```

## Index

| Script | Description |
| ------ | ----------- | 
| [`build_rtu.sh`](build_rtu.sh) | This is meant to take a stock Raspberry Pi OS build to a functioning RTU automatically. |