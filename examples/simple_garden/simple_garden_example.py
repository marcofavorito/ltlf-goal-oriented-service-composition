from pathlib import Path

from pylogics.parsers import parse_ltl

from ltlf_goal_oriented_service_composition.declare_utils import build_declare_assumption
from ltlf_goal_oriented_service_composition.rewrite_formula import rewrite
from ltlf_goal_oriented_service_composition.services import Service
from ltlf_goal_oriented_service_composition.to_pddl import services_to_pddl, _START_SYMB


GOAL_FORMULA = f"clean"


def bot_0():
    return Service(
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


if __name__ == "__main__":
    formula_str = f"{_START_SYMB} & X[!]({GOAL_FORMULA})"
    formula = parse_ltl(formula_str)
    formula_pddl = rewrite(formula)

    domain, problem = services_to_pddl([bot_0()], formula_pddl)

    Path("domain.pddl").write_text(domain)
    Path("problem.pddl").write_text(problem)
