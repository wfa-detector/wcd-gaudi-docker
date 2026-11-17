###############################################################################
# Wakefield image based on MuColl v3.1
###############################################################################
ARG VERSION=v3.1-20261117
FROM ghcr.io/muoncollidersoft/mucoll-sim-ubuntu24:v3.1
ARG VERSION
LABEL org.opencontainers.image.version="${VERSION}-ubuntu24"

USER root

# Use the v3.1 stack dependencies; install only the Wakefield Python tools.
RUN bash -lc 'source /opt/setup_mucoll.sh && \
    TARGET_DIR=/opt/python3/site-packages && \
    mkdir -p ${TARGET_DIR} && \
    python3 -m pip install --no-deps --target ${TARGET_DIR} openpmd_viewer openpmd_api'

COPY bashrc /etc/profile.d/bashrc.sh
