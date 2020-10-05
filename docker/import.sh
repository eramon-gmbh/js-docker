#!/bin/bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )

docker run -d --env-file="${DIR}"/.env \
    --name jasperserver-pro-cmdline \
    -v "${DIR}"/hotfixes:/usr/local/share/jasperserver-pro/customization \
    -v "${DIR}"/imports:/usr/local/share/jasperserver-pro/import \
    -p 3306 jasperserver-pro-cmdline:7.5.1 \
    import /usr/local/share/jasperserver-pro/import
