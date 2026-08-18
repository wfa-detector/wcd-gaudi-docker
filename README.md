# WakeField Acceleration Collider Detector - container setup

Docker image and utilities to build the WFA Collider Detector software container
based on the MuColl v3 environment.

## Shifter (e.g. on NERSC)
The `wcd-shifter.sh` script gives an example to run the docker image with shifter.

The wcd_runner.ini should be installed into `~/.pytaskfarmer/runners.d/` to be used with [pytaskfarmer](https://gitlab.cern.ch/berkeleylab/pytaskfarmer).

## Docker container

The versioned image is available from Docker Hub:

```bash
docker pull pauchkov/wcd:v3-gaudi-20260818-ubuntu24
```

Build and run the same version locally:

```bash
./build.sh v3-gaudi-20260818 pauchkov
./run.sh v3-gaudi-20260818 pauchkov
```

## History of deployed images

* latest version: `pauchkov/wcd:v3-gaudi-20260818-ubuntu24`
