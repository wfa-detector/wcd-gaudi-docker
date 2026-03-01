###############################################################################
#  Repository: wcd-docker
#  Tag:        ${VERSION}-ubuntu24
###############################################################################

## Settings
ARG VERSION=main-gaudi

## Starting docker image
FROM ghcr.io/muoncollidersoft/mucoll-sim-ubuntu24:main

## Add additional system-wide dependencies
USER root

# Install system-side python packages in a specific folder to be included
# in the PYTHONPATH environment variable in the bashrc file.
RUN TARGET_DIR=/opt/python3/site-packages && \
    mkdir -p ${TARGET_DIR} && \
    pip install --target ${TARGET_DIR} openpmd_viewer openpmd_api

## Add a simple bashrc in a neutral path
COPY bashrc /etc/profile.d/bashrc.sh