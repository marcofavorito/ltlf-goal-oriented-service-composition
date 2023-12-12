from pathlib import Path

from pylogics.parsers import parse_ltl

from ltlf_goal_oriented_service_composition.declare_utils import build_declare_assumption
from ltlf_goal_oriented_service_composition.rewrite_formula import rewrite
from ltlf_goal_oriented_service_composition.services import Service
from ltlf_goal_oriented_service_composition.to_pddl import services_to_pddl, _START_SYMB

if __name__ == "__main__":
    actions = {"clean", "water"}
    declare_ass = build_declare_assumption(actions)
    # formula_str = "clean & X[!](water)" + " & " + declare_ass
    formula_str = f"{_START_SYMB} & X[!](clean)"
    formula = parse_ltl(formula_str)
    formula_pddl = rewrite(formula)

    bot_0 = Service(
        {"x0", "x1"},
        {"clean", "water"},
        {"x0"},
        "x0",
        {
            "x0": {
                "clean": {"x1"},
            },
            "x1": {"water": {"x0"}},
        },
    )

    domain, problem = services_to_pddl([bot_0], formula_pddl)

    Path("domain.pddl").write_text(domain)
    Path("problem.pddl").write_text(problem)
