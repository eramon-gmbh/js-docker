#!/bin/bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )

docker run -d --env-file="${DIR}"/.env \
    --name jasperserver-pro-cmdline \
    -v "${DIR}"/hotfixes:/usr/local/share/jasperserver-pro/buildomatic_customization \
    -v "${DIR}"/exports:/usr/local/share/jasperserver-pro/export \
    -p 3306 jasperserver-pro-cmdline:7.5.1 \
    export /usr/local/share/jasperserver-pro/export
