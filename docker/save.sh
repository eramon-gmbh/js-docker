#!/bin/bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )

JASPERSERVER_PRO_CMDLINE_CONTAINER_NAME="jasperserver-pro-cmdline"
JASPERSERVER_PRO_CONTAINER_NAME="jasperserver_pro"

echo "Save jasperserver pro cmdline."
docker save -o "${DIR}"/jasperserver-pro-cmdline-image.tar "${JASPERSERVER_PRO_CMDLINE_CONTAINER_NAME}"
echo "Save jasperserver pro."
docker save -o "${DIR}"/jasperserver-pro-image.tar "${JASPERSERVER_PRO_CONTAINER_NAME}"
