#!/bin/bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )

# shellcheck source=docker/variables.sh
source "${DIR}"/docker/variables.sh

docker run -d --env-file="${DIR}"/.env \
    --name "${JASPERSERVER_PRO_CMDLINE_CONTAINER_NAME}" \
    -v "${DIR}"/hotfixes:/usr/local/share/jasperserver-pro/buildomatic_customization \
    -v "${DIR}"/exports:/usr/local/share/jasperserver-pro/export \
    -p 3306 "${JASPERSERVER_PRO_CMDLINE_IMAGE_NAME}" \
    export /usr/local/share/jasperserver-pro/export
