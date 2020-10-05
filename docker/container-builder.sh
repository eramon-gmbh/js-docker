#!/bin/bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )

echo "Build images."
sh "${DIR}"/docker/build.sh
echo "Save images."
sh "${DIR}"/docker/save.sh
