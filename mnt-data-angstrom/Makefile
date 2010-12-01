.PHONY: buildImage
buildImage:
	( \
	cd /mnt/data/angstrom ; \
#	sh angstrom-setup-scripts/oebb.sh config beagleboard ; \
  cd /mnt/data/angstrom/build ; \
	source ~/.oe/environment ; \
	MACHINE=beagleboard bitbake base-image ; \
#	bitbake base-image; \
	)
	
	
.PHONY: checkOverlayImage
checkOverlayImage:
	( \
	cd /mnt/data/angstrom ; \
#	sh angstrom-setup-scripts/oebb.sh config beagleboard ; \
  cd /mnt/data/angstrom/build ; \
	source ~/.oe/environment ; \
	MACHINE=beagleboard bitbake bkl-image -g ; \
#	bitbake bkl-image; \
	)
	
.PHONY: buildOverlayImage
buildOverlayImage:
	( \
	cd /mnt/data/angstrom ; \
#	sh angstrom-setup-scripts/oebb.sh config beagleboard ; \
  cd /mnt/data/angstrom/build ; \
	source ~/.oe/environment ; \
	MACHINE=beagleboard bitbake bkl-image -DD ; \
#	bitbake bkl-image; \
	)
	
.PHONY: clean
clean:
	( \
	cd /mnt/data/angstrom/build ; \
	source ~/.oe/environment ; \
	MACHINE=beagleboard bitbake -b recipes/images/bkl-image -c clean; \
	)
