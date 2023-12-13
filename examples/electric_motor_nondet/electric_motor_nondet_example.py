
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

# atomic action outside task
REPAIR = "repair"


def breakable_state_service(service_name: str, action: str) -> Service:
    initial = f"{service_name}_0"
    broken = f"{service_name}_broken"
    return Service(
        {initial, broken},
        {action, REPAIR},
        {initial},
        initial,
        {
            initial: {
                action: {initial, broken},
            },
            broken: {
                REPAIR: {initial}
            }
        },
    )


def build_goal():
    formula_str = f"F({ASSEMBLE_MOTOR})"
    formula_str += f" & (!{ASSEMBLE_MOTOR} U {BUILD_RETRIEVE_ROTOR})"
    formula_str += f" & (!{ASSEMBLE_MOTOR} U {BUILD_RETRIEVE_STATOR})"
    formula_str += f" & (!{ASSEMBLE_MOTOR} U {BUILD_RETRIEVE_INVERTER})"

    return formula_str


if __name__ == "__main__":
    formula_str = build_goal()
    formula_str = f"{_START_SYMB} & X[!]({formula_str})"
    print(formula_str)
    formula = parse_ltl(formula_str)
    formula_pddl = rewrite(formula)

    rotor_builder = breakable_state_service("rotor_builder", BUILD_RETRIEVE_ROTOR)
    stator_builder = breakable_state_service("stator_builder", BUILD_RETRIEVE_STATOR)
    inverter_builder = breakable_state_service("inverter_builder", BUILD_RETRIEVE_INVERTER)
    motor_assembler = breakable_state_service("motor_assembler", ASSEMBLE_MOTOR)
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
