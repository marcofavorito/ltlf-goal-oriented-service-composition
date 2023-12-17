#!/usr/bin/env bash

set -exuo pipefail


TB_encode() {
  # Getting domain and problem files from function arguments
  local _DOMAIN_FILE="$(realpath $1)"
  local _PROBLEM_FILE="$(realpath $2)"
  local _ACTION_MODE=$3

  _COMPILED_DOMAIN_FILE="${_DOMAIN_FILE%.pddl}_compiled.pddl"
  _COMPILED_PROBLEM_FILE="${_PROBLEM_FILE%.pddl}_compiled.pddl"
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
    sed -i "s/(:goal (f_goal))/(:goal (and (f_goal) $FINAL_CONDITION))/g" "$_COMPILED_PROBLEM_FILE";
  elif [[ "$_ACTION_MODE" == "3" || "$_ACTION_MODE" == "4" ]]; then
    sed -i "s/(:goal (and/(:goal (and $FINAL_CONDITION/g" "$_COMPILED_PROBLEM_FILE";
  fi
}

TB_encode $@
