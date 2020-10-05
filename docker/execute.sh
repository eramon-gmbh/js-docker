#!/bin/bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )

# shellcheck source=docker/variables.sh
source "${DIR}"/docker/variables.sh

echo "Stop and remove old containers."
docker stop "${JASPERSERVER_PRO_CMDLINE_CONTAINER_NAME}" || true
docker stop "${JASPERSERVER_PRO_CONTAINER_NAME}" || true
docker rm "${JASPERSERVER_PRO_CMDLINE_CONTAINER_NAME}" || true
docker rm "${JASPERSERVER_PRO_CONTAINER_NAME}" || true

echo "Execute load.sh..."
sh "${DIR}"/docker/load.sh
echo "Execute run.sh..."
sh "${DIR}"/docker/run.sh
