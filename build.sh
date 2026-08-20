#!/usr/bin/env bash
set -euo pipefail

VERSION="${1:-v3-gaudi}"
REPOSITORY="${2:-pauchkov}"
SUFFIX="ubuntu24"
DOCKER="${DOCKER:-docker}"

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
IMAGE="${REPOSITORY}/wcd:${VERSION}-${SUFFIX}"

echo "Building ${IMAGE}"

"${DOCKER}" build \
    --tag "${IMAGE}" \
    --build-arg "VERSION=${VERSION}" \
    --file "${SCRIPT_DIR}/Dockerfile" \
    "${SCRIPT_DIR}"
