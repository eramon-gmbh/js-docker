#!/bin/bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )

if [ ! -f "${DIR}"/.env ]; then
    echo "Please provide .env file!"
fi

echo "Run jasperserver pro cmdline image."
docker run -d --env-file="${DIR}"/.env \
    --name jasperserver-pro-cmdline \
    -v "${DIR}"/hotfixes:/usr/local/share/jasperserver-pro/customization \
    -p 3306 jasperserver-pro-cmdline:7.5.1 init

echo "Run jasperserver pro image."
docker run -d --env-file="${DIR}"/.env \
    --name=jasperserver_pro \
    -v "${DIR}"/hotfixes:/usr/local/share/jasperserver-pro/customization \
    -v "${DIR}"/output:/output \
    -p 3306 -p 8080:8080 jasperserver-pro:7.5.1

