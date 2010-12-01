require = recipes/images/base-image.bb

#DEPENDS += " \
#  libqtdeclarative4 \
#  "

inherit image

XSERVER = "xserver-kdrive-fbdev"
#PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive-fbdev"
PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive"



DEPENDS += " \
  ${XSERVER} \
  bkl-phone-app \
  "

IMAGE_INSTALL += " \
  ${XSERVER} \
  libqtdeclarative4 \
  "

bla () {
  curdir=$PWD
  cd ${IMAGE_ROOTFS}
  echo 'auto usb0' > ./etc/network/interfaces
  echo 'iface usb0 inet static' >> ./etc/network/interfaces
  echo '    address 192.168.0.202' >> ./etc/network/interfaces
  echo '    netmask 255.255.255.0' >> ./etc/network/interfaces
  echo '    network 192.168.0.0' >> ./etc/network/interfaces
  echo '    gateway 192.168.0.200' >> ./etc/network/interfaces
  echo '#!/bin/sh' > ./root/runQt.sh
  echo 'export DISPLAY=:0' >> ./root/runQt.sh
  echo 'Xfbdev -screen 640x480x32 -mouse mouse &' >> ./root/runQt.sh
  echo 'sleep 3' >> ./root/runQt.sh
  echo 'McmMosLinuxPhone' >> ./root/runQt.sh
  cd $curdir
}

#register above command for execution
ROOTFS_POSTPROCESS_COMMAND += "﻿bla"

export IMAGE_BASENAME = "bkl-image"

