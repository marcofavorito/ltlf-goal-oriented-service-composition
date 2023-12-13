from pathlib import Path

from pylogics.parsers import parse_ltl

from ltlf_goal_oriented_service_composition.rewrite_formula import rewrite
from ltlf_goal_oriented_service_composition.services import Service
from ltlf_goal_oriented_service_composition.to_pddl import services_to_pddl, _START_SYMB


def get_goal():
    return "clean & X[!]((clean U ((water & X[!](pluck)) | (pluck & X[!](water)))))"


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


def bot_1():
    return Service(
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


def bot_2():
    return Service(
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


if __name__ == "__main__":
    formula_str = f"{_START_SYMB} & X[!]({get_goal()})"
    formula = parse_ltl(formula_str)
    formula_pddl = rewrite(formula)

    domain, problem = services_to_pddl([bot_0(), bot_1(), bot_2()], formula_pddl)

    Path("domain.pddl").write_text(domain)
    Path("problem.pddl").write_text(problem)
