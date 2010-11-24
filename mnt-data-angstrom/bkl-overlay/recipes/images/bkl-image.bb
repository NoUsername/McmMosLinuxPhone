require = recipes/images/base-image.bb

DEPENDS += " \
  libQtDeclarative4 \
  "


IMAGE_INSTALL += " \
  libQtDeclarative4 \
  "
  
export IMAGE_BASENAME = "bkl-image"

# automatic network config for our board usb
﻿bkl_rootfs_postprocess() {
  curdir=$PWD
  cd ${IMAGE_ROOTFS}
  
  #create/overwrite network conf
  echo "auto usb0" > ./etc/network/interfaces
  echo "iface usb0 inet static" >> ./etc/network/interfaces
  echo "    address 192.168.0.202" >> ./etc/network/interfaces
  echo "    netmask 255.255.255.0" >> ./etc/network/interfaces
  echo "    network 192.168.0.0" >> ./etc/network/interfaces
  echo "    gateway 192.168.0.200" >> ./etc/network/interfaces
  

  #create application-start-script
  echo "#!/bin/sh" > ./root/runQt.sh
  echo "export DISPLAY=:0" >> ./root/runQt.sh
  echo "Xfbdev -screen 640x480x32 -mouse mouse &" >> ./root/runQt.sh
  echo "sleep 3" >> ./root/runQt.sh
  echo "McmMosLinuxPhone" >> ./root/runQt.sh
  
  #TODO add the runQt.sh to the etc/inittab
  
  cd $curdir
}

#register above command for execution
ROOTFS_POSTPROCESS_COMMAND += "bkl_rootfs_postprocess"
