# WakeField Acceleration Collider Detector - container setup

Docker image and utilities to build WFA Collider Detector software container.

## Shifter (e.g. on NERSC)
The `wcd-shifter.sh` script gives an example to run the docker image with shifter.

The wcd_runner.ini should be installed into `~/.pytaskfarmer/runners.d/` to be used with [pytaskfarmer](https://gitlab.cern.ch/berkeleylab/pytaskfarmer).

## Docker container
`run.sh` gives an example to run docker container with the image.

## History of deployed images

* latest version: angirar/wcd:main-gaudi-alma9
