require recipes/images/base-image.bb

#DEPENDS += " \
#  libqtdeclarative4 \
#  "

bkl_image_postpro() {
  curdir=$PWD
  cd ${IMAGE_ROOTFS}
  echo "auto usb0" > ./etc/network/interfaces
  echo "iface usb0 inet static" >> ./etc/network/interfaces
  echo "    address 192.168.0.202" >> ./etc/network/interfaces
  echo "    netmask 255.255.255.0" >> ./etc/network/interfaces
  echo "    network 192.168.0.0" >> ./etc/network/interfaces
  echo "    gateway 192.168.0.200" >> ./etc/network/interfaces
  echo '#!/bin/sh' > ./usr/bin/runQt.sh
  echo 'export DISPLAY=:0' >> ./usr/bin/runQt.sh
  echo 'Xfbdev -screen 640x480x32 -mouse mouse &' >> ./usr/bin/runQt.sh
  echo 'sleep 3' >> ./usr/bin/runQt.sh
  echo 'McmMosLinuxPhone' >> ./usr/bin/runQt.sh
  chmod ugo+x ./usr/bin/runQt.sh
  cd $curdir
}

#register above command for execution
ROOTFS_POSTPROCESS_COMMAND += "bkl_image_postpro"


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
  task-fonts-truetype-core \
  qt4-embedded-fonts \
  bkl-phone-app \
  "



export IMAGE_BASENAME = "bkl-image"

