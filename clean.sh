#!/bin/bash

source shared.sh

EXTERNAL_REL_BUILDROOT=../base_external
git submodule init
git submodule sync
git submodule update

cd `dirname $0`


# Directory to the Buildroot directory
cd buildroot

# Run make distclean
make distclean
