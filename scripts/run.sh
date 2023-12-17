#!/usr/bin/env bash

set -exuo pipefail


ORIGINAL_DOMAIN=$1
ORIGINAL_PROBLEM=$2
ENCODING=$3
ENCODING_ARGS=${4:-}
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
elif [[ "$PLANNER" != "mynd" ]]; then
  echo "Invalid planner: '$PLANNER'. Allowed values are {'mynd'}."
  exit 1
fi

# Check encoding
if [[ -z "$ENCODING" ]]; then
  echo "Encoding not set!"
  exit 1
elif [[ "$ENCODING" != "TB" ]]; then
  echo "Invalid encoding: '$ENCODING'. Allowed values are {'TB'}."
  exit 1
fi

TB_encode() {
  # Getting domain and problem files from function arguments
  local _DOMAIN_FILE="$(realpath $1)"
  local _PROBLEM_FILE="$(realpath $2)"
  local _ACTION_MODE=$3

  _COMPILED_DOMAIN_FILE="${_DOMAIN_FILE%.pddl}_compiled.pddl"
  FINAL_CONDITION_FILE="$(dirname $_DOMAIN_FILE)/services_condition.txt"
  FINAL_CONDITION="$(cat $FINAL_CONDITION_FILE)"

  # Check action mode
  if [[ -z "$_ACTION_MODE" ]]; then
    echo "Action mode not set!"
    exit 1
  elif [[ "$_ACTION_MODE" != "1" && "$_ACTION_MODE" != "2" && "$_ACTION_MODE" != "3" && "$_ACTION_MODE" != "4" ]]; then
    echo "Invalid action mode. Allowed values are 1, 2, 3 and 4."
    exit 1
  fi

  # Run the operations
  cd prologex
  ./convert.sh "$_DOMAIN_FILE" "$_PROBLEM_FILE" "dp" "$_ACTION_MODE" \
    && cp ../prologex/tmp/domain-problem_problem_dp.pddl "${_DOMAIN_FILE%.pddl}_compiled.pddl" \
    && cp ../prologex/tmp/problem_dp.pddl "${_PROBLEM_FILE%.pddl}_compiled.pddl"
  cd ../

  python3 scripts/fix_tb_oneof.py --domain-file "${_DOMAIN_FILE%.pddl}_compiled.pddl";

  if [[ "$_ACTION_MODE" == "1" || "$_ACTION_MODE" == "2" ]]; then
    sed -i "s/(:goal (f_goal))/(:goal (and (f_goal)) $FINAL_CONDITION)/g" "$_COMPILED_DOMAIN_FILE";
  elif [[ "$_ACTION_MODE" == "3" || "$_ACTION_MODE" == "3" ]]; then
    sed -i "s/(:goal (and/(:goal (and $FINAL_CONDITION/g" "$_COMPILED_DOMAIN_FILE";
  fi
}

run_mynd() {
  local _ARGS="$3"
  ./planners/mynd/translator-fond/translate.py "$1" "$2"
  cd ./planners/mynd
  ./mynd.sh -search aostar $_ARGS ../../output.sas
  cd ../../
}

# Usage

if [[ "$ENCODING" == "TB" ]]; then
  TB_encode "$ORIGINAL_DOMAIN" "$ORIGINAL_PROBLEM" "$ENCODING_ARGS"
#elif [[ "$ENCODING" == "xxx" ]]; then
#  echo "Processing with xxx encoding..."
#  exit 1;
else
  echo "Error: Invalid encoding option"
  exit 1
fi


if [[ "$PLANNER" == "mynd" ]]; then
  run_mynd "${ORIGINAL_DOMAIN%.pddl}_compiled.pddl" "${ORIGINAL_PROBLEM%.pddl}_compiled.pddl" "$PLANNER_ARGS"
#elif [[ "$PLANNER" == "xxx" ]]; then
#  echo "Processing with xxx planner..."
else
  echo "Error: Invalid planner option"
  exit 1
fi