#!/bin/bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )

JASPERSERVER_PRO_CMDLINE_IMAGE_NAME="jasperserver-pro-cmdline:7.5.1"
JASPERSERVER_PRO_CMDLINE_CONTAINER_NAME="jasperserver-pro-cmdline"

docker run -d --env-file="${DIR}"/.env \
    --name "${JASPERSERVER_PRO_CMDLINE_CONTAINER_NAME}" \
    -v "${DIR}"/hotfixes:/usr/local/share/jasperserver-pro/customization \
    -v "${DIR}"/imports:/usr/local/share/jasperserver-pro/import \
    -p 3306 "${JASPERSERVER_PRO_CMDLINE_IMAGE_NAME}" \
    import /usr/local/share/jasperserver-pro/import
