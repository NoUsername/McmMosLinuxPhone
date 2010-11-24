SRC_URI = "https://NoUsername@github.com/NoUsername/McmMosLinuxPhone.git"

S = "${WORKDIR}/git/QtQuickApp"

inherit qt4x11

do_install() {
  export INSTALL_ROOT=${D}
  # TODO sth missing here...
}
