#!/usr/bin/env bash

set -exuo pipefail

run_mynd() {
  local _ARGS="$3"
  ./planners/mynd/translator-fond/translate.py "$1" "$2"
  cd ./planners/mynd
  ./mynd.sh -search aostar $_ARGS ../../output.sas
  cd ../../
}

run_mynd "$@"
