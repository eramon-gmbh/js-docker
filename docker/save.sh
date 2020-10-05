#!/bin/bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )

echo "Save jasperserver pro cmdline."
docker save -o "${DIR}"/jasperserver-pro-cmdline-image.tar jasperserver-pro-cmdline
echo "Save jasperserver pro."
docker save -o "${DIR}"/jasperserver-pro-image.tar jasperserver-pro
