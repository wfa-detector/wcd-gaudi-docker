# Wakefield Gaudi Docker image based on MuColl v3.1

This branch builds a Wakefield development image on top of the published
`ghcr.io/muoncollidersoft/mucoll-sim-ubuntu24:v3.1` image. It keeps the
Wakefield Python tools `openpmd_viewer` and `openpmd_api` and the interactive
shell setup in `bashrc`. It does not add or override EDM4hep. The MuColl v3.1
base image provides EDM4hep 1.1.0.

## Build and run locally

```bash
./build.sh
./run.sh
```

The default local image tag is `pauchkov/wcd:v3.1-20261117-ubuntu24`. Pass a version
and Docker Hub namespace to both scripts to use another tag. Building locally
does not publish the image.

After a successful build and local check, publish this tag with:

```bash
docker login -u pauchkov
docker push pauchkov/wcd:v3.1-20261117-ubuntu24
docker pull pauchkov/wcd:v3.1-20261117-ubuntu24
```

Inside the container, inspect the active EDM4hep version with:

```bash
python3 -c 'import edm4hep; print(edm4hep.__version__, edm4hep.__file__)'
```

## Reconstruction components

This Dockerfile uses the ACTS, DD4hep, Gaudi, EDM4hep and Pandora components
supplied by MuColl v3.1. It does not install Wakefield-specific ACTS tracking
geometry or a material map; those are built and activated in the separate
reconstruction workspace.

## Shifter

`wcd-shifter.sh` is an example for running a published image with Shifter.
`wcd_runner.ini` can be installed into `~/.pytaskfarmer/runners.d/` for
[pytaskfarmer](https://gitlab.cern.ch/berkeleylab/pytaskfarmer).
