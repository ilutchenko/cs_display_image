#!/bin/bash

cd /data/meta-layers/
source poky/oe-init-build-env
MACHINE=dk2-mp1 bitbake cas-display-image