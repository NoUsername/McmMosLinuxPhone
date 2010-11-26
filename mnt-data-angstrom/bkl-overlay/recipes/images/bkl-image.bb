requires = recipes/images/base-image.bb

IMAGE_INSTALL += "\
  libQtDeclarative4 \
  "
  
export IMAGE_BASENAME = "bkl-image"

