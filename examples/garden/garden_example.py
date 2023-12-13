from pathlib import Path

from pylogics.parsers import parse_ltl
from pylogics.utils.to_string import to_string

from ltlf_goal_oriented_service_composition.declare_utils import build_declare_assumption
from ltlf_goal_oriented_service_composition.rewrite_formula import rewrite
from ltlf_goal_oriented_service_composition.services import Service
from ltlf_goal_oriented_service_composition.to_pddl import services_to_pddl, _START_SYMB

if __name__ == "__main__":
    actions = {"clean", "empty", "water", "pluck"}
    declare_ass = build_declare_assumption(actions)
    formula_str = "clean & X[!]((clean U ((water & X[!](pluck)) | (pluck & X[!](water)))))"# + " & " + declare_ass
    formula_str = f"{_START_SYMB} & X[!]({formula_str})"
    formula = parse_ltl(formula_str)
    formula_pddl = rewrite(formula)

    bot_0 = Service(
        {"a0", "a1"},
        {"clean", "empty"},
        {"a0"},
        "a0",
        {
            "a0": {
                "clean": {"a0", "a1"},
            },
            "a1": {"empty": {"a0"}},
        },
    )

    bot_1 = Service(
        {"b0", "b1", "b2"},
        {"water", "pluck", "empty"},
        {"b0"},
        "b0",
        {
            "b0": {
                "water": {"b0"},
                "pluck": {"b1", "b2"},
            },
            "b1": {
                "water": {"b1"},
                "empty": {"b0"},
            }
        },
    )
    bot_2 = Service(
        {"c0", "c1"},
        {"pluck", "empty"},
        {"c0"},
        "c0",
        {
            "c0": {
                "pluck": {"c1"},
            },
            "c1": {
                "empty": {"c0"}
            },
        },
    )

    domain, problem = services_to_pddl([bot_0, bot_1, bot_2], formula_pddl)

    Path("domain.pddl").write_text(domain)
    Path("problem.pddl").write_text(problem)
