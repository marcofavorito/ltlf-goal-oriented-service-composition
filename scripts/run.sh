#!/usr/bin/env bash

set -ex

ORIGINAL_DOMAIN=$1
ORIGINAL_PROBLEM=$2
ENCODING=$3
ENCODING_ARGS=${4:-1}
PLANNER=$5
PLANNER_ARGS=${6:-}

# validate if filepaths exist
if [[ ! -e "$ORIGINAL_DOMAIN" ]]; then
  echo "The domain file does not exist"
  exit 1
fi

if [[ ! -e "$ORIGINAL_PROBLEM" ]]; then
  echo "The problem file does not exist"
  exit 1
fi


# Check planner
if [[ -z "$PLANNER" ]]; then
  echo "Planner not set!"
  exit 1
elif [[ "$PLANNER" != "fond-sat" && "$PLANNER" != "mynd" ]]; then
  echo "Invalid planner: '$PLANNER'. Allowed values are 'fond-sat' and 'mynd'."
  exit 1
fi

# Check encoding
if [[ -z "$ENCODING" ]]; then
  echo "Encoding not set!"
  exit 1
elif [[ "$ENCODING" != "TB" && "$ENCODING" != "ltlf2f" ]]; then
  echo "Invalid encoding: '$ENCODING'. Allowed values are 'TB' and 'ltlf2f'."
  exit 1
fi

TB_encode() {
  # Getting domain and problem files from function arguments
  local _DOMAIN_FILE="$(realpath $1)"
  local _PROBLEM_FILE="$(realpath $2)"
  local _ACTION_MODE=$3

  # Check action mode
  if [[ -z "$_ACTION_MODE" ]]; then
    echo "Action mode not set!"
    exit 1
  elif [[ "$_ACTION_MODE" != "1" && "$_ACTION_MODE" != "2" ]]; then
    echo "Invalid action mode. Allowed values are 1 and 2."
    exit 1
  fi

  # Run the operations
  cd prologex
  ./convert.sh "$_DOMAIN_FILE" "$_PROBLEM_FILE" "dp" "$_ACTION_MODE" \
    && cp ../prologex/tmp/domain-problem_problem_dp.pddl "${_DOMAIN_FILE%.pddl}_compiled.pddl" \
    && cp ../prologex/tmp/problem_dp.pddl "${_PROBLEM_FILE%.pddl}_compiled.pddl"
  cd ../
  python3 scripts/fix_tb_oneof.py --domain-file "${_DOMAIN_FILE%.pddl}_compiled.pddl"
}

run_mynd() {
  local _ARGS="$3"
  ./planners/mynd/translator-fond/translate.py "$1" "$2"
  cd ./planners/mynd
  ./mynd.sh -search aostar $_ARGS ../../output.sas
  cd ../../
}

run_fondsat() {
  local _ARGS="$3"
  cd ./planners/fond-sat/src
}

# Usage

if [[ "$ENCODING" == "TB" ]]; then
  TB_encode "$ORIGINAL_DOMAIN" "$ORIGINAL_PROBLEM" "$ENCODING_ARGS"
elif [[ "$ENCODING" == "ltlf2f" ]]; then
  echo "Processing with ltlf2f encoding..."
  exit 1;
else
  echo "Error: Invalid encoding option"
  exit 1
fi


if [[ "$PLANNER" == "mynd" ]]; then
  run_mynd "${ORIGINAL_DOMAIN%.pddl}_compiled.pddl" "${ORIGINAL_PROBLEM%.pddl}_compiled.pddl" "$PLANNER_ARGS"
elif [[ "$PLANNER" == "fond-sat" ]]; then
  echo "Processing with fond-sat planner..."
else
  echo "Error: Invalid planner option"
  exit 1
fi