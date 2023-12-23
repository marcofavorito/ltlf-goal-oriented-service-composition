#!/usr/bin/env bash

set -exuo pipefail

OUTPUT_DIR=${1:-output}

find output -name "*.dot" | xargs -I{} dot -Tsvg {} -o {}.svg
