#!/usr/bin/env bash

set -exuo pipefail

OUTPUT_DIR=${1:-output}

echo "Unzipping all large 'policy.dot' files..."
for file in $(find output-final -name "policy.dot.zip"); do unzip $file -d $(dirname ${file}); done

echo "Simplify all policies:"
find output -name "policy.dot" | xargs dirname | xargs -I{} python3 ./scripts/simplify-policy.py --dot-file {}/policy.dot --out-file {}/simplified-policy.dot
