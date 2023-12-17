
from pathlib import Path

from pylogics.parsers import parse_ltl

from ltlf_goal_oriented_service_composition.rewrite_formula import rewrite
from ltlf_goal_oriented_service_composition.services import Service
from ltlf_goal_oriented_service_composition.to_pddl import services_to_pddl, _START_SYMB, final_services_condition

# all the atomic actions for the task
BUILD_STATOR = "build_stator"
BUILD_ROTOR = "build_rotor"
BUILD_INVERTER = "build_inverter"
ASSEMBLE_MOTOR = "assemble_motor"
PAINTING = "painting"
RUNNING_IN = "running_in"
ELECTRIC_TEST = "electric_test"
STATIC_TEST = "static_test"

ALL_SYMBOLS = [
    BUILD_STATOR,
    BUILD_ROTOR,
    BUILD_INVERTER,
    ASSEMBLE_MOTOR,
    ELECTRIC_TEST,
    STATIC_TEST,
]

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
    constraints = []
    # eventually, assemble motor
    constraints.append(f"F({ASSEMBLE_MOTOR})")

    # but not before rotor, stator and inverter have been built
    constraints.append(f"!{ASSEMBLE_MOTOR} U {BUILD_ROTOR}")
    constraints.append(f"!{ASSEMBLE_MOTOR} U {BUILD_STATOR}")
    constraints.append(f"!{ASSEMBLE_MOTOR} U {BUILD_INVERTER}")

    # after assemble, either electric or static test, but not both
    constraints.append(f"!{ELECTRIC_TEST} U {ASSEMBLE_MOTOR}")
    constraints.append(f"!{STATIC_TEST} U {ASSEMBLE_MOTOR}")
    constraints.append(f"F({STATIC_TEST} | {ELECTRIC_TEST})")

    formula_str = " & ".join(map(lambda s: f"({s})", constraints))
    return formula_str


if __name__ == "__main__":
    formula_str = build_goal()
    formula_str = f"{_START_SYMB} & X[!]({formula_str})"
    print(formula_str)
    formula = parse_ltl(formula_str)
    formula_pddl = rewrite(formula)

    rotor_builder = breakable_state_service("rotor_builder", BUILD_ROTOR)
    stator_builder = breakable_state_service("stator_builder", BUILD_STATOR)
    inverter_builder = breakable_state_service("inverter_builder", BUILD_INVERTER)
    motor_assembler = breakable_state_service("motor_assembler", ASSEMBLE_MOTOR)
    mechanical_engineer_1 = breakable_state_service("mechanical_engineer_1", ELECTRIC_TEST)
    mechanical_engineer_2 = breakable_state_service("mechanical_engineer_2", STATIC_TEST)

    all_services = [
        rotor_builder,
        stator_builder,
        inverter_builder,
        motor_assembler,
        mechanical_engineer_1,
        mechanical_engineer_2,
    ]
    domain, problem = services_to_pddl(all_services, formula_pddl)
    services_condition = final_services_condition(all_services)

    Path("domain.pddl").write_text(domain)
    Path("problem.pddl").write_text(problem)
    Path("services_condition.txt").write_text(services_condition)
