# Magisk Frequent FStrimmer (MFF)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0) [![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-v2.0%20adopted-ff69b4.svg)](CODE_OF_CONDUCT.md)

If you're on GitHub and want to create a Pull/Merge Request, head to this project's [GitLab repo.](https://gitlab.com/Atrate/magisk-frequent-fstrimmer/)

## Description

A Magisk module designed to help you care for your flash memory using [fstrim](https://linux.die.net/man/8/fstrim).
It does so by executing fstrim every reboot on `/data` , `/cache` , `/` and `/system`.

This module is mostly designed for older devices, since Android Pie and later versions execute fstrim automatically.

## Installation
1. Download the module from the releases
2. Flash the module through Magisk Manager or TWRP/OrangeFox

### Grab the newest release on [GitLab](https://gitlab.com/Atrate/magisk-frequent-fstrimmer/releases) or [GitHub](https://github.com/Atrate/magisk-fstrimmer/releases)

## Credits
topjohnwu for magisk

## License
This project is licensed under the [GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.html).
