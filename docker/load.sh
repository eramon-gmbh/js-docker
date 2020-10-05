#!/bin/bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )

# shellcheck source=docker/variables.sh
source "${DIR}"/docker/variables.sh

echo "Remove old images"
docker rmi "${JASPERSERVER_PRO_CMDLINE_IMAGE_NAME}" || true
docker rmi "${JASPERSERVER_PRO_IMAGE_NAME}" || true

echo "Load jasperserver pro cmdline image."
docker load < "${DIR}"/jasperserver-pro-cmdline-image.tar
echo "Load jasperserver pro image."
docker load < "${DIR}"/jasperserver-pro-image.tar
