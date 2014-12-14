#!/bin/sh

#sudo apt-get -y install u-boot-tools

FW_IMAGE=mlwG2_v2.0.0.6

[ ! -e ${FW_IMAGE}.zip ] && curl -O http://media.kingston.com/support/downloads/${FW_IMAGE}.zip
[ ! -e ${FW_IMAGE}.bin ] && unzip ${FW_IMAGE}.zip

head -c+52 <${FW_IMAGE}.bin >fw_header.bin
od -A x -t x1z -v fw_header.bin

tail -c+53 <${FW_IMAGE}.bin >uImage
#file uImage
mkimage -l uImage

#echo "INFO: Contents of file: uImage"
#od -A x -t x1z -v uImage | head

tail -c+65 <uImage >out.dat.xz

#echo "INFO: Contents of file: out.dat.xz"
#od -A x -t x1z -v out.dat.xz | head

xz --test out.dat.xz
xz --decompress --force --keep out.dat.xz

#echo "INFO: Contents of file: out.dat"
#od -A x -t x1z -v out.dat | less

if [ ! -x extract-vmlinux ]; then
    curl -O https://raw.githubusercontent.com/torvalds/linux/master/scripts/extract-vmlinux
    chmod a+x extract-vmlinux
fi
#./extract-vmlinux out.dat.xz
#tail -c+731464 out.dat.xz | bunzip2 >out

strings -n 11 out.dat
grep -abo "Linux" out.dat

# EOF
