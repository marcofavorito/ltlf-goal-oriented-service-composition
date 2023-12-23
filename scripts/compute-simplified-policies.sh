#!/usr/bin/env bash

set -exuo pipefail

OUTPUT_DIR=${1:-output}

find output -name "policy.dot" | xargs dirname | xargs -I{} python3 ./scripts/simplify-policy.py --dot-file {}/policy.dot --out-file {}/simplified-policy.dot
