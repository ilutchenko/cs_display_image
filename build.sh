#!/bin/bash

cd /data/meta-layers/
source poky/oe-init-build-env
MACHINE=stm32mp1 bitbake cas-display-image
