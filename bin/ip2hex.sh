#!/bin/sh

# convert IP addres to HEX value
# For example : 10.0.0 - 0a0000
# This will generate a link at $TFTPFOLDER/0a0000 
# to default to load ERPXE faster for your IP/Subnet
# as Syslinux searching for this file before calling default.
# c0a800 (192.168.0.*) / 0a0000 (10.0.0.*) supplied by ERPXE as default
# links supplied by default for 192.168.*.* / 192.*.*.* and 10.0.*.* / 10.*.*.* also.

# Settings
TFTPFOLDER = /tftpboot/pxelinux.cfg/ # TFTP Folder

echo "Please input SUBNET or IP, for example 10.0.0"
read IP_ADDR
filename=$(printf '%02X' ${IP_ADDR//./ })
cd $TFTPFOLDER
lowerfilename=${filename,,}
# TODO: CHECK IF FILE EXIST
ln -s /tftpboot/pxelinux.cfg/default /tftpboot/pxelinux.cfg/$lowerfilename