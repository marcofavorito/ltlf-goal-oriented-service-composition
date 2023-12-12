
from pathlib import Path

from pylogics.parsers import parse_ltl
from pylogics.utils.to_string import to_string

from ltlf_goal_oriented_service_composition.declare_utils import build_declare_assumption
from ltlf_goal_oriented_service_composition.rewrite_formula import rewrite
from ltlf_goal_oriented_service_composition.services import Service
from ltlf_goal_oriented_service_composition.to_pddl import services_to_pddl, _START_SYMB

from ltlf_goal_oriented_service_composition.declare_utils import exactly_once, absence_2, alt_succession, alt_precedence, build_declare_assumption, not_coexistence

# all the atomic actions for the task
BUILD_RETRIEVE_STATOR = "build_retrieve_stator"
BUILD_RETRIEVE_ROTOR = "build_retrieve_rotor"
BUILD_RETRIEVE_INVERTER = "build_retrieve_inverter"
ASSEMBLE_MOTOR = "assemble_motor"
PAINTING = "painting"
RUNNING_IN = "running_in"
ELECTRIC_TEST = "electric_test"
STATIC_TEST = "static_test"

ALL_SYMBOLS = {
    BUILD_RETRIEVE_STATOR,
    BUILD_RETRIEVE_ROTOR,
    BUILD_RETRIEVE_INVERTER,
    ASSEMBLE_MOTOR,
    PAINTING,
    RUNNING_IN,
    ELECTRIC_TEST,
    STATIC_TEST,
}


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


def build_goal():
    declare_constraints = [
        exactly_once(BUILD_RETRIEVE_STATOR),
        exactly_once(BUILD_RETRIEVE_ROTOR),
        exactly_once(BUILD_RETRIEVE_INVERTER),
        # exactly_once(RUNNING_IN),
        exactly_once(ASSEMBLE_MOTOR),
        alt_succession(BUILD_RETRIEVE_STATOR, ASSEMBLE_MOTOR),
        alt_succession(BUILD_RETRIEVE_ROTOR, ASSEMBLE_MOTOR),
        alt_succession(BUILD_RETRIEVE_INVERTER, ASSEMBLE_MOTOR),
        # alt_succession(ASSEMBLE_MOTOR, RUNNING_IN),
    ]
    formula_str = " & ".join(map(lambda s: f"({s})", declare_constraints))

    formula_str = f"(!{ASSEMBLE_MOTOR} U {BUILD_RETRIEVE_STATOR})"
    formula_str += f" & (!{ASSEMBLE_MOTOR} U {BUILD_RETRIEVE_ROTOR})"
    formula_str += f" & (!{ASSEMBLE_MOTOR} U {BUILD_RETRIEVE_INVERTER})"
    formula_str += f" & F({ASSEMBLE_MOTOR})"

    return formula_str

"""
startsymb & X(G(build_retrieve_stator -> X(!build_retrieve_stator U assemble_motor))& G(build_retrieve_rotor -> X(!build_retrieve_rotor U assemble_motor))& G(build_retrieve_inverter -> X(!build_retrieve_inverter U assemble_motor))& F(build_retrieve_stator)& F(build_retrieve_rotor)& F(build_retrieve_inverter)& F(assemble_motor))
"""


if __name__ == "__main__":
    formula_str = build_goal()
    formula_str = f"{_START_SYMB} & X[!]({formula_str})"
    print(formula_str)
    formula = parse_ltl(formula_str)
    formula_pddl = rewrite(formula)

    rotor_builder = one_state_service("rotor_builder", BUILD_RETRIEVE_ROTOR)
    stator_builder = one_state_service("stator_builder", BUILD_RETRIEVE_STATOR)
    inverter_builder = one_state_service("inverter_builder", BUILD_RETRIEVE_INVERTER)
    motor_assembler = one_state_service("motor_assembler", ASSEMBLE_MOTOR)
    # painter = one_state_service("painter", PAINTING)
    # runner = one_state_service("runner", RUNNING_IN)
    # electric_tester = one_state_service("electric_tester", ELECTRIC_TEST)
    # static_tester = one_state_service("static_tester", STATIC_TEST)

    all_services = [
        rotor_builder,
        stator_builder,
        inverter_builder,
        motor_assembler,
        # painter,
        # runner,
        # electric_tester,
        # static_tester
    ]
    domain, problem = services_to_pddl(all_services, formula_pddl)

    Path("domain.pddl").write_text(domain)
    Path("problem.pddl").write_text(problem)
