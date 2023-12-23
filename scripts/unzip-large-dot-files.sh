set -exuo pipefail

OUTPUT_DIR=${1:-output}

for file in $(find ${OUTPUT_DIR} -name "policy.dot.zip"); do unzip $file -d $(dirname ${file}); done
