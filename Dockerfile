###############################################################################
#  Repository: wcd-docker
#  Tag:        ${VERSION}-alma9
###############################################################################

## Settings
ARG VERSION=main-gaudi

## Starting docker image
FROM ghcr.io/muoncollidersoft/mucoll-sim-ubuntu24:main

## Add additional dependencies
USER root
RUN TARGET_DIR=$(python3 -c "import sys; print('\n'.join(sys.path))" | grep '/usr/local/lib/') && \
    pip install --target ${TARGET_DIR} openpmd_viewer openpmd_api

USER mucoll

## Add a simple bashrc
COPY bashrc /home/mucoll/.bashrc
