DESCRIPTION = "Our phone app"
LICENSE = "GPL"
PR = "r1"

SRC_URI = "git://github.com/NoUsername/McmMosLinuxPhone.git;protocol=git;tag=master"
#SRC_URI = "git:///home/paul/MosGit/McmMosLinuxPhone.git;protocol=git;tag=master"

S = "${WORKDIR}/git/McmMosLinuxPhone"

inherit qt4x11

do_install() {
  export INSTALL_ROOT=${D}
  make install
}
