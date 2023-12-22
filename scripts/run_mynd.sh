#!/usr/bin/env bash

set -exuo pipefail

cd ./planners/mynd && \
  rm -f ./output.sas && \
  ./translator-fond/translate.py "$1" "$2" && \
  java -Xmx16g -cp target/mynd-1.0-SNAPSHOT.jar mynd.MyNDPlanner -search aostar ./output.sas ${@:3} && \
  cd ../../
