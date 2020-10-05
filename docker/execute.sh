#!/bin/bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )

echo "Stop and remove old containers."
docker stop jasperserver-pro-cmdline || true
docker stop jasperserver_pro || true
docker rm jasperserver-pro-cmdline || true
docker rm jasperserver_pro || true

echo "Execute load.sh..."
sh "${DIR}"/docker/load.sh
echo "Execute run.sh..."
sh "${DIR}"/docker/run.sh
