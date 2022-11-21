#!/bin/sh

sudo apt install tlp tlp-rdw
sudo tlp start
sudo tlp-stat -s

# thinkpad original module
# Sandy Bridge 以降の新しいモデル (X220/T420, X230/T430 など) で必要です。
sudo apt install acpi-call-dkms
