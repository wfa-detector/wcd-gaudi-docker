#!/bin/bash
# USAGE: ./build.sh [<version>] [<repository>]
# optionally, set ${DOCKER} to docker command to use, default: docker

VERSION="main-gaudi"
REPOSITORY=${USER} #dockerhub user repository
SUFFIX="ubuntu24"

if [ "$#" -gt 0 ]; then
	VERSION=$1
fi

if [ "$#" -gt 1 ]; then
	REPOSITORY=$2
fi

if [[ -z "${DOCKER}" ]]; then
    DOCKER="docker"
fi


# exit when any command fails
set -e

# The actual building
echo "### Building Docker images: ${REPOSITORY}/<IMAGE>:${VERSION}-${SUFFIX}"
echo
#
echo "### Building the Spack image" && \
${DOCKER} build -t ${REPOSITORY}/wcd:${VERSION}-${SUFFIX} --build-arg VERSION -f Dockerfile .
