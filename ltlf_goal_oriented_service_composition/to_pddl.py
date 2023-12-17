import operator
from functools import reduce

import pddl
from typing import Sequence, Tuple

from ltlf_goal_oriented_service_composition.services import Service, _SINK

_START_ACTION = "startaction"
_START_SYMB = "startsymb"


def services_to_pddl(services: Sequence[Service], formula_pddl: str) -> Tuple[str, str]:
    assert len(services) > 0, "No services"
    actions = sorted(reduce(set.union, map(operator.attrgetter("actions"), services)))
    pddl = ""
    pddl += "(define (domain composition)\n"
    pddl += "  (:requirements :strips :typing :non-deterministic :conditional-effects)\n"
    pddl += "  (:types state action)\n"

    # add states as constants
    pddl += "  (:constants\n"
    for idx, service in enumerate(services):
        for state in sorted(service.states):
            pddl += f"    s{idx}_{state} - state\n"
    pddl += "  )\n"

    pddl += "  (:predicates\n"
    for idx in range(len(services)):
        pddl += f"    (current_state_{idx} ?s - state)\n"
    for action in actions:
        pddl += f"    ({action})\n"
    # pddl += "    (?a - action)\n"
    pddl += f"    ({_START_SYMB})\n"
    pddl += "  )\n"

    for action in actions:
        for idx, service in enumerate(services):
            for state in sorted(service.states):
                action_str = f"(:action {action}_{idx}_{state}\n"
                action_str += f"    :precondition (current_state_{idx} s{idx}_{state})\n"
                action_str += f"    :effect (and\n"
                next_states = sorted(service.transition_function.get(state, {}).get(action, set()))
                if len(next_states) == 0:
                    continue
                more_than_one_successor = len(next_states) > 1
                if more_than_one_successor:
                    action_str += f"        (oneof\n"
                for next_state in next_states:
                    if next_state == state:
                        action_str += f"            (current_state_{idx} s{idx}_{next_state})\n"
                    else:
                        action_str += f"            (and (not (current_state_{idx} s{idx}_{state})) (current_state_{idx} s{idx}_{next_state}))\n"
                if more_than_one_successor:
                    action_str += "         )\n"
                action_str += f"        ({action})\n"
                for not_action in actions:
                    if not_action == action:
                        continue
                    action_str += f"        (not ({not_action}))\n"
                action_str += f"    )\n"
                action_str += ")\n"
                pddl += action_str
    pddl += "  )\n"

    problem = "(define (problem service-problem)\n"
    problem += "    (:domain composition)\n"
    init = "    (:init\n"
    for idx, service in enumerate(services):
        init += f"    (current_state_{idx} s{idx}_{service.initial_state})\n"
    init += f"    ({_START_SYMB})\n"
    init += "    )\n"
    problem += init
    problem += "    (:goal (and\n"
    problem += f"            {formula_pddl}\n"
    problem += "            )\n"
    problem += "    )\n"
    problem += ")\n"
    return pddl, problem


def final_services_condition(services: Sequence[Service]) -> str:
    conditions = []
    for idx, service in enumerate(services):
        condition = ""
        more_than_one_final_state = len(service.final_states) > 1
        if more_than_one_final_state:
            condition += "(or "
        for final_state in sorted(service.final_states):
            condition += f"(current_state_{idx} s{idx}_{final_state}) "
        if more_than_one_final_state:
            condition += ")"
        conditions.append(condition)
    return " ".join(conditions)
