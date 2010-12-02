.PHONY: buildImage
buildImage:
	( \
	cd /mnt/data/angstrom ; \
  cd /mnt/data/angstrom/build ; \
	source ~/.oe/environment ; \
	MACHINE=beagleboard bitbake base-image ; \
	)
	
	
.PHONY: checkOverlayImage
checkOverlayImage:
	( \
	cd /mnt/data/angstrom ; \
  cd /mnt/data/angstrom/build ; \
	source ~/.oe/environment ; \
	MACHINE=beagleboard bitbake bkl-image -g ; \
	)
	
.PHONY: buildOverlayImage
buildOverlayImage:
	( \
	cd /mnt/data/angstrom ; \
  cd /mnt/data/angstrom/build ; \
	source ~/.oe/environment ; \
	MACHINE=beagleboard bitbake bkl-image -DDD ; \
	)
	
.PHONY: clean
clean:
	( \
	cd /mnt/data/angstrom/build ; \
	source ~/.oe/environment ; \
	MACHINE=beagleboard bitbake -b recipes/images/bkl-image -c clean; \
	)


