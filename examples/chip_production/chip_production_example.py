
from pathlib import Path
from typing import Sequence

from pylogics.parsers import parse_ltl
from pylogics.utils.to_string import to_string

from ltlf_goal_oriented_service_composition.declare_utils import build_declare_assumption
from ltlf_goal_oriented_service_composition.rewrite_formula import rewrite
from ltlf_goal_oriented_service_composition.services import Service
from ltlf_goal_oriented_service_composition.to_pddl import services_to_pddl, _START_SYMB

from ltlf_goal_oriented_service_composition.declare_utils import exactly_once, absence_2, alt_succession, alt_precedence, build_declare_assumption, not_coexistence

# all the atomic actions for the task
CLEANING = "cleaning"
FILM_DEPOSITION = "film_deposition"
RESIST_COATING = "resist_coating"
EXPOSURE = "exposure"
CHECK_EXPOSURE = "check_exposure"
DEVELOPMENT = "development"
ETCHING = "etching"
CHECK_ETCHING = "check_etching"
IMPURITIES_IMPLANTATION = "impurities_implantation"
ACTIVATION = "activation"
RESIST_STRIPPING = "resist_stripping"
CHECK_RESIST_STRIPPING = "check_resist_stripping"
ASSEMBLY = "assembly"
TESTING ="testing"
PACKAGING = "packaging"


ALL_SYMBOLS = [
    CLEANING,
    FILM_DEPOSITION,
    RESIST_COATING,
    EXPOSURE,
    DEVELOPMENT,
    ETCHING,
    IMPURITIES_IMPLANTATION,
    ACTIVATION,
    RESIST_STRIPPING,
    ASSEMBLY,
    TESTING,
    PACKAGING
]


def one_state_service(service_name: str, action: str) -> Service:
    return Service(
        {f"{service_name}_0"},
        {action},
        {f"{service_name}_0"},
        f"{service_name}_0",
        {
            f"{service_name}_0": {
                action: {f"{service_name}_0"},
            },
        },
    )


def build_goal(symbols: Sequence[str]):
    assert len(symbols) >= 1
    all_but_one = lambda s: f"{s} & " + " & ".join([f"!{other}" for other in symbols if other != s])
    formula_str = f"F({all_but_one(symbols[0])}"
    nb_open_brackets = 1
    for symbol in symbols[1:]:
        formula_str += f" & F({all_but_one(symbol)}"
        nb_open_brackets += 1
    formula_str += ")" * nb_open_brackets
    return formula_str


if __name__ == "__main__":
    symbols = ALL_SYMBOLS[:4]
    formula_str = build_goal(symbols)
    formula_str = f"{_START_SYMB} & X[!]({formula_str})"
    print(formula_str)
    formula = parse_ltl(formula_str)
    formula_pddl = rewrite(formula)

    all_services = [
        one_state_service(f"handler_{name}", name) for name in symbols
    ]
    domain, problem = services_to_pddl(all_services, formula_pddl)

    Path("domain.pddl").write_text(domain)
    Path("problem.pddl").write_text(problem)
