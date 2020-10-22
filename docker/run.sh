#!/bin/bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )

if [ ! -f "${DIR}"/.env ]; then
    echo "Please provide .env file!"
fi

# shellcheck source=docker/variables.sh
source "${DIR}"/docker/variables.sh

# uncomment if you need to initialize the server - should only be needed when upgrading server version
#echo "Run jasperserver pro cmdline image."
#docker run -d --env-file="${DIR}"/.env \
#    --name "${JASPERSERVER_PRO_CMDLINE_CONTAINER_NAME}" \
#    -v "${DIR}"/hotfixes:/usr/local/share/jasperserver-pro/customization \
#    -p 3306 "${JASPERSERVER_PRO_CMDLINE_IMAGE_NAME}" init

echo "Run jasperserver pro image."
docker run -d --env-file="${DIR}"/.env \
    --name="${JASPERSERVER_PRO_CONTAINER_NAME}" \
    -v "${DIR}"/hotfixes:/usr/local/share/jasperserver-pro/customization \
    -v "${DIR}"/output:/output \
    --net=host \
    -p 3306 -p 8080:8080 "${JASPERSERVER_PRO_IMAGE_NAME}"

