#!/bin/bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )

# shellcheck source=docker/variables.sh
source "${DIR}"/docker/variables.sh

TIPCO_FILE="TIB_js-jrs_7.5.1_bin.zip"

echo "Copy files ..."
cp "${DIR}/../js-docker-files/${TIPCO_FILE}" "${DIR}"/
cp "${DIR}/../js-docker-files/jasperserver.license" "${DIR}"/license/
cp "${DIR}/../js-docker-files/.jrsks" security/
cp "${DIR}/../js-docker-files/.jrsksp" security/

echo "Unzip TIPCO packages..."
unzip -o -q "${TIPCO_FILE}" -d "${DIR}"/resources/
cd resources/jasperreports-server-pro-*-bin
unzip -o -q jasperserver-pro.war -d jasperserver-pro
cd -

echo "Building jasperserver-pro-cmdline container..."
docker build --no-cache=true -t "${JASPERSERVER_PRO_CMDLINE_IMAGE_NAME}" -f Dockerfile-cmdline .
echo "Building jasperserver-pro container..."
docker build --no-cache=true -t "${JASPERSERVER_PRO_IMAGE_NAME}" .
