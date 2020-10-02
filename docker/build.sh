#!/bin/bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )

echo "Copy files ..."
cp "${DIR}"/../js-docker-files/TIB_js-jrs_7.5.1_bin.zip "${DIR}"/
cp "${DIR}"/../js-docker-files/jasperserver.license "${DIR}"/license/
cp "${DIR}"/../js-docker-files/.jrsks security/
cp "${DIR}"/../js-docker-files/.jrsksp  security/

echo "Unzip TIPCO packages..."
unzip -o -q TIB_js-jrs_7.5.1_bin.zip -d "${DIR}"/resources/
cd resources/jasperreports-server-pro-*-bin
unzip -o -q jasperserver-pro.war -d jasperserver-pro
cd -

echo "Building jasperserver-pro container..."
docker build --no-cache=true -t jasperserver-pro:7.5.1 .
echo "Building jasperserver-pro-cmdline container..."
docker build --no-cache=true -t jasperserver-pro-cmdline:7.5.0 -f Dockerfile-cmdline .
