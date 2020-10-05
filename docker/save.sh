#!/bin/bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )

# shellcheck source=docker/variables.sh
source "${DIR}"/docker/variables.sh

echo "Save jasperserver pro cmdline."
docker save -o "${DIR}"/jasperserver-pro-cmdline-image.tar "${JASPERSERVER_PRO_CMDLINE_IMAGE_NAME_WITHOUT_TAG}"
echo "Save jasperserver pro."
docker save -o "${DIR}"/jasperserver-pro-image.tar "${JASPERSERVER_PRO_IMAGE_NAME_WITHOUT_TAG}"
