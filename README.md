# VenomWSL

Venom Linux on WSL2 (Windows 10 FCU or later)
based on [wsldl](https://github.com/yuk7/wsldl).

[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)
![License](https://img.shields.io/github/license/Vinfall/VenomWSL.svg?style=flat-square)

## Requirements

* Windows 10 1803 April 2018 Update x64 or later.
* Windows Subsystem for Linux feature is enabled.
* Latest WSL recommended.

## Install

1. Download installer zip from [release](https://github.com/Vinfall/VenomWSL/releases/latest) or [monthly action build](https://github.com/Vinfall/VenomWSL/releases/tag/action-build) (recommended)
2. Extract all files in zip file to same directory (e.g. `C:\WSL\Venom`)
3. Run `Venom.exe` to Extract rootfs and Register to WSL

Exe filename is using to the instance name to register.
If you rename it, you can register with a different name and have multiple installs.

## Init

Developing...

## How-to-Use (for Installed Instance)

### Usage

```powershell
Usage :
    <no args>
      - Open a new shell with your default settings.
    run <command line>
      - Run the given command line in that distro. Inherit current directory.
    config [setting [value]]
      - `--default-user <user>`: Set the default user for this distro to <user>
      - `--default-uid <uid>`: Set the default user uid for this distro to <uid>
      - `--append-path <on|off>`: Switch of Append Windows PATH to $PATH
      - `--mount-drive <on|off>`: Switch of Mount drives
    get [setting]
      - `--default-uid`: Get the default user uid in this distro
      - `--append-path`: Get on/off status of Append Windows PATH to $PATH
      - `--mount-drive`: Get on/off status of Mount drives
      - `--lxuid`: Get LxUID key for this distro
    backup
      - Output backup.tar.gz to the current directory using tar command.
      
    clean
      - Uninstall the distro.
    help
      - Print this usage message.
```

### Uninstall

```powershell
.\Denom.exe clean
```

## How-to-Build

VenomWSL can be built on GNU/Linux or WSL.

`curl`, `bsdtar`, `jq` and `unzip` is required for build.

```bash
# Install build tools
sudo apt install -y curl libarchive-tools jq unzip
# Make release
# Use of `sudo` recommended to avoid weird file permission in rootfs
sudo make
# Clean-up using `sudo` as some files are owned by root
sudo make clean
```

## [License](LICENSE)

MIT
