#!/usr/bin/env bash

set -exuo pipefail

WORKDIR=${1:-./output}
TIMEOUT=${2:-300.0}

/bin/rm -rf ${WORKDIR}

python3 ./experiments/entrypoints/run_electric_motor_nondet.py             --workdir $WORKDIR --timeout $TIMEOUT
python3 ./experiments/entrypoints/run_chip_production.py                   --workdir $WORKDIR --timeout $TIMEOUT
python3 ./experiments/entrypoints/run_garden.py                            --workdir $WORKDIR --timeout $TIMEOUT
python3 ./experiments/entrypoints/run_electric_motor_nondet_unsolvable.py  --workdir $WORKDIR --timeout $TIMEOUT

echo "All experiment have been run!"