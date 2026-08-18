#!/usr/bin/env bash
set -euo pipefail

VERSION="${1:-v3-gaudi}"
REPOSITORY="${2:-pauchkov}"
SUFFIX="ubuntu24"
DOCKER="${DOCKER:-docker}"

IMAGE="${REPOSITORY}/wcd:${VERSION}-${SUFFIX}"
HOST_HOME="${HOME:?HOME is not set}"

if ! "${DOCKER}" image inspect "${IMAGE}" >/dev/null 2>&1; then
    echo "Docker image not found: ${IMAGE}" >&2
    echo "Build it first with: ./build.sh" >&2
    exit 1
fi

RUN_ARGS=(
    run
    --interactive
    --tty
    --rm
    --user "$(id -u):$(id -g)"
    --env "USER=${USER:-user}"
    --env "HOME=/tmp"
    --env "WCD_VER=${VERSION}-${SUFFIX}"
    --volume "${PWD}:/workspace"
    --workdir /workspace
)

if [[ -n "${DISPLAY:-}" ]]; then
    RUN_ARGS+=(--env "DISPLAY=${DISPLAY}" --network host)

    XAUTHORITY_FILE="${XAUTHORITY:-${HOST_HOME}/.Xauthority}"
    if [[ -f "${XAUTHORITY_FILE}" ]]; then
        RUN_ARGS+=(
            --env "XAUTHORITY=/tmp/.Xauthority"
            --volume "${XAUTHORITY_FILE}:/tmp/.Xauthority:ro"
        )
    fi
fi

if [[ -d "${HOST_HOME}/.ssh" ]]; then
    RUN_ARGS+=(--volume "${HOST_HOME}/.ssh:/tmp/.ssh")
fi

RUN_ARGS+=(
    --entrypoint /bin/bash
    "${IMAGE}"
    --init-file /etc/profile.d/bashrc.sh
)

exec "${DOCKER}" "${RUN_ARGS[@]}"
